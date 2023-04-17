import 'package:flutter/material.dart';
import 'package:flutter_riverpod_blog_start/view/pages/auth/login_page/login_body.dart';
import 'package:logger/logger.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Logger().d("로그인 페이지 빌드 시작");
    return Scaffold(
      body: LoginBody(),
    );
  }
}
