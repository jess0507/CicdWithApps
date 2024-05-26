import 'package:flutter_test/flutter_test.dart';

import 'model/add_todo_vm_state_test_model.dart';
import 'model/todo_list_page_vm_state_test_model.dart';
import 'model/todo_test_model.dart';

void main() {
  group('Todo Model Tests', () {
    TodoTestModel().runTests();
  });
  group('TodoListPageViewModelState Tests', () {
    TodoListPageVMStateTestModel().runTests();
  });
  group('AddTodoViewModelState Tests', () {
    AddTodoVMStateTestModel().runTests();
  });
}
