import 'package:flutter/material.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/home_page/components/post_home_list_item.dart';

class PostHomeBody extends StatelessWidget {
  const PostHomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {

          },
          child: PostHomeListItem(),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
