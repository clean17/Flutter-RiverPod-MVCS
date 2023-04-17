import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/core/utils/validator_util.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_elevated_button.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_text_form_field.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_textarea.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/write_page/post_write_body.dart';

class PostWritePage extends StatelessWidget {
  const PostWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PostWriteBody(),
    );
  }
}
