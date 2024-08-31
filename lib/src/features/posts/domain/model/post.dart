import 'package:alumni_app/src/features/posts/domain/model/comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? postId;  // Nullable postId since it's unknown at the time of creation
  String postContent;
  String? imageUrl;
  List<CommentModel>? comments;  // Nullable comments field
  Timestamp createdAt;
  int likes;

  PostModel({
    this.postId,  // Set postId after creation
    required this.postContent,
    this.imageUrl,
    this.comments,  // Nullable for the first time
    required this.createdAt,
    required this.likes,
  });

  // Converts PostModel to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'postContent': postContent,
      'imageUrl': imageUrl ?? '',
      'comments': comments?.map((comment) => comment.toJson()).toList(),
      'createdAt': createdAt,
      'likes': likes,
    };
  }

  // Factory function to create a PostModel from a Firestore DocumentSnapshot
  factory PostModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;

    // Retrieve comments, check if they exist before processing
    List<CommentModel>? comments;
    if (data['comments'] != null) {
      comments = (data['comments'] as List<dynamic>).map(
            (commentData) {
          return CommentModel(
            userId: commentData['userId'],
            content: commentData['content'],
            createdAt: commentData['createdAt'],
          );
        },
      ).toList();
    }

    return PostModel(
      postId: snapshot.id,  // The ID of the document from Firestore
      postContent: data['postContent'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      comments: comments,
      createdAt: data['createdAt'] ?? Timestamp.now(),
      likes: data['likes'] ?? 0, // Retrieve userProfilePic from Firestore
    );
  }
}
