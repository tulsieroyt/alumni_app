import 'package:flutter/material.dart';

import '../features/authentication/presentation/screens/signin/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      ///---Move to next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Image(
              height: 100,
              width: 100,
              image: AssetImage('assets/image/logo.png'),
            ),
          ),
          Spacer(),
          CircularProgressIndicator(),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
