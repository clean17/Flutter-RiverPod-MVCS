import 'package:flutter/material.dart';

class PostHomeListItem extends StatelessWidget {
  const PostHomeListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("1"),
      title: Text("제목1"),
    );
  }
}
