import 'package:flutter/material.dart';

class PostDetailBody extends StatelessWidget {
  // final int postId;

  const PostDetailBody(
      // this.postId,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          const Divider(),
          Row(
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
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Text(""),
            ),
          ),
        ],
      ),
    );
  }
}
