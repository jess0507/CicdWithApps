// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_page_view_model_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GalleryPageViewModelState _$GalleryPageViewModelStateFromJson(
        Map<String, dynamic> json) =>
    GalleryPageViewModelState(
      photos: (json['photos'] as List<dynamic>)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GalleryPageViewModelStateToJson(
        GalleryPageViewModelState instance) =>
    <String, dynamic>{
      'photos': instance.photos,
    };
