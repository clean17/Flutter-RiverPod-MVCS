import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/dto/response_dto.dart';
import 'package:flutter_riverpod_blog_start/model/post/post.dart';
import 'package:flutter_riverpod_blog_start/model/post/post_repository.dart';
import 'package:flutter_riverpod_blog_start/provider/session_provider.dart';
import 'package:logger/logger.dart';

// 창고 관리자 -> 이녀석으로 접근함
// <창고, 데이터?> 필요
// 프로바이더는 함수를 가진 뷰모델에 접근시켜주는 역할
final postDetailPageProvider = StateNotifierProvider.family
    .autoDispose<PostDetailPageViewModel, PostDetailPageModel?, int>(
        (ref, postId) {
  Logger().d('postDetailPageProvider');
  SessionUser sessionUser = ref.read(sessionProvider);
  return PostDetailPageViewModel(null, ref)
    ..notifyInit(postId, sessionUser.jwt!);
});

// 뷰모델 -> 창고 // 패키지 폴더명임
// 뷰모델이 데이터를 관리한다. -> state를 관리
class PostDetailPageViewModel extends StateNotifier<PostDetailPageModel?> {
  PostDetailPageViewModel(super.state, this.ref);
  Ref ref;

  void notifyAdd(Post post) {}

  void notifyRemove(int id) {
    Post post = state!.post;
    if (post.id == id) {
      state = null;
      // ref.read(postHomePageProvider.notifier).notifyRemove(id);
    }
  }

  void notifyUpdate(Post updatePost) {
    state = PostDetailPageModel(post: updatePost);
  }

  void notifyInit(int id, String jwt) async {
    Logger().d('notifyInit - $id');
    ResponseDTO responseDTO = await PostRepository().fetchPost(id, jwt);
    state = PostDetailPageModel(post: responseDTO.data);
  }
}

// 창고 데이터
class PostDetailPageModel {
  Post post;
  PostDetailPageModel({required this.post});
}
