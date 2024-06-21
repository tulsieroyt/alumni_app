import 'package:flutter/material.dart';

class BioSection extends StatelessWidget {
  const BioSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bio',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 5),
        Text('I\'m Tulsie Chandra Barman, Currently studing in CSE at PSTU')
      ],
    );
  }
}
