import 'package:dio/dio.dart';

import 'requset.dart';
import 'course.dart';

class GetTeacherCoursesListRequest extends Request<List<Course>> {
  final String teacherId;

  GetTeacherCoursesListRequest(this.teacherId) {
    path = "/teachers/$teacherId/courses";
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
