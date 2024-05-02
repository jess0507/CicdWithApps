import 'package:dio/dio.dart';

import 'requset.dart';

class UpdateCourseRequest extends Request<void> {
  final String courseId;

  UpdateCourseRequest(this.courseId, Map<String, dynamic> data) {
    path = "/courses/$courseId";
    method = "PUT";
    this.data = data;
  }

  @override
  void handleResponse(Response response) {}
}
