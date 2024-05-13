import 'package:go_router/go_router.dart';
import 'package:meep_todo/pages/todo_list/todo_list_page.dart';

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: TodoListPage.routeName,
        builder: (context, state) => const TodoListPage(),
      ),
    ],
  );
}
