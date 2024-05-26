import 'package:flutter_test/flutter_test.dart';

import 'hive_config.dart';
import 'test_first_page_2_gallery_page.dart';
import 'test_gallery_page.dart';
import 'test_photos.dart';

void main() {
  setUp(() async {
    await HiveConfig().initHive();
  });

  group('Photo.fromMap', testPhotoFromMap);

  testWidgets(
      'GalleryPage Test', (WidgetTester tester) => testGalleryPage(tester));
  testWidgets('TestNavigation from FirstPage to GalleryPage',
      (WidgetTester tester) => testFirstPage2GalleryPage(tester));
}
