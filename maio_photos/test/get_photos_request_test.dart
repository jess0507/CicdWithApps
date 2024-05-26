import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maio_photos/api/api_service.dart';
import 'package:maio_photos/model/request/get_photos_request.dart';

Future<void> getPhotosRequestTest() async {
  final stopwatch = Stopwatch()..start(); // 开始计时
  final request = GetPhotosRequest().toApiRequest();
  final res = await ApiService().request(request);
  print(res);
  stopwatch.stop(); // 停止计时
  if (kDebugMode) {
    print('GetPhotosRequest completed in ${stopwatch.elapsedMilliseconds} ms');
  }
}
