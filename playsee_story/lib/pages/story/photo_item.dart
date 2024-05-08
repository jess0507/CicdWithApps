import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';

import '../../model/entity/post.dart';
import 'avatar.dart';
import 'video_player_widget.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    // final itemWidth = MediaQuery.of(context).size.width ~/ 4;
    final avatarUrl =
        'http://storage.googleapis.com/usr-framy/headshot/${post.userId}.jpg';
    final coverUrl =
        'http://storage.googleapis.com/pst-framy/stk/${post.id}.jpg';
    final videoUrl =
        'https://storage.googleapis.com/pst-framy/vdo/${post.id}.mp4';

    Fimber.d(videoUrl);

    return Stack(
      alignment: Alignment.topLeft,
      children: [
        VideoPlayerWidget(
          coverUrl: coverUrl,
          videoUrl: videoUrl,
        ),
        SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 20, right: 8),
                    child: Avatar(url: avatarUrl),
                  ),
                  Column(
                    children: [
                      Text(
                        post.userName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
