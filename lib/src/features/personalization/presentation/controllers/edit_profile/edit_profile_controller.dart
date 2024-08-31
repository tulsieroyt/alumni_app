import 'dart:ffi';
import 'dart:io';

import 'package:alumni_app/src/features/authentication/data/model/user_model.dart';
import 'package:alumni_app/src/features/personalization/domain/model/experience_model.dart';
import 'package:alumni_app/src/features/personalization/domain/model/social_link_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/model/education.dart';

class EditProfileController extends GetxController {
  static EditProfileController get instance => Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseFirestore = FirebaseStorage.instance;

  //For image
  File? image;
  final picker = ImagePicker();

  //For basic info
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final session = TextEditingController();

  //For Bio
  final bio = TextEditingController();

  //For Education
  final collegeName = TextEditingController();
  final examName = TextEditingController();
  final examYear = TextEditingController();

  //For experience
  final companyName = TextEditingController();
  final position = TextEditingController();
  final timePeriod = TextEditingController();

  //For Social Link
  final facebook = TextEditingController();
  final github = TextEditingController();
  final linkedin = TextEditingController();

  //For image URL
  RxString profilePicture = ''.obs;

  RxList<EducationModel> educationList = <EducationModel>[].obs;
  RxList<ExperienceModel> experienceList = <ExperienceModel>[].obs;
  Rx<SocialLinkModel> socialLinkModel = SocialLinkModel
      .empty()
      .obs;

  Rx<UserModel> userModel = UserModel
      .empty()
      .obs;

