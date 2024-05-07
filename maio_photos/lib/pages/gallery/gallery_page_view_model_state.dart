import 'dart:convert';

import 'package:maio_photos/model/db/entity/photo.dart';

class GalleryPageViewModelState {
  final List<Photo> photos;

  GalleryPageViewModelState._({
    required this.photos,
  });

  factory GalleryPageViewModelState.empty() =>
      GalleryPageViewModelState._(photos: const []);

  GalleryPageViewModelState copyWith({
    List<Photo>? photos,
  }) =>
      GalleryPageViewModelState._(
        photos: photos ?? this.photos,
      );

  factory GalleryPageViewModelState.fromJson(String str) =>
      GalleryPageViewModelState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GalleryPageViewModelState.fromMap(Map<String, dynamic> json) =>
      GalleryPageViewModelState._(
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
      };
}
