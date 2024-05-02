import 'package:dio/dio.dart';

import 'requset.dart';
import 'course.dart';

class GetCourseListRequest extends Request<List<Course>> {
  GetCourseListRequest() {
    path = "/courses";
    method = "GET";
  }

  @override
  List<Course> handleResponse(Response response) {
    List<Course> courses = [];
    for (var courseJson in response.data) {
      courses.add(Course.fromMap(courseJson));
    }
    return courses;
  }
}
