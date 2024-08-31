import 'package:alumni_app/src/common/repositories/authentication_repository.dart';
import 'package:alumni_app/src/features/posts/presentation/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeScreenController = Get.put(HomeScreenController());
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          'Alumni App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: homeScreenController.userPosts.length,
                separatorBuilder: (_, __) => const SizedBox(height: 5),
                itemBuilder: (context, index) {
                  final userPost = homeScreenController.userPosts[index];
                  return Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 5),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 45,
                                      width: 45,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: userPost
                                                .user.profilePicture.isEmpty
                                            ? const CircleAvatar(
                                                child: Icon(Icons.person),
                                              )
                                            : Image.network(
                                                userPost.user.profilePicture),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${userPost.user.firstName} ${userPost.user.lastName}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Text('10 days ago')
                                      ],
                                    ),
                                  ],
                                ),
                                const Icon(Icons.more_vert)
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          ReadMoreText(
                            userPost.post.postContent,
                            trimMode: TrimMode.Line,
                            trimLines: 2,
                            colorClickableText: Colors.blue,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          userPost.post.imageUrl == ""
                              ? Container()
                              : Image.network(
                                  userPost.post.imageUrl.toString()),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.favorite_border_rounded),
                              Icon(Icons.comment),
                              Icon(Icons.share),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
