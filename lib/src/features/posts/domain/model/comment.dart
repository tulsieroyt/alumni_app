import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel {
  String userId;
  String content;
  Timestamp createdAt;

  CommentModel({
    required this.userId,
    required this.content,
    required this.createdAt,
  });

  // Converts CommentModel to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'content': content,
      'createdAt': createdAt,
    };
  }

  // Factory function to create a CommentModel from a Firestore document
  factory CommentModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return CommentModel(
      userId: data['userId'] ?? '',
      content: data['content'] ?? '',
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }
}