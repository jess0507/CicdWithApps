import 'package:go_router/go_router.dart';
import 'package:maio_photos/pages/first/second_page.dart';
import 'package:maio_photos/pages/gallery/gallery_page.dart';

import '../pages/first/first_page.dart';

extension RouterNameExtension on String {
  String get routerFullName => '/$this';
}

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: FirstPage.routeName,
        builder: (context, state) => const FirstPage(),
        routes: [
          GoRoute(
            path: GalleryPage.routeName,
            builder: (context, state) => const GalleryPage(),
          ),
          GoRoute(
            path: SecondPage.routeName,
            builder: (context, state) => const SecondPage(),
          ),
        ],
      ),
    ],
  );
}
