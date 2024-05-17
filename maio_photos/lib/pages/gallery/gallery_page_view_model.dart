import 'dart:async';

import 'package:maio_photos/hive/repository/photo_hive_local_storage.dart';
import 'package:maio_photos/model/db/entity/photo.dart';
import 'package:maio_photos/model/request/get_photos_request.dart';
import 'package:fimber/fimber.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/utils.dart';

import 'gallery_page_view_model_state.dart';

final galleryPageViewmodel = StateNotifierProvider.autoDispose<
    GalleryPageViewmodel,
    GalleryPageViewModelState>((ref) => GalleryPageViewmodel());

class GalleryPageViewmodel extends StateNotifier<GalleryPageViewModelState> {
  final CompositeSubscription _subscription = CompositeSubscription();

  GalleryPageViewmodel.empty() : super(GalleryPageViewModelState.empty());

  GalleryPageViewmodel() : super(GalleryPageViewModelState.empty()) {
    initPhotos();
    fetchPhotos();
  }

  void initPhotos() {
    final list = PhotoHiveLocalStorage().queryAll();
    update(list: list);
  }

  Future<void> fetchPhotos() async {
    try {
      final res = await GetPhotosRequest().request();
      final List<Photo> list = res.deserializedData;
      Fimber.d('fetchPhotos: ${list.length}');
      update(list: list);
      final Map<int, Photo> map = {
        for (var element in list)
          if (element.id != null) element.id!: element
      };
      PhotoHiveLocalStorage().updateAll(entries: map);
    } catch (e) {
      Fimber.d('Error to fetchPhotos, e: $e');
    }
  }

  void update({required List<Photo> list}) {
    state = state.copyWith(photos: list);
  }

  @override
  void dispose() {
    _subscription.dispose();
    super.dispose();
  }
}
