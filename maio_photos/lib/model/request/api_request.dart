class ApiRequest {
  final String path;
  final String method;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? parameters;
  final dynamic data;

  ApiRequest({
    required this.path,
    required this.method,
    this.headers,
    this.parameters,
    this.data,
  });
}
