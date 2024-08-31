import 'package:alumni_app/src/common/repositories/authentication_repository.dart';
import 'package:alumni_app/src/features/authentication/data/model/user_model.dart';
import 'package:alumni_app/src/features/authentication/presentation/screens/signin/signin_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/repositories/user_repository.dart';

class SignupController extends GetxController {
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final session = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  Future<void> createAccount() async {
    try {
      final userCredit =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      //Save authentication data to firebase storage
      final newUser = UserModel(
        id: userCredit.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        session: session.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      if (kDebugMode) {
        print('Sign up successful');
      }

      Get.to(const SignInScreen());
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }
}
