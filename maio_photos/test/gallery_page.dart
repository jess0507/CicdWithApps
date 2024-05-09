import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:maio_photos/hive/config/box_name.dart';
import 'package:maio_photos/model/db/entity/photo.dart';
import 'package:maio_photos/pages/gallery/gallery_page.dart';
import 'package:maio_photos/pages/gallery/gallery_page_view_model.dart';
import 'package:maio_photos/pages/gallery/photo_item.dart';
import 'package:maio_photos/util/lokalise_key.dart';

const testData = '''
[
  {
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "reprehenderit est deserunt velit ipsam",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "https://via.placeholder.com/150/771796"
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "officia porro iure quia iusto qui ipsa ut modi",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "https://via.placeholder.com/150/24f355"
  },
  {
    "albumId": 1,
    "id": 4,
    "title": "culpa odio esse rerum omnis laboriosam voluptate repudiandae",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "https://via.placeholder.com/150/d32776"
  },
  {
    "albumId": 1,
    "id": 5,
    "title": "natus nisi omnis corporis facere molestiae rerum in",
    "url": "https://via.placeholder.com/600/f66b97",
    "thumbnailUrl": "https://via.placeholder.com/150/f66b97"
  },
  {
    "albumId": 1,
    "id": 6,
    "title": "accusamus ea aliquid et amet sequi nemo",
    "url": "https://via.placeholder.com/600/56a8c2",
    "thumbnailUrl": "https://via.placeholder.com/150/56a8c2"
  },
  {
    "albumId": 1,
    "id": 7,
    "title": "officia delectus consequatur vero aut veniam explicabo molestias",
    "url": "https://via.placeholder.com/600/b0f7cc",
    "thumbnailUrl": "https://via.placeholder.com/150/b0f7cc"
  },
  {
    "albumId": 1,
    "id": 8,
    "title": "aut porro officiis laborum odit ea laudantium corporis",
    "url": "https://via.placeholder.com/600/54176f",
    "thumbnailUrl": "https://via.placeholder.com/150/54176f"
  },
  {
    "albumId": 1,
    "id": 9,
    "title": "qui eius qui autem sed",
    "url": "https://via.placeholder.com/600/51aa97",
    "thumbnailUrl": "https://via.placeholder.com/150/51aa97"
  },
  {
    "albumId": 1,
    "id": 10,
    "title": "beatae et provident et ut vel",
    "url": "https://via.placeholder.com/600/810b14",
    "thumbnailUrl": "https://via.placeholder.com/150/810b14"
  }
]
''';

void testGalleryPageContent() {
  setUp(() async {
    final testPath = File('test-resources').path;
    Hive.init(testPath);
    final box = await Hive.openBox(BoxName.photos.name);
    await box.clear();
  });

  testWidgets('Test Gallery Page Content', (WidgetTester tester) async {
    // 創建一個假的 ViewModel 以提供照片
    final viewModel = GalleryPageViewmodel.empty();

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
    expect(
        find.byType(PhotoItem), findsNWidgets(viewModel.state.photos.length));

    List<Photo> list =
        jsonDecode(testData).map<Photo>((json) => Photo.fromMap(json)).toList();
    viewModel.update(list: list);
    // 重新構建 Widget 樹以反映最新的 viewmodel
    await tester.pump();

    if (kDebugMode) {
      print("test photos' length: ${viewModel.state.photos.length}");
    }
    // 檢查 GridView 是否正確顯示照片
    expect(
        find.byType(PhotoItem), findsNWidgets(viewModel.state.photos.length));
  });
}
