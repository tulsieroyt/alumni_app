import 'package:alumni_app/src/features/jobs/presentation/controllers/job_screen_controller.dart';
import 'package:alumni_app/src/features/jobs/presentation/screen/job_details_screen.dart';
import 'package:alumni_app/src/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final jobScreenController = Get.put(JobScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Jobs'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Search'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: const Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'All Jobs',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: jobScreenController.userJobModelList.length,
                  separatorBuilder: (_, __) => const Divider(height: 3),
                  itemBuilder: (context, index) {
                    final singleJob = jobScreenController.userJobModelList[index];
                    print(singleJob);
                    return InkWell(
                      onTap: () {
                        Get.to(JobDetailsScreen(userJobModel: singleJob));
                      },
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              height: 50,
                              width: 50,
                              child: const Image(
                                image:
                                AssetImage('assets/image/facebook-logo.png'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    singleJob.job.jobTitle,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    singleJob.job.companyName,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(singleJob.job.location),
                                  Text(
                                    '7 hours ago',
                                    style: TextStyle(
                                        color: AppThemeData.primaryColor),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
