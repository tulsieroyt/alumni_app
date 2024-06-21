import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/features/alumni/presentation/screen/alumni_list/alumni_list.dart';
import 'src/features/jobs/presentation/screen/jobs_screen.dart';
import 'src/features/personalization/presentation/screen/profile_screen.dart';
import 'src/features/posts/presentation/screen/home/home_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationMenuController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          indicatorColor: Colors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.group), label: 'Alumni'),
            NavigationDestination(icon: Icon(Icons.card_travel), label: 'Jobs'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
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
    const ProfileScreen(),
  ];
}
