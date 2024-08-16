import 'package:flutter/material.dart';

import '../widgets/about_section.dart';
import '../widgets/follow_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 30),
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.blue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                image: AssetImage(
                                    'assets/image/profile/tulsie.jpg'),
                              ),
                            ),
                          )),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 10,
                    child: Icon(Icons.more_vert),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            //For name and email
            const Column(
              children: [
                Text(
                  'Tulsie Chandra Barman',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text('tulsieroyt@gmail.com'),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Connect',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 36),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Message',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Row(
              children: [
                FollowButton(buttonName: 'Like', number: '220'),
                FollowButton(buttonName: 'Follower', number: '2K'),
                FollowButton(buttonName: 'Following', number: '1K'),
              ],
            ),
            const SizedBox(height: 20),
            const TabBar(tabs: [
              Tab(
                text: 'About',
              ),
              Tab(
                text: 'Posts',
              ),
            ]),
            const Expanded(
              child: TabBarView(
                children: [
                  AboutSection(),
                  Center(child: Text('Message')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
