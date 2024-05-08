import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:maio_photos/hive/config/box_name.dart';
import 'package:maio_photos/pages/first/navigation_button.dart';
import 'package:maio_photos/pages/gallery/gallery_page.dart';
import 'package:maio_photos/photos_app.dart';

void testNavigationToGallery() {
  setUp(() async {
    final testPath = File('test-resources').path;
    Hive.init(testPath);
    final box = await Hive.openBox(BoxName.photos.name);
    await box.clear();
  });

  testWidgets('Test Navigation from First Page to Gallery', (tester) async {
    await tester.pumpWidget(const PhotosApp());
    final navigationButton = find.byType(NavigationButton);
    expect(navigationButton, findsOneWidget);

    // ACT
    await tester.tap(navigationButton);
    await tester.pumpAndSettle();

    // ASSERT
    final galleryPage = find.byType(GalleryPage);
    expect(galleryPage, findsOneWidget);
  });
}
