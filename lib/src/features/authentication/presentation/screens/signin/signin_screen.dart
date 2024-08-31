import 'package:alumni_app/src/features/authentication/presentation/controllers/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/divider_widget.dart';
import '../../../../../common/widgets/social_buttons.dart';
import '../signup/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final signInController = Get.put(SignInController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: signInController.loginFormKey,
            child: Column(
              children: [
                const SizedBox(height: 250),
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: signInController.email,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: signInController.password,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        signInController.signInWithEmailAndPassword(),
                    child: const Text('Sign In'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const DividerWidget(
                  text: 'or sign in with',
                ),
                const SizedBox(height: 16),
                const SocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
