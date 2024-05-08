import 'dart:convert';

import 'package:playsee_story/model/entity/post.dart';

class GalleryPageViewModelState {
  final List<Post> posts;

  GalleryPageViewModelState._({
    required this.posts,
  });

  factory GalleryPageViewModelState.empty() =>
      GalleryPageViewModelState._(posts: const []);

  GalleryPageViewModelState copyWith({
    List<Post>? posts,
  }) =>
      GalleryPageViewModelState._(
        posts: posts ?? this.posts,
      );

  factory GalleryPageViewModelState.fromJson(String str) =>
      GalleryPageViewModelState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GalleryPageViewModelState.fromMap(Map<String, dynamic> json) =>
      GalleryPageViewModelState._(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
      };
}
