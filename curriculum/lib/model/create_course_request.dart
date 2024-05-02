import 'package:dio/dio.dart';

import 'requset.dart';

class CreateCourseRequest extends Request<void> {
  CreateCourseRequest(Map<String, dynamic> data) {
    path = "/courses";
    method = "POST";
    this.data = data;
  }

  @override
  void handleResponse(Response response) {}
}
