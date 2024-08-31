import 'package:alumni_app/src/features/personalization/domain/model/social_link_model.dart';
import 'package:alumni_app/src/features/personalization/presentation/controllers/edit_profile/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/edit_profile/basic_info_editor_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final editProfileController = Get.put(EditProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit your Info',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                BasicInfoEditorWidget(
                    editProfileController: editProfileController),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text('Bio'),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: editProfileController.bio,
                        decoration: const InputDecoration(labelText: 'Bio'),
                        validator: (value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Enter your First Name';
                          }
                          return null;
                        },
                        maxLines: 4,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => editProfileController.updateBio(),
                          child: const Text('Save Bio'),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text('Education'),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AddEducationInfoWidget(
                                    editProfileController:
                                        editProfileController);
                              },
                            );
                          },
                          child: const Text('Add'),
                        ),
                      ),
                      Obx(
                        () {
                          return editProfileController.educationList.isEmpty
                              ? const SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text('No data Found'),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: editProfileController
                                      .educationList.length,
                                  itemBuilder: (context, index) {
                                    final educationItem = editProfileController
                                        .educationList[index];
                                    return ListTile(
                                      title: Text(educationItem.collegeName),
                                      subtitle: Text(
                                          '${educationItem.examName}, ${educationItem.examYear}'),
                                      trailing: const Icon(Icons.more_vert),
                                    );
                                  },
                                );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text('Experience'),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) {
                              return AddExperienceInfoWidget(
                                  editProfileController: editProfileController);
                            },
                          ),
                          child: const Text('Add'),
                        ),
                      ),
                      Obx(
                        () {
                          return editProfileController.experienceList.isEmpty
                              ? const SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text('No data Found'),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: editProfileController
                                      .experienceList.length,
                                  itemBuilder: (context, index) {
                                    final experienceItem = editProfileController
                                        .experienceList[index];
                                    return ListTile(
                                      title: Text(
                                        experienceItem.companyName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            experienceItem.position,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            experienceItem.timePeriod,
                                          ),
                                        ],
                                      ),
                                      trailing: const Icon(Icons.more_vert),
                                    );
                                  },
                                );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Social Link'),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => showDialog(
                            context: context,
                            builder: (context) {
                              return AddSocialLinkWidget(
                                  editProfileController: editProfileController);
                            },
                          ),
                          child: const Text('Add'),
                        ),
                      ),
                      Obx(
                        () {
                          return editProfileController.socialLinkModel.value ==
                                  SocialLinkModel.empty()
                              ? const SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text('No data Found'),
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    editProfileController.socialLinkModel.value
                                                .facebook ==
                                            ""
                                        ? Container()
                                        : SocialLinkCardWidget(
                                            iconLink:
                                                'assets/image/logo/facebook-logo.png',
                                            platformName: 'Facebook',
                                            link: editProfileController
                                                .socialLinkModel.value.facebook,
                                          ),
                                    editProfileController
                                                .socialLinkModel.value.github ==
                                            ""
                                        ? Container()
                                        : SocialLinkCardWidget(
                                            iconLink:
                                                'assets/image/logo/github-logo.png',
                                            platformName: 'Github',
                                            link: editProfileController
                                                .socialLinkModel.value.github,
                                          ),
                                    editProfileController.socialLinkModel.value
                                                .linkedin ==
                                            ""
                                        ? Container()
                                        : SocialLinkCardWidget(
                                            iconLink:
                                                'assets/image/logo/linkedin.png',
                                            platformName: 'Linkedin',
                                            link: editProfileController
                                                .socialLinkModel.value.linkedin,
                                          ),
                                  ],
                                );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialLinkCardWidget extends StatelessWidget {
  const SocialLinkCardWidget({
    super.key,
    required this.iconLink,
    required this.platformName,
    required this.link,
  });

  final String iconLink, platformName, link;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            height: 30,
            width: 30,
            child: Image(image: AssetImage(iconLink)),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              platformName,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(link),
          ],
        )
      ],
    );
  }
}

class AddEducationInfoWidget extends StatelessWidget {
  const AddEducationInfoWidget({
    super.key,
    required this.editProfileController,
  });

  final EditProfileController editProfileController;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Form(
          key: editProfileController.educationFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add Info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: editProfileController.collegeName,
                decoration: const InputDecoration(labelText: 'College'),
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your College';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: editProfileController.examName,
                decoration: const InputDecoration(labelText: 'Exam Name'),
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your exam name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: editProfileController.examYear,
                decoration: const InputDecoration(labelText: 'Exam Year'),
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your exam year';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => editProfileController.saveEducationInfo(),
                  child: const Text('Save Data'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddExperienceInfoWidget extends StatelessWidget {
  const AddExperienceInfoWidget({
    super.key,
    required this.editProfileController,
  });

  final EditProfileController editProfileController;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Form(
          key: editProfileController.experienceFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add Info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: editProfileController.companyName,
                decoration: const InputDecoration(labelText: 'Company'),
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your Company';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: editProfileController.position,
                decoration: const InputDecoration(labelText: 'Position'),
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your position';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: editProfileController.timePeriod,
                decoration: const InputDecoration(labelText: 'Time Period'),
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your time period.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      editProfileController.saveExperienceInformation(),
                  child: const Text('Save Data'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddSocialLinkWidget extends StatelessWidget {
  const AddSocialLinkWidget({
    super.key,
    required this.editProfileController,
  });

  final EditProfileController editProfileController;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add Info',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: editProfileController.facebook,
              decoration: const InputDecoration(labelText: 'Facebook'),
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter your Facebook url';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: editProfileController.github,
              decoration: const InputDecoration(labelText: 'Github'),
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter your Github Url';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: editProfileController.linkedin,
              decoration: const InputDecoration(labelText: 'Linkedin'),
              validator: (value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Enter your linkedin Url.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => editProfileController.saveSocialLink(),
                child: const Text('Save Data'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
