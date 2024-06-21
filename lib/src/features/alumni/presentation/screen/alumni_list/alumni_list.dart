import 'package:flutter/material.dart';
class AlumniList extends StatefulWidget {
  const AlumniList({super.key});

  @override
  State<AlumniList> createState() => _AlumniListState();
}

class _AlumniListState extends State<AlumniList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Alumni List'),),
      body: const Center(
        child: Text('All Alumni List'),
      ),
    );
  }
}
