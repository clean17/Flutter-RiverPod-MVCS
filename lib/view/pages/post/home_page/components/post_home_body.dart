import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/model/post/post.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/home_page/components/post_home_list_item.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/home_page/post_home_page_view_model.dart';
import 'package:logger/logger.dart';

class PostHomeBody extends ConsumerWidget {
  const PostHomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Logger().d("PostHomeBody 그려짐");
    // 프로바이더를 지켜보는 순간 뷰모델을 생성 -> PostHomePageViewModel(null)
    // notifyInit 을 호출하는 순간

    // postHomePageProvider.notifier는 창고에 접근 ! - 뷰모델에 접근하면 메소드 사용가능
    // postHomePageProvider는 상태에 접근 ( 데이터 ) 처음에 상태가 null일수도 있으니까  ? 필요
    PostHomePageModel? model = ref.watch(postHomePageProvider);
    List<Post> posts = [];
    if (model != null) {
      posts = model.posts;
    }
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: PostHomeListItem(posts[index]),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
