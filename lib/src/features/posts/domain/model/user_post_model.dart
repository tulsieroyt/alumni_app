import 'package:alumni_app/src/features/posts/domain/model/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../authentication/data/model/user_model.dart';

class UserPostModel {
  final UserModel user;
  final PostModel post;

  UserPostModel({
    required this.user,
    required this.post,
  });

  /// Convert the UserPostModel to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'post': post.toJson(),
    };
  }

  /// Factory method to create a UserPostModel from a Firestore QuerySnapshot
  static Future<UserPostModel> fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) async {
    final data = snapshot.data();

    // Fetch the user document from the reference
    final userDoc = await snapshot.reference
        .firestore // Get Firestore instance from the snapshot reference
        .collection('users')
        .doc(data['userId'])
        .get();

    // Fetch the post document from the reference
    final postDoc = await snapshot.reference
        .firestore // Get Firestore instance from the snapshot reference
        .collection('posts')
        .doc(data['postId'])
        .get();

    // Convert the snapshots to models
    final UserModel user = UserModel.fromSnapshot(userDoc);
    final PostModel post = PostModel.fromSnapshot(postDoc);

    return UserPostModel(
      user: user,
      post: post,
    );
  }

  /// Static method to create a UserPostModel from Firestore DocumentSnapshot
  static Future<UserPostModel> fromDocSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) async {
    final data = snapshot.data()!;

    // Fetch the user document from the reference
    final userDoc = await snapshot.reference
        .firestore // Get Firestore instance from the snapshot reference
        .collection('users')
        .doc(data['userId'])
        .get();

    // Fetch the post document from the reference
    final postDoc = await snapshot.reference
        .firestore // Get Firestore instance from the snapshot reference
        .collection('posts')
        .doc(data['postId'])
        .get();

    // Convert the snapshots to models
    final UserModel user = UserModel.fromSnapshot(userDoc);
    final PostModel post = PostModel.fromSnapshot(postDoc);

    return UserPostModel(
      user: user,
      post: post,
    );
  }
}
