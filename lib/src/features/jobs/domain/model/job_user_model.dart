import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../authentication/data/model/user_model.dart';
import 'job_model.dart';

class UserJobModel {
  final UserModel user;
  final JobModel job;

  UserJobModel({
    required this.user,
    required this.job,
  });

  /// Convert the UserJobModel to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'job': job.toJson(),
      'jobId': job.jobId,  // Include jobId when storing UserJobModel
    };
  }

  /// Factory method to create a UserJobModel from a Firestore QuerySnapshot
  static Future<UserJobModel> fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) async {
    final data = snapshot.data();

    // Fetch the user document from the reference
    final userDoc = await snapshot.reference
        .firestore // Get Firestore instance from the snapshot reference
        .collection('users')
        .doc(data['userId'])
        .get();

    // Fetch the job document using jobId
    final jobDoc = await snapshot.reference
        .firestore
        .collection('jobs')
        .doc(data['jobId'])
        .get();

    // Convert the snapshots to models
    final UserModel user = UserModel.fromSnapshot(userDoc);
    final JobModel job = JobModel.fromSnapshot(jobDoc);

    return UserJobModel(
      user: user,
      job: job,
    );
  }

  /// Static method to create a UserJobModel from Firestore DocumentSnapshot
  static Future<UserJobModel> fromDocSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) async {
    final data = snapshot.data()!;

    // Fetch the user document from the reference
    final userDoc = await snapshot.reference
        .firestore // Get Firestore instance from the snapshot reference
        .collection('users')
        .doc(data['userId'])
        .get();

    // Fetch the job document using jobId
    final jobDoc = await snapshot.reference
        .firestore
        .collection('jobs')
        .doc(data['jobId'])
        .get();

    // Convert the snapshots to models
    final UserModel user = UserModel.fromSnapshot(userDoc);
    final JobModel job = JobModel.fromSnapshot(jobDoc);

    return UserJobModel(
      user: user,
      job: job,
    );
  }
}
