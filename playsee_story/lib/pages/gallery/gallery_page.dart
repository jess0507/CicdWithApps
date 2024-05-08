import 'package:playsee_story/pages/gallery/gallery_page_view_model.dart';
import 'package:playsee_story/pages/story/time_story_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GalleryPage extends ConsumerWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(galleryPageViewmodel).posts;

    return Scaffold(
      body: posts.isEmpty
          ? const SizedBox.shrink()
          : TimedStoriesScreen(dummyStories: posts),
    );
  }
}
