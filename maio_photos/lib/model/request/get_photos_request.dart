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
    List<Photo> list = [];
    for (final json in response.data) {
      list.add(Photo.fromMap(json));
    }
    return list;
  }
}
