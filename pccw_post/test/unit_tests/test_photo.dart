import 'package:flutter_test/flutter_test.dart';
import 'package:pccw_post/model/db/entity/photo.dart';

import '../json/photos.dart';

void testPhoto() {
  group('Photo unit tests', () {
    test('should return a valid Photo object when valid map is provided', () {
      if (photosMap.isEmpty) return;
      // 構建測試數據
      final Map<String, dynamic> testData = photosMap[0];

      // 調用 fromMap 方法
      final photo = Photo.fromJson(testData);

      // 驗證結果
      expect(photo.albumId, 1);
      expect(photo.id, 1);
      expect(photo.title, 'accusamus beatae ad facilis cum similique qui sunt');
      expect(photo.url, 'https://via.placeholder.com/600/92c952');
      expect(photo.thumbnailUrl, 'https://via.placeholder.com/150/92c952');
    });

    test('should handle null fields appropriately', () {
      // 構建包含空字段的測試數據
      final Map<String, dynamic> testData = {
        "albumId": null,
        "id": null,
        "title": null,
        "url": null,
        "thumbnailUrl": null
      };

      // 調用 fromMap 方法
      final photo = Photo.fromJson(testData);

      // 驗證結果
      expect(photo.albumId, null);
      expect(photo.id, null);
      expect(photo.title, null);
      expect(photo.url, null);
      expect(photo.thumbnailUrl, null);
    });

    test('should throw error when albumId is not an integer', () {
      // 構建包含非整數 albumId 的測試數據
      final Map<String, dynamic> testData = {
        "albumId": "not an integer",
        "id": 1,
        "title": "test title",
        "url": "https://example.com/photo1",
        "thumbnailUrl": "https://example.com/thumbnail1"
      };

      // 確認拋出異常
      expect(() => Photo.fromJson(testData), throwsA(isA<TypeError>()));
    });

    test('List<Photo> is converted from json.', () {
      final photoList = photosMap.map((e) => Photo.fromJson(e));
      expect(photoList.length, 5000);
    });
  });
}
