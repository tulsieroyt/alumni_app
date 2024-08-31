import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import '../widgets/about_section.dart';
import '../widgets/follow_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.userId});

  final String userId;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final ProfileScreenController profileScreenController =
        Get.put(ProfileScreenController(userId: widget.userId));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar:
            widget.userId != profileScreenController.user.uid ? AppBar() : null,
        body: Column(
          children: [
            widget.userId != profileScreenController.user.uid
                ? Container()
                : const SizedBox(height: 30),
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Obx(
                        () => Container(
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
                              child: profileScreenController.userBasicInfo.value
                                      .profilePicture.isEmpty
                                  ? const CircleAvatar(
                                      child: Icon(Icons.person),
                                    )
                                  : Image.network(profileScreenController
                                      .userBasicInfo.value.profilePicture),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  widget.userId != profileScreenController.user.uid
                      ? Container()
                      : Positioned(
                          top: 0,
                          right: 10,
                          child: PopupMenuButton<String>(
                            onSelected: (value) => profileScreenController
                                .onMenuItemSelected(value),
                            itemBuilder: (BuildContext context) {
                              return [
                                const PopupMenuItem(
                                  value: 'edit',
                                  child: Text('Edit Profile'),
                                ),
                                const PopupMenuItem(
                                  value: 'logout',
                                  child: Text('Log Out'),
                                ),
                                const PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Delete Profile'),
                                ),
                              ];
                            },
                            icon: const Icon(Icons.more_vert),
                          ),
                        )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => Column(
                children: [
                  Text(
                    '${profileScreenController.userBasicInfo.value.firstName} ${profileScreenController.userBasicInfo.value.lastName} ',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(profileScreenController.userBasicInfo.value.email),
                  Text('Session: ${profileScreenController.userBasicInfo.value.session}')
                ],
              ),
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
            Expanded(
              child: TabBarView(
                children: [
                  AboutSection(
                      profileScreenController: profileScreenController),
                  const Center(child: Text('Message')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
