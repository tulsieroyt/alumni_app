import 'package:alumni_app/src/features/jobs/presentation/controllers/create_job_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateJobPostScreen extends StatefulWidget {
  const CreateJobPostScreen({super.key});

  @override
  State<CreateJobPostScreen> createState() => _CreateJobPostScreenState();
}

class _CreateJobPostScreenState extends State<CreateJobPostScreen> {
  final createJobPostController = Get.put(CreateJobPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Text(
                      'Create Job Post',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.more_vert)
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white10,
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: createJobPostController.jobFormKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: createJobPostController.jobTitle,
                              decoration:
                                  const InputDecoration(labelText: 'Job Title'),
                              validator: (value) {
                                if (value?.trim().isEmpty ?? true) {
                                  return 'Enter your job title!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: createJobPostController.companyName,
                              decoration: const InputDecoration(
                                  labelText: 'Company Name'),
                              validator: (value) {
                                if (value?.trim().isEmpty ?? true) {
                                  return 'Enter your company name!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: createJobPostController.location,
                              decoration:
                                  const InputDecoration(labelText: 'Location'),
                              validator: (value) {
                                if (value?.trim().isEmpty ?? true) {
                                  return 'Enter your location.';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: createJobPostController.salaryRange,
                              decoration: const InputDecoration(
                                  labelText: 'Salary Range'),
                              validator: (value) {
                                if (value?.trim().isEmpty ?? true) {
                                  return 'Enter your salary range!';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: createJobPostController.applyLink,
                              decoration: const InputDecoration(
                                  labelText: 'Application Link'),
                              validator: (value) {
                                if (value?.trim().isEmpty ?? true) {
                                  return 'Enter your Application Link';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              maxLines: null,
                              controller: createJobPostController.jobDetails,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Write details...',
                              ),
                              validator: (value) {
                                if (value?.trim().isEmpty ?? true) {
                                  return 'Must write something...';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => createJobPostController.createJobPost(),
                    child: const Text('Post'),
                  ),
                ),
                const SizedBox(height: 16)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
