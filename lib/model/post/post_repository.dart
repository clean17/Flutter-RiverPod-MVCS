import 'package:dio/dio.dart';
import 'package:flutter_riverpod_blog_start/core/constants/http.dart';
import 'package:flutter_riverpod_blog_start/dto/response_dto.dart';
import 'package:flutter_riverpod_blog_start/model/post/post.dart';

class PostRepository {
  static final PostRepository _instance = PostRepository._single();
  factory PostRepository() {
    return _instance;
  }
  PostRepository._single();

// String? deviceJwt = await secureStorage.read(key: "jwt");

  Future<ResponseDTO> fetchPostList(String jwt) async {
    try {
      Response response = await dio.get('/post',
          options: Options(headers: {"Authorization": jwt})); // 헤더에 토큰 보내고
      ResponseDTO responseDTO =
          ResponseDTO.fromJson(response.data); // dart오브젝트로 파싱
      List<dynamic> mapList = responseDTO.data; // 데어터에 리스트가 들어있음
      // List<dynamic> mapList = responseDTO.data as List<dynamic>  // 명시적 형변환, 적지않으면 묵시적 형변환
      List<Post> postList =
          mapList.map((e) => Post.fromJson(e)).toList(); // 요소를 Post 오브젝트에 넣음
      responseDTO.data = postList; // 파싱된 데이터로 변경
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "실패 : $e");
    }
  }
}
