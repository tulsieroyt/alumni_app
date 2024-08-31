import 'package:alumni_app/src/features/alumni/presentation/controllers/alumni_list_controller.dart';
import 'package:alumni_app/src/features/personalization/presentation/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlumniList extends StatefulWidget {
  const AlumniList({super.key});

  @override
  State<AlumniList> createState() => _AlumniListState();
}

class _AlumniListState extends State<AlumniList> {
  final alumniListController = Get.put(AlumniListController());
  String? selectedBatch;
  final List<String> batches = [
    '2016-17',
    '2017-18',
    '2018-19',
    '2019-20',
    '2020-21',
    '2021-22'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Alumni List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16),
                const Text(
                  'Filter',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      items: batches
                          .map((batch) => DropdownMenuItem(
                                value: batch,
                                child: Text(batch),
                              ))
                          .toList(),
                      hint: const Text('Select Batch'),
                      value: selectedBatch,
                      onChanged: (value) {
                        setState(() {
                          selectedBatch = value;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'All Alumni',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                const SizedBox(height: 16),
              ],
            ),
            Obx(
              () => Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: alumniListController.allAlumniList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final alumnus = alumniListController.allAlumniList[index];
                    return alumnus.id != alumniListController.userId
                        ? ListTile(
                            onTap: () {
                              Get.to(() => ProfileScreen(userId: alumnus.id));
                            },
                            tileColor: Colors.white,
                            leading: SizedBox(
                              height: 45,
                              width: 45,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: alumnus.profilePicture.isEmpty
                                    ? const CircleAvatar(
                                        child: Icon(Icons.person),
                                      )
                                    : Image.network(alumnus.profilePicture),
                              ),
                            ),
                            title: Text(
                                '${alumnus.firstName} ${alumnus.lastName}'),
                            subtitle: Text(alumnus.session),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          )
                        : null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
