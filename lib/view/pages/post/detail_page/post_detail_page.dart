import 'package:flutter/material.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/detail_page/post_detail_body.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const PostDetailBody(),
    );
  }
}
