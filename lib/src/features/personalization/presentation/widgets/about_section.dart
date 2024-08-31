import 'package:alumni_app/src/features/personalization/presentation/controllers/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/model/link.dart';
import 'bio_section.dart';
import 'educaion_section.dart';
import 'experience_section.dart';
import 'social_link_section.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key, required this.profileScreenController});

  final ProfileScreenController profileScreenController;

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  final linkData = [
    {
      "platformName": "Facebook",
      "platformImage": "assets/image/logo/facebook-logo.png",
      "platformLink": "https://www.youtube.com/"
    },
    {
      "platformName": "Github",
      "platformImage": "assets/image/logo/github-logo.png",
      "platformLink": "https://www.twitter.com/"
    },
    {
      "platformName": "Linkedin",
      "platformImage": "assets/image/logo/linkedin.png",
      "platformLink": "https://www.instagram.com/"
    }
  ];

  final List<Link> links = [];

  @override
  void initState() {
    super.initState();
    links.addAll(linkData.map((link) => Link.fromJson(link)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            BioSection(
              profileScreenController: widget.profileScreenController,
            ),
            const SizedBox(height: 20),
            EducationSection(
              profileScreenController: widget.profileScreenController,
            ),
            const SizedBox(height: 20),
            ExperienceSection(
              profileScreenController: widget.profileScreenController,
            ),
            const SizedBox(height: 20),
            SocialLinkSection(
              profileScreenController: widget.profileScreenController,
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
