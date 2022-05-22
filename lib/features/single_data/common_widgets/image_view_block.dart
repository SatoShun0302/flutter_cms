import 'package:flutter/material.dart';
import 'package:flutter_cms/features/single_data/repository/cloud_storage_repository.dart';
import 'package:flutter_cms/utils/screen_env.dart';

class ImageViewBlock extends StatelessWidget {
  const ImageViewBlock({Key? key, required this.rep , required this.url, this.top, this.right, this.bottom, this.left}) : super(key: key);
  final CloudStorageRepository rep;
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
      child:
      FutureBuilder<String>(
        future: rep.downloadArticlePicture(filePath: url),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Image(
              image: NetworkImage(snapshot.data!),
            );
          }
          return Text("loading");
        },
      ),
    );
  }
}
