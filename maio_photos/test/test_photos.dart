import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:maio_photos/model/db/entity/photo.dart';

import 'test_data.dart';

testPhotoFromMap() {
  test('should return a valid Photo object when valid map is provided', () {
    // 構建測試數據
    final Map<String, dynamic> testData = {
      "albumId": 1,
      "id": 1,
      "title": "test title",
      "url": "https://example.com/photo1",
      "thumbnailUrl": "https://example.com/thumbnail1"
    };

    // 調用 fromMap 方法
    final photo = Photo.fromMap(testData);

    // 驗證結果
    expect(photo.albumId, 1);
    expect(photo.id, 1);
    expect(photo.title, "test title");
    expect(photo.url, "https://example.com/photo1");
    expect(photo.thumbnailUrl, "https://example.com/thumbnail1");
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
    final photo = Photo.fromMap(testData);

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
    expect(() => Photo.fromMap(testData), throwsA(isA<TypeError>()));
  });

  test('test data', () {
    List<Photo> photos;

    final json = jsonDecode(testData);
    if (json is List<dynamic>) {
      photos = List<Photo>.from(json.map((item) => Photo.fromMap(item)));
    } else {
      photos = [];
    }
    expect(photos.length, 10);
  });
}
