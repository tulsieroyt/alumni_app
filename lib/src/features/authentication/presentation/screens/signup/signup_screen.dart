import 'package:alumni_app/src/features/authentication/presentation/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/divider_widget.dart';
import '../../../../../common/widgets/social_buttons.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignupController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: signUpController.signUpFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: kToolbarHeight / 2,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                const SizedBox(
                  height: 150,
                  child: Center(
                    child: Text(
                      'Create Your Account',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                TextFormField(
                  controller: signUpController.firstName,
                  decoration: const InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your First Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: signUpController.lastName,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your Last Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: signUpController.email,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your Email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: signUpController.phoneNumber,
                  decoration: const InputDecoration(labelText: 'Mobile'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your Mobile Number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: signUpController.session,
                  decoration: const InputDecoration(labelText: 'Session'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your session';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: signUpController.password,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => signUpController.createAccount(),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const DividerWidget(
                  text: 'or sign up with',
                ),
                const SizedBox(height: 24),
                const SocialButtons()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
