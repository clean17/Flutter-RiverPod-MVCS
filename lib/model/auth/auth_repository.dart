import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/dto/auth_request.dart';
import 'package:flutter_riverpod_blog_start/dto/response_dto.dart';
import 'package:flutter_riverpod_blog_start/model/user/user.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

class AuthRepository {
  final dio = Dio();

  Future<ResponseDTO> fetchJoin(JoinReqDTO joinReqDTO) async {
    Response response = await dio.post(data: joinReqDTO.toJson(), '/join');
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    responseDTO.data = User.fromJson(responseDTO.data);
    return responseDTO;
  }

  Future<ResponseDTO> fetchLogin(LoginReqDTO loginReqDTO) async {
    // 1. 통신 시작
    Response response = await dio.post(data: loginReqDTO.toJson(), '/login');
    // 2. dto 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    responseDTO.data = User.fromJson(responseDTO.data);
    // 3. 토큰 받기
    responseDTO.token = response.headers["authorization"].toString();
    return responseDTO;
  }
}
