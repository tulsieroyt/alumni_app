import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../domain/model/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final postsData = [
    {
      "postText": "Hello, this is my first post!",
      "isImage": false,
      "postImageUrl": null,
      "likeCount": 10,
      "user": {
        "name": "Tulsie Chandra Barman",
        "imageUrl": "assets/image/profile/tulsie.jpg"
      }
    },
    {
      "postText": "Check out this cool photo!",
      "isImage": true,
      "postImageUrl": "assets/image/posts/oop_flutter.jpg",
      "likeCount": 25,
      "user": {
        "name": "Joy Barman",
        "imageUrl": "assets/image/profile/tulsie2.png"
      }
    },
    {
      "postText": "Had a great day today!",
      "isImage": false,
      "postImageUrl": null,
      "likeCount": 15,
      "user": {
        "name": "Tulsie Chandra Barman",
        "imageUrl": "assets/image/profile/tulsie.jpg"
      }
    },
    {
      "postText": "Amazing sunset view.",
      "isImage": true,
      "postImageUrl": "assets/image/posts/clean_archite_flutter.jpg",
      "likeCount": 30,
      "user": {
        "name": "Joy Barman",
        "imageUrl": "assets/image/profile/tulsie2.png"
      }
    },
    {
      "postText": "Just finished a marathon!",
      "isImage": false,
      "postImageUrl": null,
      "likeCount": 50,
      "user": {
        "name": "Tulsie Chandra Barman",
        "imageUrl": "assets/image/profile/tulsie.jpg"
      }
    }
  ];

  final List<Post> posts = [];

  @override
  void initState() {
    posts.addAll(postsData.map((postData) => Post.fromJson(postData)).toList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('News Feed'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 16)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: posts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 5),
              itemBuilder: (context, index) {
                final post = posts[index];
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
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image(
                                      image: AssetImage(post.user.imageUrl),
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        post.user.name,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
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
                        const ReadMoreText(
                          'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                          trimMode: TrimMode.Line,
                          trimLines: 2,
                          colorClickableText: Colors.blue,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        post.isImage
                            ? const SizedBox(height: 10)
                            : const SizedBox(),
                        post.isImage
                            ? Image(
                                height: 200,
                                width: double.infinity,
                                image: AssetImage(post.postImageUrl!),
                                fit: BoxFit.cover,
                              )
                            : Container(),
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
            )
          ],
        ),
      ),
    );
  }
}
