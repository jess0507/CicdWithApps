import 'dart:async';

import 'package:curriculum/test/data/teacher_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

import '../../api/api_service.dart';
import '../../model/api_request.dart';
import '../data/course_list.dart';

class MockApiService extends Mock implements ApiService {
  @override
  Future<Response> request(ApiRequest request) {
    Completer<Response<dynamic>> completer = Completer<Response<dynamic>>();
    int statusCode = 200;

    // 創建一個 Response 對象
    Response<dynamic> response = Response(
      statusCode: statusCode,
      requestOptions: RequestOptions(
        path: request.path,
        method: request.method,
        headers: request.headers,
        queryParameters: request.parameters,
        data: request.data,
      ),
    );

    if (request.path == '/teachers') {
      response.data = teacherList;
    } else if (request.path == '/courses' && request.method == 'GET') {
      response.data = courseList;
    } else if (request.path == '/courses' && request.method == 'POST') {
      if (request.data is Map && (request.data as Map).isEmpty) {
        response.statusCode = 400;
        response.data = {"error": "Missing request parameters."};
      } else {
        response.statusCode = 200;
        response.data = {"message": "Request processed successfully."};
      }
    } else {
      response.statusCode = 404;
      response.data = {'error': 'Resource not found'};
    }

    completer.complete(response);

    return completer.future;
  }
}
