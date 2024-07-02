import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:pccw_post/api/http_config.dart';
import 'package:pccw_post/api/request_option_extension.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int retryCount;
  final int delay;

  RetryInterceptor({
    required this.dio,
    this.retryCount = HttpConfig.retryCount,
    this.delay = HttpConfig.delay,
  });

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.requestOptions.logEnable) {
      var log = Map.of({
        'class': runtimeType.toString(),
        'event': 'onError',
        'error': err.toString()
      });
      Fimber.d(jsonEncode(log));
    }

    if (err.requestOptions.retryEnable == false) {
      return super.onError(err, handler);
    }

    final int attempt = err.requestOptions.retryAttempt + 1;
    if (attempt >= retryCount) {
      return super.onError(err, handler);
    }

    await Future.delayed(Duration(seconds: delay));
    err.requestOptions.retryAttempt = attempt + 1;
    try {
      dio.fetch(err.requestOptions).then((value) => handler.resolve(value));
    } on DioException catch (err) {
      super.onError(err, handler);
    }
  }
}
