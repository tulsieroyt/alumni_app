import 'package:alumni_app/src/features/personalization/presentation/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BioSection extends StatelessWidget {
  const BioSection({
    super.key, required this.profileScreenController
  });


  final ProfileScreenController profileScreenController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bio',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        Obx(() {
          return Text(profileScreenController.bio.value);
        })
      ],
    );
  }
}
