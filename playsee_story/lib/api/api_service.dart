import 'package:dio/dio.dart';

import '../model/request/api_request.dart';
import 'retry_interceptor.dart';

class ApiService {
  // 需要更改到對應的endpoint
  static const String endpoint = 'https://bas.playsee.dev';

  static final _instance = ApiService._();

  factory ApiService() => _instance;

  final Dio _dio = Dio();

  Dio getDioInstance() {
    return _dio;
  }

  ApiService._() {
    _dio.interceptors.addAll([
      RetryInterceptor(dio: _dio),
    ]);
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
