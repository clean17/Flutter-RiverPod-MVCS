import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/dto/post_request.dart';
import 'package:flutter_riverpod_blog_start/dto/response_dto.dart';
import 'package:flutter_riverpod_blog_start/main.dart';
import 'package:flutter_riverpod_blog_start/model/post/post_repository.dart';
import 'package:flutter_riverpod_blog_start/provider/session_provider.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/detail_page/post_detail_page_view_model.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/home_page/post_home_page_view_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

final postControllerProvider = Provider<PostController>((ref) {
  return PostController(ref);
});

class PostController {
  // Repository, ViewModel 의존
  final mContext = navigatorKey.currentContext; // 컨트롤러에서 뷰 핸들링
  final Ref ref;
  PostController(this.ref);

  Future<void> refresh() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ref.read(postHomePageProvider.notifier).notifyInit(sessionUser.jwt!);
  }

  Future<void> deletePost(int id) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    await PostRepository().fetchDelete(id, sessionUser.jwt!);
    ref.read(postHomePageProvider.notifier).notifyRemove(id);
    Navigator.pop(mContext!);
  }

  // Future<void> updatePost(int id, String title, String content) async {
  //   SessionUser sessionUser = ref.read(sessionProvider);
  //   PostUpdateReqDTO dto = PostUpdateReqDTO(content: content, title: title);
  //   ResponseDTO responseDTO =
  //       await PostRepository().fetchUpdate(id, dto, sessionUser.jwt!);
  //   ref
  //       .read(postDetailPageProvider(id).notifier)
  //       .notifyUpdate(responseDTO.data);
  //   ref.read(postHomePageProvider.notifier).notifyUpdate(responseDTO.data);
  //   Navigator.pop(mContext!);
  // }

  Future<void> updatePost(int id, String title, String content) async {
    PostUpdateReqDTO postUpdateReqDTO =
        PostUpdateReqDTO(title: title, content: content);
    SessionUser sessionUser = ref.read(sessionProvider);

    ResponseDTO responseDTO = await PostRepository()
        .fetchUpdate(id, postUpdateReqDTO, sessionUser.jwt!);
    ref
        .read(postDetailPageProvider(id).notifier)
        .notifyUpdate(responseDTO.data);
    ref.read(postHomePageProvider.notifier).notifyUpdate(responseDTO.data);
    Navigator.pop(mContext!);
  }

  Future<void> savePost(String title, String content) async {
    PostSaveReqDTO postSaveReqDTO =
        PostSaveReqDTO(title: title, content: content);
    SessionUser sessionUser = ref.read(sessionProvider);

    ResponseDTO responseDTO =
        await PostRepository().fetchSave(postSaveReqDTO, sessionUser.jwt!);
    // ref.read(postDetailPageProvider).notifyAdd(responseDTO.data);
    ref.read(postHomePageProvider.notifier).notifyAdd(responseDTO.data);
    Navigator.pop(mContext!);
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      // webPosition: ,
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[600],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
