import 'package:dio/dio.dart';

import '../api/api_service.dart';
import 'api_request.dart';
import 'course.dart';
import 'teacher.dart';

abstract class Request<T> {
  late final String path;
  late final String method;
  Map<String, dynamic>? headers;
  Map<String, dynamic>? parameters;
  dynamic data;

  ApiRequest toApiRequest() => ApiRequest(
        path: path,
        method: method,
        headers: headers,
        parameters: parameters,
        data: data,
      );

  RequestOptions get requestOptions => RequestOptions(
        path: path,
        method: method,
        headers: headers,
        queryParameters: parameters,
        data: data,
      );

  Future<T> request() async {
    final request = ApiRequest(
      path: path,
      method: method,
      headers: headers,
      parameters: parameters,
      data: data,
    );
    final response = await ApiService().request(request);
    return handleResponse(response);
  }

  T handleResponse(Response response);
}
