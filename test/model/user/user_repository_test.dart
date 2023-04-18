// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod_blog_start/dto/user_request.dart';
// import 'package:flutter_riverpod_blog_start/dto/response_dto.dart';
// import 'package:flutter_riverpod_blog_start/model/user/user.dart';

// final dio = Dio(BaseOptions(
//   baseUrl: "http://192.168.200.124:8080",
//   contentType: "application/json; charset=utf-8",
// ));

// void main() async {
//   await fetchJoin_test();
// }

// Future<void> fetchJoin_test() async {
//   // given
//   String username = "gildo2ng23232232";
//   String password = "1234";
//   String email = "gildong@nate.com";

//   // when
//   Map<String, dynamic> requestBody = {
//     "username": username,
//     "password": password,
//     "email": email
//   };
//   // dio가 Map -> json
//   // 응답시 dio 가 json -> Map
//   Response response = await dio.post("/join", data: requestBody);
//   // print(response.data);
//   ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
//   print(responseDTO.code);
//   print(responseDTO.msg);
//   print(responseDTO.data);
//   // User result = User.fromJson(responseDTO.data);
//   // print(result.email);
//   responseDTO.data =
//       User.fromJson(responseDTO.data); // dynamic 타입이므로 다시 자신으로 리턴가능
//   User user = responseDTO.data; // dynamic은 언제든지 타입을 변형 가능하다
// }

// Future<void> fetchLogin_test(LoginReqDTO loginReqDTO) async {
//   String username = "ssar";
//   String password = '1234';

//   Map<String, dynamic> requestBody = {
//     "username": username,
//     "password": password
//   };
//   // 1. 통신 시작
//   Response response = await dio.post(data: loginReqDTO.toJson(), '/login');
//   // 2. dto 파싱
//   ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
//   responseDTO.data = User.fromJson(responseDTO.data);
//   // 3. 토큰 받기
//   responseDTO.token = response.headers["authorization"].toString();
//   // return responseDTO;

//   print(responseDTO.code);
//   print(responseDTO.msg);
//   print(responseDTO.data);
// }

// Future<void> fetchLogin_test() async {
//   // given
//   String username = "ssar";
//   String password = "1234";

//   // when
//   Map<String, dynamic> requestBody = {
//     "username": username,
//     "password": password
//   };

//   // 1. 통신 시작
//   Response response = await dio.post("/login", data: requestBody);

//   // 2. DTO 파싱
//   ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
//   responseDTO.data = User.fromJson(responseDTO.data);

//   // 3. 토큰 받기
//   responseDTO.token = response.headers["authorization"].toString();

//   print(responseDTO.code);
//   print(responseDTO.msg);
//   print(responseDTO.token);
//   User user = responseDTO.data;
//   print(user.id);
//   print(user.username);
// }

///-----------------------------------------------------

import 'package:dio/dio.dart';
import 'package:flutter_riverpod_blog_start/dto/response_dto.dart';
import 'package:flutter_riverpod_blog_start/dto/user_request.dart';
import 'package:flutter_riverpod_blog_start/model/user/user.dart';
import 'package:flutter_riverpod_blog_start/model/user/user_repository.dart';

final dio = Dio(BaseOptions(
  baseUrl: "http://192.168.200.58:8080",
  contentType: "application/json; charset=utf-8",
));

void main() async {
  // await fetchLogin_test();
  await UserRepository().fetchJoin(JoinReqDTO(
      username: "mate123", password: "1234", email: "mete@natem.com"));
}

Future<void> fetchJwt_test() async {
  // given
  String deviceToken =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjb3PthqDtgbAiLCJpZCI6MSwiZXhwIjoxNjgyNTgzODA0fQ.KpL5GBi_-qDEJtbxUwkmKn7mkWWqwyS-cV3jI1DiCRFMgDRGOkT0YOsfTOJUddevnZ_Ge50hOydCeNGU8OK5Eg";

  // 1. 통신 시작
  Response response = await dio.get("/jwtToken",
      options: Options(headers: {"Authorization": deviceToken}));

  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  print(responseDTO.data);
  responseDTO.data = User.fromJson(responseDTO.data);
}

Future<void> fetchLogin_test() async {
  // given
  String username = "ssar";
  String password = "1234";

  // when
  Map<String, dynamic> requestBody = {
    "username": username,
    "password": password
  };

  // 1. 통신 시작
  Response response = await dio.post("/login", data: requestBody);

  // 2. DTO 파싱
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  responseDTO.data = User.fromJson(responseDTO.data);

  // 3. 토큰 받기
  final authorization = response.headers["Authorization"];
  if (authorization != null) {
    responseDTO.token = authorization.first;
  }

  print(responseDTO.code);
  print(responseDTO.msg);
  print(responseDTO.token);
  User user = responseDTO.data;
  print(user.id);
  print(user.username);
}

Future<void> fetchJoin_test() async {
  // given
  String username = "ssar4";
  String password = "1234";
  String email = "ssar2@nate.com";

  // when
  Map<String, dynamic> requestBody = {
    "username": username,
    "password": password,
    "email": email
  };
  // 요청시에는 map을 body에 담기 (dio가 json으로 변경해준다)
  // 응답시에는 Response.data에 map을 담아줌 (dio가 json을 map으로 변경해서 담아준다)
  Response response = await dio.post("/join", data: requestBody);
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  responseDTO.data = User.fromJson(responseDTO.data);
  print(responseDTO.code);
  print(responseDTO.msg);
  print(responseDTO.data);

  User user = responseDTO.data;
  print(user.id);
  print(user.email);
  print(user.username);
}
