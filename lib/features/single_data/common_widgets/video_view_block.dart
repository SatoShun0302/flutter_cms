import 'package:flutter/material.dart';
import 'package:flutter_cms/utils/screen_env.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoViewBlock extends StatefulWidget {
  const VideoViewBlock({Key? key, required this.youtubeUrl, this.top, this.right, this.bottom, this.left}) : super(key: key);
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final String youtubeUrl;

  @override
  _VideoViewBlockState createState() => _VideoViewBlockState();
}

class _VideoViewBlockState extends State<VideoViewBlock> {

  late YoutubePlayerController _controller;

  @override
  void initState(){
    String? videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: widget.top ?? ScreenEnv.deviceWidth * 0.05,
          right: widget.right ?? ScreenEnv.deviceWidth * 0.02,
          bottom: widget.bottom ?? ScreenEnv.deviceWidth * 0.05,
          left: widget.left ?? ScreenEnv.deviceWidth * 0.02),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        controlsTimeOut: const Duration(seconds: 10),
        // onReady: (){
        //     _controller.play();
        // },
      )
    );
  }
}
