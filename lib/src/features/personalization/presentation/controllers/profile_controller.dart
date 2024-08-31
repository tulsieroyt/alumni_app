import 'package:alumni_app/src/common/repositories/authentication_repository.dart';
import 'package:alumni_app/src/features/authentication/data/model/user_model.dart';
import 'package:alumni_app/src/features/personalization/domain/model/education.dart';
import 'package:alumni_app/src/features/personalization/domain/model/experience_model.dart';
import 'package:alumni_app/src/features/personalization/domain/model/social_link_model.dart';
import 'package:alumni_app/src/features/personalization/presentation/screen/edit_profile/edit_profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String userId;

  User user = FirebaseAuth.instance.currentUser!;

  RxString bio = ''.obs;
  RxList<EducationModel> educationInfoList = <EducationModel>[].obs;
  RxList<ExperienceModel> experienceInfoList = <ExperienceModel>[].obs;
  Rx<SocialLinkModel> socialLinkModel = SocialLinkModel.empty().obs;
  Rx<UserModel> userBasicInfo = UserModel.empty().obs;

  ProfileScreenController({required this.userId});

  @override
  void onReady() {
    getBio();
    getEducationInfo();
    getExperienceInfo();
    getSocialLinks();
    getBasicInfo();
    super.onReady();
  }

  void onMenuItemSelected(String value) {
    switch (value) {
      case 'edit':
        Get.to(() => const EditProfileScreen());
        break;
      case 'logout':
        AuthenticationRepository().logout();
        break;
      case 'delete':
        if (kDebugMode) {
          print('Delete Profile clicked');
        }
        break;
    }
  }

  //Get basic info
  getBasicInfo() async {
    try {
      print(userId);
      final DocumentSnapshot<Map<String, dynamic>> basicInfo = await _firestore
          .collection('Users')
          .doc(userId)
          .get();

      if (basicInfo.exists) {
        userBasicInfo.value = UserModel.fromSnapshot(basicInfo);
      }

      if (kDebugMode) {
        print(userBasicInfo.value.firstName);
        print(userBasicInfo.value.profilePicture);
        print(userBasicInfo.value.session);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  //Get bio data
  Future<void> getBio() async {
    try {
      DocumentSnapshot userBio = await _firestore
          .collection('Users')
          .doc(userId)
          .get();

      if (userBio.exists) {
        String bioData = userBio.get("Bio") ?? " ";
        bio.value = bioData;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  //Get education information
  getEducationInfo() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> eduList = await _firestore
          .collection('Users')
          .doc(userId)
          .collection('Education')
          .get();

      educationInfoList.clear();
      for (var doc in eduList.docs) {
        educationInfoList.add(EducationModel.fromSnapshot(doc));
      }
    } catch (e) {
      throw e.toString();
    }
  }

  //Get experience info
  getExperienceInfo() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> eduList = await _firestore
          .collection('Users')
          .doc(userId)
          .collection('Experience')
          .get();

      experienceInfoList.clear();
      for (var doc in eduList.docs) {
        experienceInfoList.add(ExperienceModel.fromSnapshot(doc));
      }
    } catch (e) {
      throw e.toString();
    }
  }

  getSocialLinks() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> socialLinks =
      await _firestore
          .collection('Users')
          .doc(userId)
          .collection('SocialLinks')
          .doc('SocialLink')
          .get();

      if (socialLinks.exists) {
        socialLinkModel.value = SocialLinkModel.fromSnapShot(socialLinks);
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

