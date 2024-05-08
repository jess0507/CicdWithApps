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
    List<Photo> list =
        response.data.map((json) => Photo.fromMap(json)).toList();
    return list;
  }
}
