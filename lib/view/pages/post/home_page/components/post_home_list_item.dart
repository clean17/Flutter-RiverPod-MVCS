import 'package:flutter/material.dart';
import 'package:flutter_riverpod_blog_start/model/post/post.dart';

class PostHomeListItem extends StatelessWidget {
  const PostHomeListItem(this.post, {Key? key}) : super(key: key);

  final Post post;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("${post.id}"),
      title: Text(post.title),
    );
  }
}
