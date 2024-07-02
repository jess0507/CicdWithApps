import 'http_tests/test_get_photos_request.dart';
import 'unit_tests/test_gallery_page_viewmodel.dart';
import 'unit_tests/test_photo.dart';
import 'widget_tests/test_widget.dart';

Future<void> main() async {
  await getPhotosRequestTest();
  testPhoto();
  testGalleryPageViewmodel();
  testWidget();
}
