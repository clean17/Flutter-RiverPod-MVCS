import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/core/constants/http.dart';
import 'package:flutter_riverpod_blog_start/core/constants/move.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
// 필요한것은 다 로딩중에 실행 ( 동기적으로 수행해야함 !! 순서가 중요)
  WidgetsFlutterBinding.ensureInitialized(); // 로딩중 비동기 작업이 모두 완료되면 렌더링 실행
  // 1. secure Storage 안에 jwt 확인
  // 2. jwt로 회원정보를 가져온다.
  // 3. Session을 동기화 (ref 이용해서 Session User를 이용)
  await secureStorage.read(key: 'jwt');
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // navigatorKey.currentContext; 글로벌키를 이용하면 컨텍스트 어디서든 접근
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Move.loginPage,
      routes: getRouters(),
    );
  }
}
