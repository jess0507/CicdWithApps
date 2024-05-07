import 'package:maio_photos/pages/gallery/gallery_page_view_model.dart';
import 'package:maio_photos/pages/gallery/photo_item.dart';
import 'package:maio_photos/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GalleryPage extends ConsumerWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photos = ref.watch(galleryPageViewmodel).photos;

    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.firstPageTitle),
        centerTitle: true,
      ),
      body: photos.isEmpty
          ? const SizedBox.shrink()
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return PhotoItem(photo: photos[index]);
              },
            ),
    );
  }
}
