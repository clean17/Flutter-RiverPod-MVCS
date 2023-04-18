import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/controller/post_controller.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_navigation.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/home_page/components/post_home_body.dart';
import 'package:logger/logger.dart';

class PostHomePage extends ConsumerWidget {
  PostHomePage({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Logger().d("homePage 빌드");

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomNavigation(scaffoldKey),
      appBar: AppBar(
        title: const Text("블로그"),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          ref.read(postControllerProvider).refresh();
        },
        child: const PostHomeBody(),
      ),
    );
  }
}
