import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/core/utils/validator_util.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_elevated_button.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_text_form_field.dart';
import 'package:flutter_riverpod_blog_start/view/pages/auth/join_page/components/join_body.dart';
import 'package:logger/logger.dart';

class JoinPage extends StatelessWidget {
  JoinPage({super.key}); // 추가

  @override
  Widget build(BuildContext context) {
    Logger().d("joinpage 그려짐");
    return Scaffold(
      body: JoinBody(),
    );
  }
}
