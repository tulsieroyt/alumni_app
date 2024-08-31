import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/edit_profile/edit_profile_controller.dart';

class BasicInfoEditorWidget extends StatelessWidget {
  const BasicInfoEditorWidget({
    super.key,
    required this.editProfileController,
  });

  final EditProfileController editProfileController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Text(
            'Basic Info',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Obx(
                    () => ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: editProfileController.profilePicture.value.isEmpty
                          ? const CircleAvatar(
                              child: Icon(Icons.person),
                            )
                          : Image.network(
                              editProfileController.profilePicture.value,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  editProfileController
                      .getImage()
                      .then((_) => editProfileController.updateImage())
                      .then((_) => Get.snackbar(
                          'Successful!', 'Your Image uploaded successfully.'));
                },
                child: const Column(
                  children: [
                    Icon(Icons.upload),
                    Text('Update Image'),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: editProfileController.firstName,
            decoration: const InputDecoration(labelText: 'First Name'),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your First Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: editProfileController.lastName,
            decoration: const InputDecoration(labelText: 'Last Name'),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your Last Name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: editProfileController.email,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your Email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: editProfileController.phoneNumber,
            decoration: const InputDecoration(labelText: 'Mobile'),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your Mobile Number';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: editProfileController.session,
            decoration: const InputDecoration(labelText: 'Session'),
            validator: (value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your session';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => editProfileController.updateBasicInfo(),
              child: const Text('Save'),
            ),
          )
        ],
      ),
    );
  }
}
