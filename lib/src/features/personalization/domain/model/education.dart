import 'package:cloud_firestore/cloud_firestore.dart';

class EducationModel {
  final String collegeName;
  final String examName;
  final String examYear;

  EducationModel({
    required this.collegeName,
    required this.examName,
    required this.examYear,
  });

  // Empty Model
  static EducationModel empty() => EducationModel(
        collegeName: '',
        examName: '',
        examYear: '',
      );

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'CollegeName': collegeName,
      'ExamName': examName,
      'ExamYear': examYear,
    };
  }

  // Get Data from Firebase
  factory EducationModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return EducationModel(
        collegeName: data['CollegeName'] ?? '',
        examName: data['ExamName'] ?? '',
        examYear: data['ExamYear'] ?? '',
      );
    } else {
      return EducationModel.empty();
    }
  }
}
