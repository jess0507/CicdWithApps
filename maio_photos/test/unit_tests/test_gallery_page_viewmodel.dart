import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:maio_photos/hive/config/box_name.dart';
import 'package:maio_photos/hive/repository/photo_hive_local_storage.dart';
import 'package:maio_photos/model/db/entity/photo.dart';
import 'package:maio_photos/model/request/api_request.dart';
import 'package:maio_photos/model/request/get_photos_request.dart';
import 'package:maio_photos/model/response/http_response.dart';
import 'package:maio_photos/pages/gallery/gallery_page_view_model.dart';

final photos = [Photo(id: 1), Photo(id: 2)];

class MockPhotoHiveLocalStorage implements PhotoHiveLocalStorage {
  @override
  List<Photo> queryAll() => photos;

  @override
  // TODO: implement box
  Box get box => throw UnimplementedError();

  @override
  // TODO: implement boxName
  BoxName get boxName => throw UnimplementedError();

  @override
  Future<void> delete({required int key}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  Future<Photo> query({required int key}) {
    // TODO: implement query
    throw UnimplementedError();
  }

  @override
  Future<void> update({required int key, required Photo value}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> updateAll({required Map<int, Photo> entries}) {
    // TODO: implement updateAll
    throw UnimplementedError();
  }

  @override
  Future<void> updateAllWithId({required List<Photo> list}) {
    // TODO: implement updateAllWithId
    throw UnimplementedError();
  }

  @override
  Stream<List<Photo>> watchList() {
    // TODO: implement watchList
    throw UnimplementedError();
  }
}

class MockGetPhotosRequest implements GetPhotosRequest {
  @override
  dynamic data;

  @override
  Map<String, dynamic>? headers;

  @override
  String method = '';

  @override
  Map<String, dynamic>? parameters;

  @override
  String path = '';

  @override
  List<Photo> deserialize(Response response) {
    // TODO: implement deserialize
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> request() {
    // TODO: implement request
    throw UnimplementedError();
  }

  @override
  // TODO: implement requestOptions
  RequestOptions get requestOptions => throw UnimplementedError();

  @override
  ApiRequest toApiRequest() {
    // TODO: implement toApiRequest
    throw UnimplementedError();
  }
}

void testGalleryPageViewmodel() {
  late MockPhotoHiveLocalStorage mockPhotoHiveLocalStorage;
  // late MockGetPhotosRequest mockGetPhotosRequest;

  setUp(() {
    mockPhotoHiveLocalStorage = MockPhotoHiveLocalStorage();
    // mockGetPhotosRequest = MockGetPhotosRequest();
    // Ensure queryAll() returns a non-null list
    // when(mockPhotoHiveLocalStorage.queryAll()).thenReturn([]);
  });

  test('initPhotos should update state with local photos', () async {
    final viewModel =
        GalleryPageViewmodel.test(photoStorage: mockPhotoHiveLocalStorage);
    viewModel.initPhotos();

    expect(viewModel.state.photos, equals(photos));
  });

  // test('fetchPhotos should update state with fetched photos', () async {
  //   final photos = [Photo(id: 1), Photo(id: 2)];
  //   when(mockGetPhotosRequest.request()).thenAnswer((_) async => HttpResponse(
  //       response: Response(requestOptions: RequestOptions()),
  //       deserializedData: photos));

  //   final viewModel = GalleryPageViewmodel.empty();
  //   await viewModel.fetchPhotos();

  //   expect(viewModel.state.photos, equals(photos));
  //   verify(mockPhotoHiveLocalStorage.updateAllWithId(list: photos)).called(1);
  // });

  // test(
  //     'GalleryPageViewmodel constructor should call initPhotos and fetchPhotos',
  //     () async {
  //   final photos = [Photo(id: 1), Photo(id: 2)];
  //   final fetchedPhotos = [Photo(id: 3), Photo(id: 4)];

  //   when(mockPhotoHiveLocalStorage.queryAll()).thenReturn(photos);
  //   when(mockGetPhotosRequest.request()).thenAnswer((_) async => HttpResponse(
  //       response: Response(requestOptions: RequestOptions()),
  //       deserializedData: photos));

  //   final viewModel = GalleryPageViewmodel();
  //   await Future.delayed(
  //       Duration.zero); // Wait for async operations to complete

  //   expect(viewModel.state.photos, equals(fetchedPhotos));
  // });
}
