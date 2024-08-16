import 'package:alumni_app/src/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({super.key});

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
                        const Text(
                          'Flutter Developer',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const Text(
                          'Vivasoft Ltd',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const Text('Dhaka Bangladesh'),
                        const Text('Posted by: Tulsie Chandra Barman'),
                        Text(
                          "20 hours ago",
                          style: TextStyle(color: AppThemeData.primaryColor),
                        )
                      ],
                    ),
                    Divider(height: 1),
                    Column(
                      children: [
                        Text('About this job'),
                        Text('''Company Description
                        Hi there! We are Priority Soft. We build mobile applications using Flutter and are currently looking to expand our team


                            Role Description

                            This is a full-time remote role for a Flutter Developer. The Flutter Developer will be responsible for the development and implementation of mobile applications using the Flutter framework. They will collaborate with cross-functional teams to design, develop, and maintain high-quality Flutter applications. The Flutter Developer will also perform debugging, testing, and code reviews to ensure application functionality and code quality.


                            Qualifications

                            Computer Science and Software Development skills
                            Experience in Back-End Web Development
                            Proficiency in Programming and Object-Oriented Programming (OOP)
                        Knowledge of mobile application development using Flutter
                        Experience with version control systems (e.g., Git)
                        Excellent problem-solving and analytical skills
                        Strong attention to detail and ability to work independently
                        Effective communication and teamwork skills


                        Salary

                        Starting salary would be \$800/month''')
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
