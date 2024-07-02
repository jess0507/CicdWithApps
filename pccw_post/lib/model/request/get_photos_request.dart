import 'package:dio/dio.dart';

import '../db/entity/photo.dart';
import 'requset.dart';

class GetPhotosRequest extends Request<List<Photo>> {
  GetPhotosRequest() {
    path = "/photos";
    method = "GET";
  }

  @override
  List<Photo> deserialize(Response response) {
    // Check if data is a List
    if (response.data is List<dynamic>) {
      // Convert each item to Photo object
      return List<Photo>.from(
          response.data.map((item) => Photo.fromJson(item)));
    } else {
      // If data is not a List, return empty list
      return [];
    }
  }
}
