import 'package:meep_todo/hive/config/box_name.dart';
import 'package:meep_todo/hive/repository/hive_local_storage.dart';
import 'package:meep_todo/model/todo.dart';

class TodoHiveLocalStorage extends HiveLocalStorage<Todo> {
  TodoHiveLocalStorage({super.boxName = BoxName.todo});
}
