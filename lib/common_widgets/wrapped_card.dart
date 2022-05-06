import 'package:flutter/material.dart';
import 'package:flutter_cms/utils/screen_env.dart';

class WrappedCard extends StatelessWidget {
  const WrappedCard({Key? key, required this.widget}) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(ScreenEnv.deviceWidth * 0.02),
      child: Padding(
          padding: EdgeInsets.all(ScreenEnv.deviceWidth * 0.02),
          child: widget
      ),
    );
  }
}
