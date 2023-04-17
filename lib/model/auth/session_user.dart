import 'package:flutter_riverpod_blog_start/model/user/user.dart';

// 최소 앱 실행시 초기화 ( 디바이스 저장소에서 토큰 I/O ( 동기화 ))
// 1. jwt 존재확인
// 2. jwt 로 회원정보 받아옴  // 총 2번의 I/O 발생
// 3. 토큰 유효하면 loginSuccess
// 4. 유효x -> loginPage
class SessionUser {
  // 모델이기 때문에 값이 안들어올 가능성 -> ?
  User? user;
  String? jwt;
  bool? isLogin;

  // 토큰이 유효한지 확인 - 간단하게 토큰만 보내서 유효한지 확인하는 api생성
  void loginSuccess(User user, String jwt) {
    this.user = user;
    this.jwt = jwt;
    isLogin = true;
  }

  void logoutSuccess() {
    user = null;
    jwt = null;
    isLogin = false;
  }
}
