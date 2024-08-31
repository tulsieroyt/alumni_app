import 'package:alumni_app/src/features/personalization/presentation/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({
    super.key,
    required this.profileScreenController,
  });

  final ProfileScreenController profileScreenController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Experience',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        Obx(
          () => profileScreenController.experienceInfoList.isEmpty
              ? const SizedBox(height: 200, child: Text('No data found!'))
              : ListView.separated(
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: profileScreenController.experienceInfoList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 5),
                  itemBuilder: (context, index) {
                    final educationItem =
                        profileScreenController.experienceInfoList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          educationItem.companyName,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          educationItem.position,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(educationItem.timePeriod),
                      ],
                    );
                  },
                ),
        ),
      ],
    );
  }
}
