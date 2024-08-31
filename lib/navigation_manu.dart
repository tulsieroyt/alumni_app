import 'package:alumni_app/src/features/jobs/presentation/screen/create_job_post/create_job_post_screen.dart';
import 'package:alumni_app/src/features/posts/presentation/screen/post/create_post_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import 'src/features/alumni/presentation/screen/alumni_list/alumni_list.dart';
import 'src/features/jobs/presentation/screen/jobs_screen.dart';
import 'src/features/personalization/presentation/screen/profile_screen.dart';
import 'src/features/posts/presentation/screen/home/home_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationMenuController());

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home,
                    size: 28,
                    color: controller.selectedIndex.value == 0
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  onPressed: () => controller.selectedIndex.value = 0,
                ),
                IconButton(
                  icon: Icon(
                    Icons.group,
                    size: 28,
                    color: controller.selectedIndex.value == 1
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  onPressed: () => controller.selectedIndex.value = 1,
                ),
                const SizedBox(width: 40), // Spacing for the FAB
                IconButton(
                  icon: Icon(
                    Icons.card_travel,
                    size: 28,
                    color: controller.selectedIndex.value == 2
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  onPressed: () => controller.selectedIndex.value = 2,
                ),
                IconButton(
                  icon: Icon(
                    Icons.person,
                    size: 28,
                    color: controller.selectedIndex.value == 3
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  onPressed: () => controller.selectedIndex.value = 3,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 45,
        width: 45,
        child: SpeedDial(
          animatedIcon: AnimatedIcons.add_event,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.post_add),
              label: 'Create Post',
              onTap: () {
                Get.to(() => const CreatePostScreen());
              },
            ),
            SpeedDialChild(
                child: const Icon(Icons.shopping_bag),
                label: 'Job Post',
                onTap: () => Get.to(() => const CreateJobPostScreen()))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationMenuController extends GetxController {
  static NavigationMenuController get instance => Get.find();


  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const AlumniList(),
    const JobsScreen(),
    ProfileScreen(userId: FirebaseAuth.instance.currentUser!.uid),
  ];
}
