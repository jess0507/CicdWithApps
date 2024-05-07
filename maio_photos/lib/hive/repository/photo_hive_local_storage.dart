import 'package:maio_photos/hive/config/box_name.dart';
import 'package:maio_photos/hive/repository/hive_local_storage.dart';

import '../../model/db/entity/photo.dart';

class PhotoHiveLocalStorage extends HiveLocalStorage<Photo> {
  PhotoHiveLocalStorage({super.boxName = BoxName.photos});
}
