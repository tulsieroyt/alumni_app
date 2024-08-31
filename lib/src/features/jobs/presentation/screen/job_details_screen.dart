import 'package:alumni_app/src/features/jobs/domain/model/job_user_model.dart';
import 'package:alumni_app/src/features/personalization/presentation/screen/profile_screen.dart';
import 'package:alumni_app/src/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({super.key, required this.userJobModel});

  final UserJobModel userJobModel;

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppThemeData.primaryColor,
        title: const Text('Job Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.userJobModel.job.jobTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          widget.userJobModel.job.companyName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(widget.userJobModel.job.location),
                        Text('Salary: ${widget.userJobModel.job.salaryRange}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('Posted by: '),
                            InkWell(
                              onTap: () {
                                print(widget.userJobModel.user.id);
                                Get.to(()=> ProfileScreen(userId: widget.userJobModel.user.id,));
                              } ,
                              child: Text(
                                '${widget.userJobModel.user.firstName} ${widget.userJobModel.user.lastName}',
                                style: const TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "20 hours ago",
                          style: TextStyle(color: AppThemeData.primaryColor),
                        )
                      ],
                    ),
                    const Divider(height: 1),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Details',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(widget.userJobModel.job.jobDetails)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Apply'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Save'),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
