import 'package:alumni_app/src/features/personalization/presentation/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({
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
          'Education:',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        Obx(
          () => profileScreenController.educationInfoList.isEmpty
              ? const SizedBox(height: 200, child: Text('No data found!'))
              : ListView.separated(
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: profileScreenController.educationInfoList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 5),
                  itemBuilder: (context, index) {
                    final educationItem =
                        profileScreenController.educationInfoList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          educationItem.collegeName,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                            '${educationItem.examName}, ${educationItem.examYear}'),
                      ],
                    );
                  },
                ),
        ),
      ],
    );
  }
}
