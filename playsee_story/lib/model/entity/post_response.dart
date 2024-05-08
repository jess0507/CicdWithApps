import 'dart:convert';

import 'post.dart';

class PostResponse {
  final List<Post>? p;

  PostResponse({
    this.p,
  });

  PostResponse copyWith({
    List<Post>? p,
  }) =>
      PostResponse(
        p: p ?? this.p,
      );

  factory PostResponse.fromJson(String str) =>
      PostResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostResponse.fromMap(Map<String, dynamic> json) => PostResponse(
        p: json["p"] == null
            ? []
            : List<Post>.from(json["p"]!.map((x) => Post.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "p": p == null ? [] : List<dynamic>.from(p!.map((x) => x.toMap())),
      };
}
