import 'package:flutter/material.dart';

class PostDetailButtons extends StatelessWidget {
  const PostDetailButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () async {},
          child: const Text("삭제"),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          child: const Text("수정"),
        ),
      ],
    );
  }
}
