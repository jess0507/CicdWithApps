import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maio_photos/hive/repository/photo_hive_local_storage.dart';
import 'package:maio_photos/model/db/entity/photo.dart';
import 'package:maio_photos/model/request/get_photos_request.dart';
import 'package:maio_photos/model/response/http_response.dart';
import 'package:maio_photos/pages/gallery/gallery_page_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../config/hive_config.dart';
import '../json/photos.dart';
import 'test_gallery_page_viewmodel.mocks.dart';

@GenerateMocks([
  PhotoHiveLocalStorage,
  GetPhotosRequest,
])
void testGalleryPageViewmodel() {
  late MockPhotoHiveLocalStorage mockPhotoHiveLocalStorage;
  late MockGetPhotosRequest mockGetPhotosRequest;
  late Response mockResponse;
  late HttpResponse mockHttpResponse;
  late List<Photo> photos;

  setUp(() async {
    await HiveConfig().initHive();

    if (kDebugMode) {
      print('Setup mockPhotoHiveLocalStorage, mockGetPhotosRequest');
    }
    mockPhotoHiveLocalStorage = MockPhotoHiveLocalStorage();
    mockGetPhotosRequest = MockGetPhotosRequest();
    when(mockPhotoHiveLocalStorage.queryAll()).thenReturn([]);

    photos = List<Photo>.from(photosMap.map((item) => Photo.fromJson(item)));

    mockResponse = Response(requestOptions: RequestOptions(data: photosMap));
    mockHttpResponse = HttpResponse(
      response: mockResponse,
      deserializedData: photos,
    );
  });

  test('Init photos should update state with local photos', () async {
    final viewModel =
        GalleryPageViewmodel.test(photoStorage: mockPhotoHiveLocalStorage);
    viewModel.initPhotosFromStorage();
    expect(viewModel.state.photos, equals([]));
    verify(mockPhotoHiveLocalStorage.queryAll()).called(1);
  });

  test('Fetch photos should update state with fetched photos', () async {
    when(mockGetPhotosRequest.request()).thenAnswer(
      (_) async => mockHttpResponse,
    );

    final viewModel = GalleryPageViewmodel.test(
      photoStorage: mockPhotoHiveLocalStorage,
      getPhotosRequest: mockGetPhotosRequest,
    );
    await viewModel.fetchPhotos();

    expect(viewModel.state.photos, photos);
    verify(mockPhotoHiveLocalStorage.updateAllWithId(
      list: photos,
    )).called(1);
  });

  test(
      'GalleryPageViewmodel constructor should call initPhotos and fetchPhotos',
      () async {
    when(mockPhotoHiveLocalStorage.queryAll()).thenReturn(photos);
    when(mockGetPhotosRequest.request())
        .thenAnswer((_) async => mockHttpResponse);

    final viewModel = GalleryPageViewmodel.test(
      photoStorage: mockPhotoHiveLocalStorage,
      getPhotosRequest: mockGetPhotosRequest,
    );
    await viewModel.init();
    expect(viewModel.state.photos, equals(photos));
  });
}
