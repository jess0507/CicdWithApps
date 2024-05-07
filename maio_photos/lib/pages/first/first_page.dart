import 'package:maio_photos/pages/first/navigation_button.dart';
import 'package:maio_photos/pages/gallery/gallery_page.dart';
import 'package:maio_photos/pages/gallery/gallery_page_view_model.dart';
import 'package:maio_photos/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.firstPageTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          NavigationButton(
              title: 'Go to gallery.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ProviderScope(
                      overrides: [
                        galleryPageViewmodel
                            .overrideWith((ref) => GalleryPageViewmodel())
                      ],
                      child: const GalleryPage(),
                    );
                  }),
                );
              })
        ],
      ),
    );
  }
}
