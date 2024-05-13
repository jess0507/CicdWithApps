import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/importance.dart';
import 'add_todo_view_model_state.dart';

final addTodoViewmodel =
    StateNotifierProvider.autoDispose<AddTodoViewModel, AddTodoViewModelState>(
        (ref) => AddTodoViewModel());

class AddTodoViewModel extends StateNotifier<AddTodoViewModelState> {
  AddTodoViewModel() : super(AddTodoViewModelState.empty());

  void updateTodo({
    String? content,
    Importance? importance,
  }) {
    final todo = state.todo.copyWith(content: content, importance: importance);
    state = state.copyWith(todo: todo);
  }
}
