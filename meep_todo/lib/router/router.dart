import 'package:go_router/go_router.dart';
import 'package:meep_todo/pages/todo_list/todo_list_page.dart';

extension RouterNameExtension on String {
  String get routerFullName => '/$this';
}

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
