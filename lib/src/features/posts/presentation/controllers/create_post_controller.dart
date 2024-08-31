import 'dart:io';
import 'package:alumni_app/src/features/posts/domain/model/post.dart';
import 'package:alumni_app/src/features/posts/presentation/controllers/home_screen_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../authentication/data/model/user_model.dart';
import '../../domain/model/user_post_model.dart';

// CreatePostController

class CreatePostController extends GetxController {
  static CreatePostController get instance => Get.find();

  // Inject HomeScreenController
  final HomeScreenController homeController = Get.find();

  final _fireStore = FirebaseFirestore.instance;
  final _firebaseStorage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;

  File? image;
  final picker = ImagePicker();
  final postContent = TextEditingController();

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      if (kDebugMode) {
        print("No image selected.");
      }
    }
    update();
  }

  Future<void> createPost() async {
    try {
      if (postContent.text.trim().isEmpty) {
        Get.snackbar("Error", "Post content cannot be empty.");
        return;
      }

      DocumentReference newPostRef = _fireStore.collection('posts').doc();
      String imageUrl = '';

      if (image != null) {
        var imageName = DateTime.now().microsecondsSinceEpoch.toString();
        var storageRef =
        _firebaseStorage.ref().child('posts_image/$imageName.jpg');

        UploadTask uploadTask = storageRef.putFile(image!);
        TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

        if (snapshot.state == TaskState.success) {
          imageUrl = await snapshot.ref.getDownloadURL();
        } else {
          Get.snackbar("Error", "Failed to upload image.");
          return;
        }
      }

      final newPost = PostModel(
        postId: '',
        postContent: postContent.text.trim(),
        imageUrl: imageUrl,
        comments: null,
        likes: 0,
        createdAt: Timestamp.now(),
      );

      await newPostRef.set(newPost.toJson());

      String postId = newPostRef.id;
      await newPostRef.update({'postId': postId});

      await createUserPostEntity(_auth.currentUser!.uid, postId);

      // Add the new post to the HomeScreenController's RxLists
      newPost.postId = postId; // Update the postId for the PostModel
      homeController.posts.add(newPost);

      // Fetch the user information using userId
      DocumentSnapshot userDoc = await _fireStore.collection('Users').doc(_auth.currentUser!.uid).get();

      if (userDoc.exists) {
        UserModel user = UserModel.fromSnapshot(userDoc as DocumentSnapshot<Map<String, dynamic>>);

        // Create UserPostModel and add it to the list
        homeController.userPosts.add(UserPostModel(user: user, post: newPost));
      }

      getBack();
    } catch (e) {
      Get.snackbar("Error", "Failed to create post. ${e.toString()}");
    }
  }

  Future<void> createUserPostEntity(String userId, String postId) async {
    await _fireStore.collection('userPosts').add({
      'userId': userId,
      'postId': postId,
    });
  }

  getBack() {
    postContent.clear();
    Get.back();
  }

  @override
  void onClose() {
    postContent.dispose();
    super.onClose();
  }
}

