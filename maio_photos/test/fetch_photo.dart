import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maio_photos/pages/gallery/gallery_page_view_model.dart';

Future<void> fetchPhoto() async {
  final fakeViewModel = GalleryPageViewmodel.empty();

  final stopwatch = Stopwatch()..start(); // 开始计时
  await fakeViewModel.fetchPhotos();
  print('state: ${fakeViewModel.state.photos.length}');
  stopwatch.stop(); // 停止计时
  if (kDebugMode) {
    print('fetchPhotos completed in ${stopwatch.elapsedMilliseconds} ms');
  }
}
