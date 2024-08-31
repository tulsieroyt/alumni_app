import 'package:alumni_app/src/features/jobs/domain/model/job_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'job_screen_controller.dart';

class CreateJobPostController extends GetxController {
  static CreateJobPostController get instance => Get.find();

  // Initializing text editing controllers
  final jobTitle = TextEditingController();
  final companyName = TextEditingController();
  final location = TextEditingController();
  final salaryRange = TextEditingController();
  final applyLink = TextEditingController();
  final jobDetails = TextEditingController();
  GlobalKey<FormState> jobFormKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  // Creating job post
  createJobPost() async {
    try {
      if (!jobFormKey.currentState!.validate()) {
        return;
      }

      final DocumentReference jobReference =
          _fireStore.collection('Jobs').doc();

      var jobModel = JobModel(
        jobId: jobReference.id,
        jobTitle: jobTitle.text.trim(),
        companyName: companyName.text.trim(),
        location: location.text.trim(),
        salaryRange: salaryRange.text.trim(),
        jobDetails: jobDetails.text.trim(),
        applyLink: applyLink.text.trim(),
        createdAt: Timestamp.now(),
      );

      await jobReference.set(jobModel.toJson());

      await createUserJobEntity(_auth.currentUser!.uid, jobReference.id);

      JobScreenController jobScreenController = JobScreenController.instance;
      await jobScreenController.getAllJobs();

      Get.back();

    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> createUserJobEntity(String userId, String postId) async {
    await _fireStore.collection('userJobs').add({
      'userId': userId,
      'jobId': postId,
      'createdAt': Timestamp.now(),
    });
  }
}
