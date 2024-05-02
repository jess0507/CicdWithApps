import 'package:dio/dio.dart';

import 'requset.dart';

class CreateTeacherRequest extends Request<void> {
  CreateTeacherRequest(Map<String, dynamic> data) {
    path = "/teachers";
    method = "POST";
    this.data = data;
  }

  @override
  void handleResponse(Response response) {}
}
