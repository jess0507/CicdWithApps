import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';

import '../api/api_service.dart';
import 'api_request.dart';
import 'http_response.dart';

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

  Future<HttpResponse> request() async {
    final request = ApiRequest(
      path: path,
      method: method,
      headers: headers,
      parameters: parameters,
      data: data,
    );

    final response = await ApiService().request(request);
    HttpResponse httpResponse;
    try {
      httpResponse = HttpResponse(
        response: response,
        deserializedData: deserialize(response),
      );
    } catch (e) {
      Fimber.e('Error to deserialize data.');
      rethrow;
    }
    return httpResponse;
  }

  T? deserialize(Response response) => null;
}
