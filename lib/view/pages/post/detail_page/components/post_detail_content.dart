import 'package:flutter/material.dart';

class PostDetailContent extends StatelessWidget {
  const PostDetailContent(this.content, {Key? key}) : super(key: key);
  final content;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(content),
    );
  }
}
