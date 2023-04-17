import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UserDetailBody extends StatelessWidget {
  const UserDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("회원 번호 : 1"),
          Text("회원 유저네임 : ssar"),
          Text("회원 이메일 : ssar@nate.com"),
          Text("회원 가입날짜 : 2024.04.01"),
        ],
      ),
    );
  }
}
