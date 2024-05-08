import 'package:dio/dio.dart';
import 'package:playsee_story/model/entity/post_response.dart';

import 'requset.dart';

class GetPostRequest extends Request<PostResponse> {
  GetPostRequest() {
    headers = {'authorization': '0123456789#0#examId'};
    path = "/test1.0/backstage/exm1";
    method = "GET";
  }

  @override
  PostResponse deserialize(Response response) {
    return PostResponse.fromMap(response.data);
  }
}
