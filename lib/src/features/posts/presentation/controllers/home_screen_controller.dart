import 'package:alumni_app/src/features/authentication/data/model/user_model.dart';
import 'package:alumni_app/src/features/posts/domain/model/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../domain/model/user_post_model.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController get instance => Get.find();

  // Firebase variables
  final _fireStore = FirebaseFirestore.instance;

  // RxLists to hold PostModel and UserPostModel data
  RxList<PostModel> posts = <PostModel>[].obs;
  RxList<UserPostModel> userPosts = <UserPostModel>[].obs;

  @override
  void onInit() {
    fetchAllPosts();
    super.onInit();
  }

  // Fetch all posts and associated user data
  Future<void> fetchAllPosts() async {
    // Fetch all documents from the `userPosts` collection
    QuerySnapshot userPostsSnapshot = await _fireStore.collection('userPosts').get();

    // Clear the existing posts and userPosts list
    posts.clear();
    userPosts.clear();

    // Loop through each document in the userPosts collection
    for (var userPostDoc in userPostsSnapshot.docs) {
      // Extract userId and postId from the userPosts document
      String userId = userPostDoc['userId'];
      String postId = userPostDoc['postId'];

      // Fetch the post information using postId
      DocumentSnapshot postDoc = await _fireStore.collection('posts').doc(postId).get();

      if (postDoc.exists) {
        // Convert postDoc to PostModel
        PostModel post = PostModel.fromSnapshot(postDoc);

        // Fetch the user information using userId
        DocumentSnapshot userDoc = await _fireStore.collection('Users').doc(userId).get();

        if (userDoc.exists) {
          // Convert userDoc to UserModel
          UserModel user = UserModel.fromSnapshot(userDoc as DocumentSnapshot<Map<String, dynamic>>);

          // Create UserPostModel and add it to the list
          userPosts.add(UserPostModel(user: user, post: post));
        }
      }
    }
    if (kDebugMode) {
      print(userPosts);
    }
  }
}
