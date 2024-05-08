import 'package:maio_photos/pages/first/navigation_button.dart';
import 'package:maio_photos/pages/gallery/gallery_page.dart';
import 'package:maio_photos/util/lokalise_key.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LokaliseKey.firstPage),
        centerTitle: true,
      ),
      body: Column(
        children: [
          NavigationButton(
            title: LokaliseKey.navigateGallery,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const GalleryPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
