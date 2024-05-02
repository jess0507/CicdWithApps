import 'package:dio/dio.dart';

import '../model/api_request.dart';

class ApiService {
  // 需要更改到對應的endpoint
  static const String endpoint = 'https://jsonplaceholder.typicode.com';

  static final _instance = ApiService._();

  ApiService._();

  factory ApiService() => _instance;

  final Dio _dio = Dio();

  Dio getDioInstance() {
    return _dio;
  }

  Future<Response> request(ApiRequest request) async {
    try {
      final response = await _dio.fetch(
        RequestOptions(
          baseUrl: endpoint,
          path: request.path,
          method: request.method,
          headers: request.headers,
          queryParameters: request.parameters,
          data: request.data,
        ),
      );
      return response;
    } catch (e) {
      throw Exception('Request failed: $e');
    }
  }
}
