import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  final String jobId;  // Add this field to store the document ID
  final String jobTitle;
  final String companyName;
  final String location;
  final String salaryRange;
  final String jobDetails;
  final String applyLink;
  final Timestamp createdAt;

  // Constructor
  JobModel({
    required this.jobId,  // Pass the document ID here
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.salaryRange,
    required this.jobDetails,
    required this.applyLink,
    required this.createdAt,
  });

  JobModel.empty()
      : jobId = '',
        jobTitle = '',
        companyName = '',
        location = '',
        salaryRange = '',
        jobDetails = '',
        applyLink = '',
        createdAt = Timestamp.now();

  Map<String, dynamic> toJson() {
    return {
      'jobTitle': jobTitle,
      'companyName': companyName,
      'location': location,
      'salaryRange': salaryRange,
      'jobDetails': jobDetails,
      'applyLink': applyLink,
      'createdAt': createdAt,
    };
  }

  factory JobModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return JobModel(
      jobId: snapshot.id,  // Assign the document ID to jobId
      jobTitle: data['jobTitle'] ?? '',
      companyName: data['companyName'] ?? '',
      location: data['location'] ?? '',
      salaryRange: data['salaryRange'] ?? '',
      jobDetails: data['jobDetails'] ?? '',
      applyLink: data['applyLink'] ?? '',
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }
}
