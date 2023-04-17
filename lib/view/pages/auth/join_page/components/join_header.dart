import 'package:flutter/material.dart';

class JoinHeader extends StatelessWidget {
  const JoinHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      child: const Text(
        "회원가입 페이지",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
