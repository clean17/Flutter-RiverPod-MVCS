import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/model/post/post.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/detail_page/components/post_detail_buttons.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/detail_page/components/post_detail_content.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/detail_page/components/post_detail_title.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/detail_page/post_detail_page_view_model.dart';

class PostDetailBody extends ConsumerWidget {
  const PostDetailBody(this.postId, {Key? key}) : super(key: key);

  final int postId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostDetailPageModel? model = ref.watch(postDetailPageProvider(postId));
    // PostDetailPageViewModel? vm =
    //     ref.watch(postDetailPageProvider(postId).notifier);
    // vm.notifyRemove(postId); 삭제 이렇게 하는게 아니었다 !?
    if (model == null) {
      return const CircularProgressIndicator();
    } else {
      Post post = model.post;
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostDetailTitle(post.title),
            const Divider(),
            PostDetailButtons(post),
            Expanded(child: PostDetailContent(post.content)),
          ],
        ),
      );
    }
  }
}
