import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:maio_photos/hive/config/box_name.dart';
import 'package:maio_photos/pages/first/navigation_button.dart';
import 'package:maio_photos/pages/gallery/gallery_page.dart';
import 'package:maio_photos/pages/gallery/gallery_page_view_model.dart';
import 'package:maio_photos/pages/gallery/photo_item.dart';
import 'package:maio_photos/photos_app.dart';
import 'package:maio_photos/util/lokalise_key.dart';

void testFirstPage2Gallery() {
  setUp(() async {
    final testPath = File('test-resources').path;
    Hive.init(testPath);
    final box = await Hive.openBox(BoxName.photos.name);
    await box.clear();
  });

  testWidgets('first page to gallery page', (tester) async {
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

  testWidgets('GalleryPage displays photos correctly',
      (WidgetTester tester) async {
    // 創建一個假的 ViewModel 以提供照片
    final viewModel = GalleryPageViewmodel();
    // viewModel.update(list: list)

    // 用假的 ViewModel 包裝 GalleryPage
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // 使用 provider 覆寫以提供假的 ViewModel
          galleryPageViewmodel.overrideWith((ref) => viewModel),
        ],
        child: const MaterialApp(
          home: GalleryPage(),
        ),
      ),
    );

    // 檢查 AppBar 的文字是否正確顯示
    expect(find.text(LokaliseKey.galleryPage), findsOneWidget);

    // 檢查 GridView 是否正確顯示照片
    expect(
        find.byType(PhotoItem), findsNWidgets(viewModel.state.photos.length));
  });
}
