import 'package:flutter/material.dart';
import 'package:flutter_cms/utils/screen_env.dart';

class TitleViewBlock extends StatelessWidget {
  const TitleViewBlock({Key? key, required this.text, this.top, this.right, this.bottom, this.left}) : super(key: key);
  final String text;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: top ?? ScreenEnv.deviceWidth * 0.05,
          right: right ?? ScreenEnv.deviceWidth * 0.02,
          bottom: bottom ?? ScreenEnv.deviceWidth * 0.05,
          left: left ?? ScreenEnv.deviceWidth * 0.02),
      child: Text(text),
    );
  }
}
