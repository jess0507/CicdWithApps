import 'package:photo_manager/photo_manager.dart';

class FirstPageViewModelState {
  final String filePath;
  final String link;
  final List<AssetEntity> mediaList;
  final int? selectedIndex;

  FirstPageViewModelState({
    required this.filePath,
    required this.link,
    required this.mediaList,
    required this.selectedIndex,
  });

  factory FirstPageViewModelState.empty() => FirstPageViewModelState(
        filePath: '',
        link: '',
        mediaList: [],
        selectedIndex: null,
      );

  FirstPageViewModelState copyWith({
    String? filePath,
    String? link,
    List<AssetEntity>? mediaList,
    int? selectedIndex,
  }) =>
      FirstPageViewModelState(
        filePath: filePath ?? this.filePath,
        link: link ?? this.link,
        mediaList: mediaList ?? this.mediaList,
        selectedIndex: selectedIndex ?? this.selectedIndex,
      );
}
