import 'package:dio/dio.dart';

import 'requset.dart';
import 'teacher.dart';

class GetTeacherListRequest extends Request<List<Teacher>> {
  GetTeacherListRequest() {
    path = "/teachers";
    method = "GET";
  }

  @override
  List<Teacher> handleResponse(Response response) {
    List<Teacher> teachers = [];
    for (var teacherJson in response.data) {
      teachers.add(Teacher.fromMap(teacherJson));
    }
    return teachers;
  }
}
