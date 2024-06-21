import 'package:flutter/material.dart';

import '../../domain/model/link.dart';

class SocialLinkSection extends StatelessWidget {
  const SocialLinkSection({
    super.key,
    required this.links,
  });

  final List<Link> links;

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
        ListView.builder(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: links.length,
          itemBuilder: (context, index) {
            final link = links[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image(image: AssetImage(link.platformImage)),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      link.platformName,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(link.platformLink),
                  ],
                )
              ],
            );
          },
        )
      ],
    );
  }
}
