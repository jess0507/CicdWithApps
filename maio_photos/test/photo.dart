import 'package:fimber/fimber.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maio_photos/model/db/entity/photo.dart';
import 'package:maio_photos/model/request/get_photos_request.dart';
import 'package:maio_photos/model/response/http_response.dart';

void testPhotoRetrieval() {
  test('Test Photo Retrieval', () async {
    // Action
    HttpResponse? response;
    try {
      response = await GetPhotosRequest().request();
    } catch (e) {
      Fimber.d('Fail to request: $e, UI needs display error.');
    }
    // Assert
    if (response?.statusCode == 200) {
      final List<Photo> list = response?.deserializedData;
      expect(list.length, 5000);
      expect(list[0].id, isA<int>());
      expect(list[0].albumId, isA<int>());
      expect(list[0].title, isNotEmpty);
      expect(list[0].url, isNotEmpty);
    }
  });
}
