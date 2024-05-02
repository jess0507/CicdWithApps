import 'package:dio/dio.dart';

import 'requset.dart';

class DeleteCourseRequest extends Request<void> {
  final String courseId;

  DeleteCourseRequest(this.courseId) {
    path = "/courses/$courseId";
    method = "DELETE";
  }

  @override
  void handleResponse(Response response) {}
}
