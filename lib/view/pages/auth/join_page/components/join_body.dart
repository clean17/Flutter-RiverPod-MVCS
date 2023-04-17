import 'package:flutter/material.dart';
import 'package:flutter_riverpod_blog_start/view/pages/auth/join_page/components/join_form.dart';
import 'package:flutter_riverpod_blog_start/view/pages/auth/join_page/components/join_header.dart';

class JoinBody extends StatelessWidget {
  JoinBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          JoinHeader(),
          JoinForm(), // 추가
        ],
      ),
    );
  }
}


