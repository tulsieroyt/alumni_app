import 'package:cloud_firestore/cloud_firestore.dart';

class SocialLinkModel {
  final String facebook;
  final String github;
  final String linkedin;

  SocialLinkModel(
      {required this.facebook, required this.github, required this.linkedin});

  //Empty model
  static SocialLinkModel empty() =>
      SocialLinkModel(facebook: '', github: '', linkedin: '');

  //map to json
  Map<String, dynamic> toJson() {
    return {
      'Facebook': facebook,
      'Github': github,
      'Linkedin': linkedin,
    };
  }

  // Firebase to map
  factory SocialLinkModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    if (data != null) {
      return SocialLinkModel(
          facebook: data['Facebook'] ?? '',
          github: data['Github'] ?? '',
          linkedin: data['Linkedin'] ?? '');
    } else {
      return SocialLinkModel.empty();
    }
  }
}
