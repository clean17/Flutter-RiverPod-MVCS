import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/home_page/post_home_body.dart';
import 'package:logger/logger.dart';

import '../../../components/custom_navigation.dart';

class PostHomePage extends StatelessWidget {
  PostHomePage({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    Logger().d("homePage 빌드");

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomNavigation(scaffoldKey),
      appBar: AppBar(
        title: const Text(""),
      ),
      body: PostHomeBody(),
    );
  }
}
