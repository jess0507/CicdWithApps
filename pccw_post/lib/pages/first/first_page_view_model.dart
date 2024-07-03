import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:fimber/fimber.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pccw_post/util/extensions.dart';
import 'package:photo_manager/photo_manager.dart';

import 'first_page_view_model_state.dart';
import 'package:path/path.dart' as path;

final firstPageViewmodel = StateNotifierProvider.autoDispose<FirstPageViewmodel,
    FirstPageViewModelState>((ref) => FirstPageViewmodel());

class FirstPageViewmodel extends StateNotifier<FirstPageViewModelState> {
  FirstPageViewmodel() : super(FirstPageViewModelState.empty()) {
    init();
  }

  final picker = ImagePicker();
  final FirebaseStorage storage = FirebaseStorage.instance;
  List<AssetEntity> mediaList = [];

  void init() {
    loadImages();
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Fimber.d('file path: ${pickedFile.path}');
      update(path: pickedFile.path);
    } else {
      Fimber.d('No file selected.');
    }
  }

  Future<void> loadImages() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (!ps.hasAccess) {
      if (!mounted) {
        return;
      }
      BotToast.showText(text: 'Permission is not accessible.');
      return;
    }

    // Customize your own filter options.
    final PMFilter filter = FilterOptionGroup(
      imageOption: const FilterOption(
        sizeConstraint: SizeConstraint(ignoreSize: true),
      ),
    );
    // Obtain assets using the path entity.
    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
      onlyAll: true,
      filterOption: filter,
    );
    // Return if not paths found.
    var path = paths.firstOrNull;
    if (paths.isEmpty || path == null) {
      if (!mounted) {
        return;
      }
      BotToast.showText(text: 'No paths found.');
      return;
    }

    Fimber.d('_path: $path');
    final List<AssetEntity> mediaList = await path.getAssetListPaged(
      page: 0,
      size: 50,
    );
    Fimber.d('mediaList: $mediaList');

    update(mediaList: mediaList);
  }

  Future clear() async {
    update(
      selectedIndex: null,
      path: '',
      link: '',
    );
  }

  Future select({required int index}) async {
    final file = await state.mediaList[index].originFile;
    Fimber.d('selectImage: ${file?.path}');
    update(
      selectedIndex: index,
      path: file?.path,
      link: '',
    );
  }

  Future upload() async {
    final index = state.selectedIndex;
    final filePath = state.filePath;
    if (index == null || filePath.isNullOrEmpty()) {
      BotToast.showText(text: 'Please select a file.');
      return;
    }
    try {
      final file = await state.mediaList[index].originFile;
      Fimber.d('selectImage: ${file?.path}');

      if (file != null) {
        final fileName = path.basename(file.path); // 获取文件名
        final fileExtension = path.extension(file.path); // 获取文件扩展名
        final title = fileName.replaceAll(fileExtension, '');
        final ref = FirebaseStorage.instance
            .ref()
            .child('upload/')
            .child('${title}_${DateTime.now().toString()}$fileExtension');
        await ref.putFile(file);

        final downloadUrl = await ref.getDownloadURL();
        update(link: downloadUrl);
        Fimber.d('File uploaded. Download URL: $downloadUrl');

        if (!mounted) {
          return;
        }
        BotToast.showText(text: 'File uploaded. Download URL: $downloadUrl');
      }
    } catch (e) {
      Fimber.d('Error: $e');
      BotToast.showText(text: 'Error: $e');
    }
  }

  void update({
    String? path,
    String? link,
    int? selectedIndex,
    List<AssetEntity>? mediaList,
  }) {
    state = state.copyWith(
      filePath: path,
      link: link,
      selectedIndex: selectedIndex,
      mediaList: mediaList,
    );
  }
}
