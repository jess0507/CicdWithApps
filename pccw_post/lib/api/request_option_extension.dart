import 'package:dio/dio.dart';

import 'request_option_extra_keys.dart';

extension RequestOptionsX on RequestOptions {
  DateTime? get requestAt =>
      extra[RequestOptionExtraKeys.requestAt] as DateTime?;

  set requestAt(DateTime? value) =>
      extra[RequestOptionExtraKeys.requestAt] = value;

  // CacheControl? get cacheControl =>
  //     extra[RequestOptionExtraKeys.cacheControl] as CacheControl?;

  // set cacheControl(CacheControl? value) =>
  //     extra[RequestOptionExtraKeys.cacheControl] = value;

  bool? get retryEnable =>
      (extra[RequestOptionExtraKeys.retryEnable] as bool?) ?? false;

  set retryEnable(bool? value) =>
      extra[RequestOptionExtraKeys.retryEnable] = value;

  Duration? get retryTimeout =>
      extra[RequestOptionExtraKeys.retryTimeout] as Duration?;

  set retryTimeout(Duration? value) =>
      extra[RequestOptionExtraKeys.retryTimeout] = value;

  int get retryAttempt =>
      (extra[RequestOptionExtraKeys.retryAttempt] as int?) ?? 0;

  set retryAttempt(int value) =>
      extra[RequestOptionExtraKeys.retryAttempt] = value;

  set requestId(String? value) =>
      extra[RequestOptionExtraKeys.requestId] = value;

  String? get requestId => extra[RequestOptionExtraKeys.requestId];

  set requestClassName(String? value) =>
      extra[RequestOptionExtraKeys.requestClassName] = value;

  String? get requestClassName =>
      extra[RequestOptionExtraKeys.requestClassName];

  bool get logEnable =>
      (extra[RequestOptionExtraKeys.logEnable] as bool?) ?? false;

  set logEnable(bool? value) => extra[RequestOptionExtraKeys.logEnable] = value;
}
