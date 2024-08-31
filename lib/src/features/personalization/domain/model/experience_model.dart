import 'package:cloud_firestore/cloud_firestore.dart';

class ExperienceModel {
  final String companyName;
  final String position;
  final String timePeriod;

  ExperienceModel({
    required this.companyName,
    required this.position,
    required this.timePeriod,
  });

  // Empty Model
  static ExperienceModel empty() =>
      ExperienceModel(companyName: '', position: '', timePeriod: '');

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'CompanyName': companyName,
      'Position': position,
      'TimePeriod': timePeriod,
    };
  }

  // Get data from Firebase snapshot
  factory ExperienceModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    if (data != null) {
      return ExperienceModel(
        companyName: data['CompanyName'] ?? '',
        position: data['Position'] ?? '',
        timePeriod: data['TimePeriod'] ?? '',
      );
    } else {
      return ExperienceModel.empty();
    }
  }
}
