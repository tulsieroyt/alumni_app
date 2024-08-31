import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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
