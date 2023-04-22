// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod_blog_start/core/constants/http.dart';
// import 'package:flutter_riverpod_blog_start/core/constants/move.dart';
// import 'package:flutter_riverpod_blog_start/dto/response_dto.dart';
// import 'package:flutter_riverpod_blog_start/dto/user_request.dart';
// import 'package:flutter_riverpod_blog_start/main.dart';
// import 'package:flutter_riverpod_blog_start/provider/session_provider.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// final userControllerProvider = Provider<UserController>((ref) {
//   return UserController(ref);
// });

// class UserController {
//   final mContext = navigatorKey
//       .currentContext; // !!! 선언만 하면된다 방법은 ? -> main.dart ( 글로벌 키 !! )
//   final Ref ref;
//   UserController(this.ref);

//   Future<void> join(String username, String password, String email) async {
//     JoinReqDTO joinReqDTO =
//         JoinReqDTO(username: username, password: password, email: email);
//     // print(joinReqDTO.email);
//     // print(joinReqDTO.username);
//     // print(joinReqDTO.password);
//     ResponseDTO responseDTO = await ref
//         .read(authRepositoryProvider)
//         .fetchJoin(joinReqDTO); // fetchjoin 은 dio가 로그인 요청

//     if (responseDTO.code == 1) {
//       Navigator.pushNamed((mContext!), Move.loginPage);
//     } else {
//       // ScaffoldMessenger.of(mContext!)
//       //     .showSnackBar(const SnackBar(content: Text('회원가입 실패')));
//       showToast('회원가입 실패');
//     }
//   }

//   Future<void> login(String username, String password) async {
//     LoginReqDTO loginReqDTO =
//         LoginReqDTO(username: username, password: password);
//     ResponseDTO responseDTO = await ref
//         .read(authRepositoryProvider)
//         .fetchLogin(loginReqDTO); // fetchjoin 은 dio가 로그인 요청
//     if (responseDTO.code == 1) {
//       // 1. 토큰을 디바이스데 저장
//       await secureStorage.write(
//           key: 'jwt', value: responseDTO.token); // 마찬가지로 I/O 는 await
//       // 2. 로그인 상태 등록
//       ref
//           .read(sessionProvider)
//           .loginSuccess(responseDTO.data, responseDTO.token!);
//       // 3. 화면 이동
//       Navigator.popAndPushNamed((mContext!), Move.postHomePage);
//     } else {
//       // ScaffoldMessenger.of(mContext!)
//       //     .showSnackBar(const SnackBar(content: Text('회원가입 실패')));
//       showToast('로그인 실패');
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/core/constants/http.dart';
import 'package:flutter_riverpod_blog_start/core/constants/move.dart';
import 'package:flutter_riverpod_blog_start/dto/user_request.dart';
import 'package:flutter_riverpod_blog_start/dto/response_dto.dart';
import 'package:flutter_riverpod_blog_start/main.dart';
import 'package:flutter_riverpod_blog_start/model/user/user_repository.dart';
import 'package:flutter_riverpod_blog_start/provider/session_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';

final userControllerProvider = Provider<UserController>((ref) {
  return UserController(ref);
});

class UserController {
  // Repository, ViewModel 의존
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  UserController(this.ref);

  Future<void> join(String username, String password, String email) async {
    JoinReqDTO joinReqDTO =
        JoinReqDTO(username: username, password: password, email: email);
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
    if (responseDTO.code == 1) {
      Navigator.pushNamed(mContext!, Move.loginPage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(const SnackBar(content: Text("회원가입 실패")));
    }
  }

  Future<void> login(String username, String password) async {
    LoginReqDTO loginReqDTO =
        LoginReqDTO(username: username, password: password);
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);
    if (responseDTO.code == 1) {
      // 1. 토큰을 휴대폰에 저장
      await secureStorage.write(key: "jwt", value: responseDTO.token);

      // 2. 로그인 상태 등록
      ref
          .read(sessionProvider)
          .loginSuccess(responseDTO.data, responseDTO.token!);

      // 3. 화면 이동
      Navigator.popAndPushNamed(mContext!, Move.postHomePage);
    } else {
      // ScaffoldMessenger.of(mContext!)
      //     .showSnackBar(const SnackBar(content: Text("회원가입 실패")));
      showToast('로그인 실패 !!!!!!!!!!!!');
    }
  }

  Future<void> logOut() async {
    try {
      await ref.read(sessionProvider).logoutSuccess();
      Navigator.pushNamedAndRemoveUntil(
          mContext!, Move.loginPage, (route) => false);
    } catch (e) {
      Logger().d('디바에서 토큰 삭제하다가 익셉션 발생');
      showToast('로그아웃 실패');
    }
  }
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
