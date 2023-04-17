
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/write_page/components/post_write_body.dart';

class PostWritePage extends StatelessWidget {
  PostWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PostWriteBody(),
    );
  }
}
