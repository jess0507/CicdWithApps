import 'package:dio/dio.dart';

class HttpResponse<T> extends Response {
  final Response response;
  final T deserializedData;

  HttpResponse({
    required this.response,
    required this.deserializedData,
  }) : super(
          data: response.data,
          requestOptions: response.requestOptions,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
          isRedirect: response.isRedirect,
          redirects: response.redirects,
          extra: response.extra,
          headers: response.headers,
        );
}
