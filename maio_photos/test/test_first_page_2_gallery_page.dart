import 'package:flutter_test/flutter_test.dart';
import 'package:maio_photos/pages/first/navigation_button.dart';

import 'package:maio_photos/pages/gallery/gallery_page.dart';
import 'package:maio_photos/photos_app.dart';

Future<void> testFirstPage2GalleryPage(tester) async {
  await tester.pumpWidget(const PhotosApp());
  final navigationButton = find.byType(NavigationButton);
  expect(navigationButton, findsOneWidget);

  // ACT
  await tester.tap(navigationButton);
  await tester.pumpAndSettle(const Duration(seconds: 2));

  // ASSERT
  final galleryPage = find.byType(GalleryPage);
  expect(galleryPage, findsOneWidget);
}
