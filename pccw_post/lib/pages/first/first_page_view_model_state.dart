import 'package:json_annotation/json_annotation.dart';
import 'package:photo_manager/photo_manager.dart';

@JsonSerializable()
class FirstPageViewModelState {
  final String filePath;
  final List<AssetEntity> mediaList;
  final int? selectedIndex;

  FirstPageViewModelState({
    required this.filePath,
    required this.mediaList,
    required this.selectedIndex,
  });

  factory FirstPageViewModelState.empty() => FirstPageViewModelState(
        filePath: '',
        mediaList: [],
        selectedIndex: null,
      );

  FirstPageViewModelState copyWith({
    String? filePath,
    List<AssetEntity>? mediaList,
    int? selectedIndex,
  }) =>
      FirstPageViewModelState(
        filePath: filePath ?? this.filePath,
        mediaList: mediaList ?? this.mediaList,
        selectedIndex: selectedIndex ?? this.selectedIndex,
      );
}
