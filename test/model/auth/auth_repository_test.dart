import 'package:dio/dio.dart';
import 'package:flutter_riverpod_blog_start/dto/response_dto.dart';
import 'package:flutter_riverpod_blog_start/model/user/user.dart';

final dio = Dio(BaseOptions(
  baseUrl: "http://192.168.200.124:8080",
  contentType: "application/json; charset=utf-8",
));

void main() async {
  await fetchJoin_test();
}

Future<void> fetchJoin_test() async {
  // given
  String username = "gildo2ng2323232";
  String password = "1234";
  String email = "gildong@nate.com";

  // when
  Map<String, dynamic> requestBody = {
    "username": username,
    "password": password,
    "email": email
  };
  // dio가 Map -> json
  // 응답시 dio 가 json -> Map
  Response response = await dio.post("/join", data: requestBody);
  // print(response.data);
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  print(responseDTO.code);
  print(responseDTO.msg);
  print(responseDTO.data);
  // User result = User.fromJson(responseDTO.data);
  // print(result.email);
  responseDTO.data =
      User.fromJson(responseDTO.data); // dynamic 타입이므로 다시 자신으로 리턴가능
  User user = responseDTO.data; // dynamic은 언제든지 타입을 변형 가능하다
}
