import '../../../personalization/domain/model/user.dart';

class Post {
  final String postText;
  final bool isImage;
  final String? postImageUrl;
  final int likeCount;
  final User user;

  Post({
    required this.postText,
    required this.isImage,
    this.postImageUrl,
    required this.likeCount,
    required this.user,
  });

  //fromJson Constructor
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postText: json['postText'],
      isImage: json['isImage'],
      postImageUrl: json['postImageUrl'],
      likeCount: json['likeCount'],
      user: User.fromJson(json['user']),
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'postText': postText,
      'isImage': isImage,
      'postImageUrl': postImageUrl,
      'likeCount': likeCount,
      'user': user.toJson(),
    };
  }
}
