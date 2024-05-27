import 'dart:async';

import 'package:maio_photos/hive/repository/photo_hive_local_storage.dart';
import 'package:maio_photos/model/db/entity/photo.dart';
import 'package:maio_photos/model/request/get_photos_request.dart';
import 'package:fimber/fimber.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'gallery_page_view_model_state.dart';

final galleryPageViewmodel = StateNotifierProvider.autoDispose<
    GalleryPageViewmodel,
    GalleryPageViewModelState>((ref) => GalleryPageViewmodel());

class GalleryPageViewmodel extends StateNotifier<GalleryPageViewModelState> {
  final PhotoHiveLocalStorage _photoStorage;

  GalleryPageViewmodel.test({
    PhotoHiveLocalStorage? photoStorage,
  })  : _photoStorage = photoStorage ?? PhotoHiveLocalStorage(),
        super(GalleryPageViewModelState.empty());

  GalleryPageViewmodel()
      : _photoStorage = PhotoHiveLocalStorage(),
        super(GalleryPageViewModelState.empty()) {
    initPhotos();
    fetchPhotos();
  }

  void initPhotos() {
    final list = _photoStorage.queryAll();
    update(list: list);
  }

  Future<void> fetchPhotos() async {
    try {
      final res = await GetPhotosRequest().request();
      final List<Photo> list = res.deserializedData;
      Fimber.d('fetchPhotos: ${list.length}');
      update(list: list);
      _photoStorage.updateAllWithId(list: list);
    } catch (e) {
      Fimber.d('Error to fetchPhotos, e: $e');
    }
  }

  void update({required List<Photo> list}) {
    state = state.copyWith(photos: list);
  }
}
