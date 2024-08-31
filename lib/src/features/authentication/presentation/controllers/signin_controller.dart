import 'package:alumni_app/src/common/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/controller/user_controller.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  Future<void> signInWithEmailAndPassword() async {
    try {
      if (loginFormKey.currentState!.validate()) {
        await AuthenticationRepository.instance.loginWihEmailAndPassword(
          email.text.trim(),
          password.text.trim(),
        );
      }

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      throw 'e';
    }
  }
}
