import 'package:go_router/go_router.dart';
import 'package:pccw_post/pages/first/navigation_button.dart';
import 'package:pccw_post/pages/gallery/gallery_page.dart';
import 'package:pccw_post/router/router.dart';
import 'package:pccw_post/util/lokalise_key.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  static const routeName = '/';

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
              context.push(GalleryPage.routeName.routerFullName);
            },
          ),
        ],
      ),
    );
  }
}
