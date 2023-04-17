import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:logger/logger.dart';

class PostHomeBody extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  PostHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: () async {},
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    Logger().d("Consumer _buildBody 실행");
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: ListTile(
            leading: Text("1"),
            title: Text("제목1"),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
