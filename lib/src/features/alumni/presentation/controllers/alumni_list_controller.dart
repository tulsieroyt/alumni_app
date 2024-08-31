import 'package:alumni_app/src/features/authentication/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AlumniListController extends GetxController {
  static AlumniListController get instance => Get.find();

  final _fireStore = FirebaseFirestore.instance;

  final String userId = FirebaseAuth.instance.currentUser!.uid;

  //Variable
  RxList<UserModel> allAlumniList = <UserModel>[].obs;

  @override
  void onReady() {
    getAllUserList();
    super.onReady();
  }

  //get All user list
  getAllUserList() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> eduList =
          await _fireStore.collection('Users').get();

      allAlumniList.clear();
      for (var doc in eduList.docs) {
        allAlumniList.add(UserModel.fromSnapshot(doc));
      }

      if (kDebugMode) {
        print(allAlumniList);
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
