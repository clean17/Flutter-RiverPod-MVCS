import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/dto/response_dto.dart';
import 'package:flutter_riverpod_blog_start/model/post/post.dart';
import 'package:flutter_riverpod_blog_start/model/post/post_repository.dart';
import 'package:flutter_riverpod_blog_start/provider/session_provider.dart';

// 페이지 마다 필요한 뷰모델 작성 !!!!!!!!

// 뷰모델 -> 창고 // 패키지 폴더명임
// 뷰모델이 데이터를 관리한다. -> state를 관리
class PostHomePageViewModel extends StateNotifier<PostHomePageModel?> {
  PostHomePageViewModel(super.state);

  void add(Post post) {
    if (state == null) {
      List<Post> posts = [post]; // 입력된 데이터 추가
      state = PostHomePageModel(posts: posts);
    } else {
      List<Post> posts = state!.posts;
      List<Post> newPosts = [...posts, post];
      state = PostHomePageModel(posts: newPosts);
    }
  }

  void remove(int id) {
    List<Post> posts = state!.posts;
    List<Post> newPosts = posts.where((e) => e.id != id).toList(); // true만 통과
    state = PostHomePageModel(posts: newPosts);
  }

  void update(Post post) {
    List<Post> posts = state!.posts;
    List<Post> newPosts = posts.map((e) => e.id == post.id ? post : e).toList();
    state = PostHomePageModel(posts: newPosts);
  }

  void init(String jwt) async {
    ResponseDTO responseDTO = await PostRepository().fetchPostList(jwt);
    state = PostHomePageModel(posts: responseDTO.data);
  }
}

// 창고 데이터
class PostHomePageModel {
  List<Post> posts;

  PostHomePageModel({required this.posts});
}

// 창고 관리자 -> 이녀석으로 접근함
// <창고, 데이터?> 필요
// 프로바이더는 함수를 가진 뷰모델에 접근시켜주는 역할
final postHomePageProvider =
    StateNotifierProvider<PostHomePageViewModel, PostHomePageModel?>((ref) {
  SessionUser sessionUser = ref.read(sessionProvider);
  return PostHomePageViewModel(null)
    ..init(sessionUser.jwt!); // 로그인되어 있을때만 호출해야함
});
