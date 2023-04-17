import 'package:flutter/material.dart';

class PostDetailTitle extends StatelessWidget {
  const PostDetailTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "제목1",
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
    );
  }
}
