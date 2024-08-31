import 'package:alumni_app/src/features/posts/presentation/controllers/create_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    final createPostController = Get.put(CreatePostController());
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () => createPostController.getBack(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Text(
                      'Create Post',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.more_vert)
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white10,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                              maxLines: null,
                              controller: createPostController.postContent,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Write something...',
                              ),
                            ),
                          const SizedBox(height: 8),
                          GetBuilder<CreatePostController>(
                            builder: (_) {
                              return createPostController.image != null
                                  ? Image.file(createPostController.image!)
                                  : Container();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    IconButton(
                        onPressed: () => createPostController.getImage(),
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 28,
                        )),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => createPostController.createPost(),
                        child: const Text('Post'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
