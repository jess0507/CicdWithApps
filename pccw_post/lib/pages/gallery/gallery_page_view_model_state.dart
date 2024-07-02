import 'package:json_annotation/json_annotation.dart';
import 'package:pccw_post/model/db/entity/photo.dart';

part 'gallery_page_view_model_state.g.dart';

@JsonSerializable()
class GalleryPageViewModelState {
  final List<Photo> photos;

  GalleryPageViewModelState({
    required this.photos,
  });

  factory GalleryPageViewModelState.empty() =>
      GalleryPageViewModelState(photos: const []);

  GalleryPageViewModelState copyWith({
    List<Photo>? photos,
  }) =>
      GalleryPageViewModelState(
        photos: photos ?? this.photos,
      );

  Map<String, dynamic> toMap(GalleryPageViewModelState instance) =>
      _$GalleryPageViewModelStateToJson(instance);

  factory GalleryPageViewModelState.fromMap(Map<String, dynamic> json) =>
      _$GalleryPageViewModelStateFromJson(json);
}
