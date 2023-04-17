import 'package:flutter/material.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/detail_page/components/post_detail_buttons.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/detail_page/components/post_detail_content.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/detail_page/components/post_detail_title.dart';

class PostDetailBody extends StatelessWidget {
  const PostDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostDetailTitle(),
          const Divider(),
          PostDetailButtons(),
          Expanded(child: PostDetailContent()),
        ],
      ),
    );
  }
}
