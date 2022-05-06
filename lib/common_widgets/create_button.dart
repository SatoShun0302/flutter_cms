import 'package:flutter/material.dart';
import 'package:flutter_cms/utils/screen_env.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({Key? key,
    required this.text,
    required this.onPressed,
    this.topPadding = 20,
    this.bottomPadding = 10,
    this.leftPadding = 0,
    this.rightPadding = 0}) : super(key: key);

  final Widget text;
  final Function() onPressed;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding, left: leftPadding, right: rightPadding),
      child: ElevatedButton(
        child: text,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(80)),
          ),
          elevation: 4.0,
          fixedSize: Size.fromWidth(ScreenEnv.deviceWidth * 0.6),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
