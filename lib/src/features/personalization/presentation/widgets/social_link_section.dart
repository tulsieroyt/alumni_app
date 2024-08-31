import 'package:alumni_app/src/features/personalization/presentation/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/model/link.dart';
import '../../domain/model/social_link_model.dart';
import '../screen/edit_profile/edit_profile_screen.dart';

class SocialLinkSection extends StatelessWidget {
  const SocialLinkSection({
    super.key,
    required this.profileScreenController,
  });

  final ProfileScreenController profileScreenController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Social Link:',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        Obx(
          () {
            return profileScreenController.socialLinkModel.value ==
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
                      profileScreenController.socialLinkModel.value.facebook ==
                              ""
                          ? Container()
                          : SocialLinkCardWidget(
                              iconLink: 'assets/image/logo/facebook-logo.png',
                              platformName: 'Facebook',
                              link: profileScreenController
                                  .socialLinkModel.value.facebook,
                            ),
                      profileScreenController.socialLinkModel.value.github == ""
                          ? Container()
                          : SocialLinkCardWidget(
                              iconLink: 'assets/image/logo/github-logo.png',
                              platformName: 'Github',
                              link: profileScreenController
                                  .socialLinkModel.value.github,
                            ),
                      profileScreenController.socialLinkModel.value.linkedin ==
                              ""
                          ? Container()
                          : SocialLinkCardWidget(
                              iconLink: 'assets/image/logo/linkedin.png',
                              platformName: 'Linkedin',
                              link: profileScreenController
                                  .socialLinkModel.value.linkedin,
                            ),
                    ],
                  );
          },
        ),
      ],
    );
  }
}
