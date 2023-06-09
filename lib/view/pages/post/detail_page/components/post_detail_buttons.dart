import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/controller/post_controller.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/update_page/post_update_page.dart';

class PostDetailButtons extends ConsumerWidget {
  const PostDetailButtons(this.post, {Key? key}) : super(key: key);
  final post;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            // 밑에 할일이 있으면 async/await
            ref.read(postControllerProvider).deletePost(post.id);
          },
          child: const Text("삭제"),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PostUpdatePage(post)));
          },
          child: const Text("수정"),
        ),
      ],
    );
  }
}
