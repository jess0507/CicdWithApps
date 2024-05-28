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
  final GetPhotosRequest _getPhotosRequest;
  final PhotoHiveLocalStorage _photoStorage;

  GalleryPageViewmodel()
      : _getPhotosRequest = GetPhotosRequest(),
        _photoStorage = PhotoHiveLocalStorage(),
        super(GalleryPageViewModelState.empty()) {
    init();
  }

  GalleryPageViewmodel.test({
    GetPhotosRequest? getPhotosRequest,
    PhotoHiveLocalStorage? photoStorage,
  })  : _getPhotosRequest = getPhotosRequest ?? GetPhotosRequest(),
        _photoStorage = photoStorage ?? PhotoHiveLocalStorage(),
        super(GalleryPageViewModelState.empty());

  Future<void> init() async {
    initPhotosFromStorage();
    await fetchPhotos();
  }

  void initPhotosFromStorage() {
    final list = _photoStorage.queryAll();
    update(list: list);
  }

  Future<void> fetchPhotos() async {
    try {
      final res = await _getPhotosRequest.request();
      final List<Photo> list = res.deserializedData;
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
