import 'dart:async';

import 'package:meep_todo/hive/repository/todo_hive_local_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meep_todo/model/todo.dart';
import 'package:meep_todo/pages/todo_list/todo_list_page_view_model_state.dart';
import 'package:rxdart/utils.dart';

final todoListPageViewmodel = StateNotifierProvider.autoDispose<
    TodoListPageViewmodel,
    TodoListPageViewModelState>((ref) => TodoListPageViewmodel());

class TodoListPageViewmodel extends StateNotifier<TodoListPageViewModelState> {
  final _todoLocalStorage = TodoHiveLocalStorage();
  final _subscription = CompositeSubscription();

  TodoListPageViewmodel() : super(TodoListPageViewModelState.empty()) {
    initTodos();
    _listenPhotos();
  }

  void _listenPhotos() {
    _todoLocalStorage.watchList().listen((event) {
      update(list: event);
    }).addTo(_subscription);
  }

  Future<void> initTodos() async {
    List<Todo> list = _todoLocalStorage.queryAll();
    if (list.isNotEmpty) {
      update(list: list);
      return;
    }
  }

  Future<void> addTodos({required List<Todo> list}) async {
    await _todoLocalStorage.addAll(list: list);
  }

  void update({required List<Todo> list}) {
    state = state.copyWith(todos: list);
  }

  Future<void> addTodo(Todo newTodo) async {
    await _todoLocalStorage.add(value: newTodo);
  }

  Future<void> updateTodo({
    required Todo oldTodo,
    required Todo newTodo,
  }) async {
    await _todoLocalStorage.update(key: oldTodo.key, value: newTodo);
  }

  Future<void> delete({required Todo todo}) async {
    await _todoLocalStorage.delete(key: todo.key);
  }

  @override
  void dispose() {
    _subscription.dispose();
    super.dispose();
  }
}
