import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:pccw_post/hive/config/hive_type_id.dart';

part 'photo.g.dart';

@HiveType(typeId: HiveTypeId.photo)
@JsonSerializable()
class Photo extends HiveObject {
  @HiveField(1)
  final int? albumId;
  @HiveField(2)
  final int? id;
  @HiveField(3)
  final String? title;
  @HiveField(4)
  final String? url;
  @HiveField(5)
  final String? thumbnailUrl;

  String get imageUrl => url ?? '';

  Photo({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  Photo copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) =>
      Photo(
        albumId: albumId ?? this.albumId,
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      );

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
