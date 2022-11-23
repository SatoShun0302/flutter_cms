import 'package:flutter/material.dart';
import 'package:flutter_cms/utils/screen_env.dart';

class ArticleListTileChild extends StatelessWidget {
  const ArticleListTileChild({Key? key,
    required this.title,
    required this.insertDate,
    required this.updateDate,
    this.top, this.right, this.bottom, this.left}) : super(key: key);

  final String title;
  final String insertDate;
  final String updateDate;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: top ?? 0.0,
          right: right ?? 0.0,
          bottom: bottom ?? ScreenEnv.deviceWidth * 0.02,
          left: left ?? 0.0,
      ),
      height: ScreenEnv.deviceWidth * 0.4,
      child: Column(
        children: [
          Expanded(
              child: Text(title),
          ),
          Expanded(
              child: Text(insertDate),
          ),
          Expanded(
              child: Text(updateDate),
          ),
        ],
      ),
    );
  }
}