  GlobalKey<FormState> educationFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> experienceFormKey = GlobalKey<FormState>();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  @override
  onReady() {
    getBasicInfo();
    getBio();
    getEducationList();
    getExperienceList();
    getSocialLink();
  }

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      if (kDebugMode) {
        print("No image selected.");
      }
    }
    update();
  }

  Future<void> updateImage() async {
    try {
      String imageUrl = '';

      // Check if a new image is selected
      if (image != null) {
        // Delete the old image if it exists
        print(profilePicture.value);
        print('Hello Test');
        if (profilePicture.value.isNotEmpty) {
          final oldStorageRef =
          FirebaseStorage.instance.refFromURL(profilePicture.value);
          await oldStorageRef.delete();
        }

        // Generate a unique name for the new image
        var imageName = DateTime
            .now()
            .microsecondsSinceEpoch
            .toString();
        var newStorageRef =
        FirebaseStorage.instance.ref().child('user/$imageName.jpg');

        // Upload the new image
        UploadTask uploadTask = newStorageRef.putFile(image!);
        TaskSnapshot snapshot = await uploadTask;

        if (snapshot.state == TaskState.success) {
          // Get the download URL of the new image
          imageUrl = await snapshot.ref.getDownloadURL();

          // Update the user's profile picture in Firestore
          final DocumentReference updateImageRef =
          FirebaseFirestore.instance.collection('Users').doc(
              FirebaseAuth.instance.currentUser!.uid);
          await updateImageRef.update({'ProfilePicture': imageUrl});

          // Update local state if necessary
          profilePicture.value = imageUrl;

          Get.snackbar("Success", "Profile picture updated successfully.");
        } else {
          final DocumentReference updateImageRef =
          FirebaseFirestore.instance.collection('Users').doc(
              FirebaseAuth.instance.currentUser!.uid);
          await updateImageRef.update({'ProfilePicture': ''});
          Get.snackbar("Error", "Failed to upload image.");
          return;
        }
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }

  getBasicInfo() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userBasicInfo =
      await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .get();

      if (userBasicInfo.exists) {
        userModel.value = UserModel.fromSnapshot(userBasicInfo);
        firstName.text = userModel.value.firstName;
        lastName.text = userModel.value.lastName;
        email.text = userModel.value.email;
        phoneNumber.text = userModel.value.phoneNumber;
        session.text = userModel.value.session;
        profilePicture.value = userModel.value.profilePicture;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  //Update basic info
  Future<void> updateBasicInfo() async {
    try {
      final DocumentReference updateRef = _firestore.collection('Users').doc(
          FirebaseAuth.instance.currentUser!.uid);
      //Create new User Model
      var newModel = UserModel(id: _auth.currentUser!.uid,
          firstName: firstName.value.text,
          lastName: lastName.value.text,
          userName: '',
          email: email.value.text,
          phoneNumber: phoneNumber.value.text,
          session: session.value.text,
          profilePicture: profilePicture.value);

      await updateRef.update(newModel.toJson());
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> getBio() async {
    try {
      DocumentSnapshot userBio = await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .get();

      if (userBio.exists) {
        String bioData = userBio.get("Bio") ?? " ";
        bio.text = bioData;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  updateBio() async {
    try {
      DocumentReference newBioRef =
      _firestore.collection('Users').doc(_auth.currentUser!.uid);
      await newBioRef.update({'Bio': bio.text.trim()});
    } catch (e) {
      throw e.toString();
    }
  }

  //Save education information
  saveEducationInfo() async {
    try {
      // Validate the form
      if (!educationFormKey.currentState!.validate()) {
        return 'Please fill up the form';
      }

      // Create a reference to the new document in the Education sub-collection
      final DocumentReference newEducationRef = _firestore
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .collection('Education')
          .doc();

      // Create new education data
      final EducationModel newEducationInfo = EducationModel(
        collegeName: collegeName.text.trim(),
        examName: examName.text.trim(),
        examYear: examYear.text.trim(),
      );

      // Upload data to Firebase
      await newEducationRef.set(newEducationInfo.toJson());

      // Call getEducationList to refresh the data in the list after successful addition
      await getEducationList();

      // Print success in debug mode
      if (kDebugMode) {
        print('Updated Successfully');
      }

      // Close the dialog and go back
      Get.back();
    } catch (e) {
      throw e.toString();
    }
  }

  //Get Education information
  getEducationList() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> eduList = await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .collection('Education')
          .get();

      educationList.clear();
      for (var doc in eduList.docs) {
        educationList.add(EducationModel.fromSnapshot(doc));
      }
    } catch (e) {
      throw e.toString();
    }
  }

  //Save Experience information
  saveExperienceInformation() async {
    try {
      if (!experienceFormKey.currentState!.validate()) {
        return 'Please fill up the form';
      }

      // Create a reference to the new document in the Education sub-collection
      final DocumentReference newExperienceRef = _firestore
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .collection('Experience')
          .doc();

      // Create new education data
      final ExperienceModel newExperienceInfo = ExperienceModel(
        companyName: companyName.text.trim(),
        position: position.text.trim(),
        timePeriod: timePeriod.text.trim(),
      );

      // Upload data to Firebase
      await newExperienceRef.set(newExperienceInfo.toJson());

      // Call getEducationList to refresh the data in the list after successful addition
      await getExperienceList();

      // Print success in debug mode
      if (kDebugMode) {
        print('Updated Successfully');
      }

      // Close the dialog and go back
      Get.back();
    } catch (e) {
      throw e.toString();
    }
  }

  //Get experience list
  getExperienceList() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> eduList = await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .collection('Experience')
          .get();

      experienceList.clear();
      for (var doc in eduList.docs) {
        experienceList.add(ExperienceModel.fromSnapshot(doc));
      }
    } catch (e) {
      throw e.toString();
    }
  }

  //Save social link information
  saveSocialLink() async {
    try {
      // Check if all fields are empty
      if (facebook.text.isEmpty &&
          github.text.isEmpty &&
          linkedin.text.isEmpty) {
        return 'Please provide at least one social link.';
      }

      final DocumentReference socialLinkRef = _firestore
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .collection('SocialLinks')
          .doc('SocialLink'); // Assuming a single document for social links

      // Check if the document already exists
      final DocumentSnapshot docSnapshot = await socialLinkRef.get();
      if (docSnapshot.exists) {
        getSocialLink();
      }

      final SocialLinkModel socialLinkModel = SocialLinkModel(
        facebook: facebook.text.trim(),
        github: github.text.trim(),
        linkedin: linkedin.text.trim(),
      );

      if (docSnapshot.exists) {
        await socialLinkRef.update(socialLinkModel.toJson());
        if (kDebugMode) {
          print('Social links updated successfully.');
        }
      } else {
        // If the document doesn't exist, set a new one
        await socialLinkRef.set(socialLinkModel.toJson());
        if (kDebugMode) {
          print('Social links added successfully.');
        }
      }

      // Close the dialog or any overlay if applicable
      getSocialLink();
      Get.back();
    } catch (e) {
      throw e.toString();
    }
  }

  //Get social link
  getSocialLink() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> newData = await _firestore
          .collection('Users')
          .doc(_auth.currentUser!.uid)
          .collection('SocialLinks')
          .doc('SocialLink')
          .get();

      if (newData.exists) {
        socialLinkModel.value = SocialLinkModel.fromSnapShot(newData);

        // Set the values to the corresponding controllers after data is fetched
        facebook.text = socialLinkModel.value.facebook;
        github.text = socialLinkModel.value.github;
        linkedin.text = socialLinkModel.value.linkedin;

        if (kDebugMode) {
          print('Social link data fetched and set to controllers.');
        }
      } else {
        socialLinkModel.value = SocialLinkModel.empty();
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
