import 'package:alumni_app/src/features/jobs/domain/model/job_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../authentication/data/model/user_model.dart';
import '../../domain/model/job_model.dart';

class JobScreenController extends GetxController {
  static JobScreenController get instance => Get.find();

  // Firebase instance
  final _fireStore = FirebaseFirestore.instance;

  // RxList to hold UserJobModel data
  RxList<UserJobModel> userJobModelList = <UserJobModel>[].obs;

  @override
  void onInit() {
    getAllJobs();
    super.onInit();
  }

  // Fetch all jobs and associated user data
  Future<void> getAllJobs() async {
    try {
      // Fetch all documents from the `jobuser` collection
      QuerySnapshot jobUserSnapshot = await _fireStore.collection('userJobs').get();

      // Clear the existing userJobModelList
      userJobModelList.clear();

      // Loop through each document in the jobuser collection
      for (var jobUserDoc in jobUserSnapshot.docs) {
        // Extract userId and jobId from the jobuser document
        String userId = jobUserDoc['userId'];
        String jobId = jobUserDoc['jobId'];

        // Fetch the job information using jobId
        DocumentSnapshot jobDoc = await _fireStore.collection('Jobs').doc(jobId).get();

        if (jobDoc.exists) {
          // Convert jobDoc to JobModel (Assuming you have a JobModel similar to PostModel)
          JobModel job = JobModel.fromSnapshot(jobDoc);

          // Fetch the user information using userId
          DocumentSnapshot userDoc = await _fireStore.collection('Users').doc(userId).get();

          if (userDoc.exists) {
            // Convert userDoc to UserModel
            UserModel user = UserModel.fromSnapshot(userDoc as DocumentSnapshot<Map<String, dynamic>>);

            // Create UserJobModel and add it to the list
            userJobModelList.add(UserJobModel(user: user, job: job));
          }
        }
      }
    } catch (e) {
      print('Error fetching jobs: ${e.toString()}');
    }
  }
}
