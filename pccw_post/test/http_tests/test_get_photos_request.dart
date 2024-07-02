import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pccw_post/api/api_service.dart';
import 'package:pccw_post/model/request/get_photos_request.dart';

Future<void> getPhotosRequestTest() async {
  try {
    // start timer
    final stopwatch = Stopwatch()..start();

    final request = GetPhotosRequest().toApiRequest();
    final response = await ApiService().request(request);

    // stop timer
    stopwatch.stop();
    if (kDebugMode) {
      print(
          '${request.runtimeType} completed in ${stopwatch.elapsedMilliseconds} ms');
    }

    if (response.statusCode == 200) {
      final List<dynamic> photos = response.data;

      final directory = Directory('test/json');
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      final file = File('${directory.path}/photos.json');
      await file.writeAsString(jsonEncode(photos), flush: true);

      if (kDebugMode) {
        print('Data has been fetched and saved to ${file.path}');
      }
    } else {
      if (kDebugMode) {
        print('Failed to load photos');
      }
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error: $e');
    }
  }
}
