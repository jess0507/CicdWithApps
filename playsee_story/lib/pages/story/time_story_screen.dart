import 'package:flutter/material.dart';
import 'package:playsee_story/pages/story/photo_item.dart';

import '../../model/entity/post.dart';

class TimedStoriesScreen extends StatefulWidget {
  final List<Post> dummyStories;

  const TimedStoriesScreen({
    super.key,
    this.dummyStories = const [],
  });

  @override
  TimedStoriesScreenState createState() => TimedStoriesScreenState();
}

class TimedStoriesScreenState extends State<TimedStoriesScreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < widget.dummyStories.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! > 0) {
          _nextPage();
        }
      },
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.dummyStories.length,
        itemBuilder: (context, index) {
          final post = widget.dummyStories[index];
          return Container(
            color: Colors.white,
            child: Center(
              child: PostItem(post: post),
            ),
          );
        },
      ),
    );
  }
}
