import 'dart:async';

import 'package:playsee_story/model/entity/post_response.dart';
import 'package:playsee_story/model/request/get_post_request.dart';
import 'package:fimber/fimber.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'gallery_page_view_model_state.dart';

final galleryPageViewmodel = StateNotifierProvider.autoDispose<
    GalleryPageViewmodel,
    GalleryPageViewModelState>((ref) => GalleryPageViewmodel());

class GalleryPageViewmodel extends StateNotifier<GalleryPageViewModelState> {
  GalleryPageViewmodel.empty() : super(GalleryPageViewModelState.empty());

  GalleryPageViewmodel() : super(GalleryPageViewModelState.empty()) {
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    try {
      final res = await GetPostRequest().request();
      final PostResponse postResponse = res.deserializedData;
      state = state.copyWith(posts: postResponse.p);
    } catch (e) {
      Fimber.d('Error to fetch posts, e: $e');
    }
  }
}
