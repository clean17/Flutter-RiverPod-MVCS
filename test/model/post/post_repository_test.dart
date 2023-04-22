import 'package:flutter_riverpod_blog_start/dto/response_dto.dart';
import 'package:flutter_riverpod_blog_start/model/post/post.dart';
import 'package:flutter_riverpod_blog_start/model/post/post_repository.dart';

void main() async {
  await fetchPostList_test();
}

Future<void> fetchPostList_test() async {
  String jwt =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjb3PthqDtgbAiLCJpZCI6MSwiZXhwIjoxNjgyNjQyNTQzfQ.sRajDXrS-wBg64kBlyU5ZtxtsMMSsr279ssHyn8VY95ICVFYSMBGYze9yEnfRggbtD7adxwMlMvOAELfUk276g";
  ResponseDTO responseDTO = await PostRepository().fetchPostList(jwt);
  print(responseDTO.code);
  print(responseDTO.msg);
  List<Post> postList = responseDTO.data;
  for (var element in postList) {
    print(element.title);
  }
}
