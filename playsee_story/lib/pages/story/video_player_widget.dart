import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String coverUrl;
  final String videoUrl;

  const VideoPlayerWidget({
    super.key,
    required this.coverUrl,
    required this.videoUrl,
  });

  @override
  VideoPlayerWidgetState createState() => VideoPlayerWidgetState();
}

class VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: MediaQuery.of(context).size.width /
                MediaQuery.of(context).size.height,
            child: VideoPlayer(_controller),
          );
        } else {
          return Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                widget.coverUrl,
                fit: BoxFit.fitHeight,
                cacheHeight: MediaQuery.of(context).size.height.toInt(),
                cacheWidth: MediaQuery.of(context).size.width.toInt(),
              ),
              const CircularProgressIndicator(),
            ],
          );
        }
      },
    );
  }
}
