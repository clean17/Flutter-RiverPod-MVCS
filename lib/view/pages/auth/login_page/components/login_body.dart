import 'package:flutter/material.dart';
import 'package:flutter_riverpod_blog_start/view/pages/auth/login_page/components/login_form.dart';
import 'package:flutter_riverpod_blog_start/view/pages/auth/login_page/components/login_header.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          LoginHeader(),
          LoginForm(),
        ],
      ),
    );
  }
}
