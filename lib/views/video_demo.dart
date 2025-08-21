import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDemo extends StatefulWidget {
  const VideoDemo({super.key});

  @override
  State<VideoDemo> createState() => _VideoDemoState();
}

class _VideoDemoState extends State<VideoDemo> {
  late VideoPlayerController _controller;


  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body:  VideoPlayer(_controller),
    );
  }
}
