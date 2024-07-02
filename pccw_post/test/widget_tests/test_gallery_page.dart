import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pccw_post/model/db/entity/photo.dart';
import 'package:pccw_post/pages/gallery/gallery_page.dart';
import 'package:pccw_post/pages/gallery/gallery_page_view_model.dart';
import 'package:pccw_post/pages/gallery/photo_item.dart';
import 'package:pccw_post/util/lokalise_key.dart';

import '../json/photos.dart';

Future<void> testGalleryPage(WidgetTester tester) async {
  // 創建一個假的 ViewModel 以提供照片
  final viewModel = GalleryPageViewmodel.test();
  List<Photo> list =
      photosMap.map<Photo>((json) => Photo.fromJson(json)).toList();
  viewModel.update(list: list);

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

  if (kDebugMode) {
    print("test photos' length: ${viewModel.state.photos.length}");
  }
  // 檢查 GridView 是否正確顯示照片
  expect(find.byType(PhotoItem), findsAny);
}
