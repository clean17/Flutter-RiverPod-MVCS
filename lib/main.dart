import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/core/constants/move.dart';
import 'package:flutter_riverpod_blog_start/model/user/user_repository.dart';
import 'package:flutter_riverpod_blog_start/provider/session_provider.dart';

// 뷰가 아닌곳에서 컨텍스트에 접근하기 위함
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
// 필요한것은 다 로딩중에 실행 ( 동기적으로 수행  해야함 !! 순서가 중요)
  WidgetsFlutterBinding.ensureInitialized(); // 로딩중 비동기 작업이 모두 완료되면 렌더링 실행
  // 1. secure Storage 안에 jwt 확인
  // 2. jwt로 회원정보를 가져온다.
  // 3. Session을 동기화 (ref 이용해서 Session User를 이용)
  // await secureStorage.read(key: 'jwt');
  // 서버에 요청을 보내서 검사했지만 프론트에서 토큰으로 세션을 만들면 장점이 있음

  SessionUser sessionUser = await UserRepository().fetchJwtVerify();

  runApp(
    ProviderScope(
      overrides: [sessionProvider.overrideWithValue(sessionUser)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // navigatorKey.currentContext; 글로벌키를 이용하면 컨텍스트 어디서든 접근
    SessionUser sessionUser = ref.read(sessionProvider);
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: sessionUser.isLogin! ? Move.postHomePage : Move.loginPage,
      routes: getRouters(),
    );
  }
}
