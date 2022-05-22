import 'package:flutter/material.dart';
import 'package:flutter_cms/utils/screen_env.dart';

class ImageViewBlock extends StatelessWidget {
  const ImageViewBlock({Key? key, required this.url, this.top, this.right, this.bottom, this.left}) : super(key: key);
  final String url;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: top ?? ScreenEnv.deviceWidth * ScreenEnv.multiplierTop,
          right: right ?? ScreenEnv.deviceWidth * ScreenEnv.multiplierRight,
          bottom: bottom ?? 0.0,
          left: left ?? ScreenEnv.deviceWidth * ScreenEnv.multiplierLeft),
      child: Image(
        image: NetworkImage(url),
      ),
    );
  }
}
