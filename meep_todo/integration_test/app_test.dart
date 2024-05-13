import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:integration_test/integration_test.dart';
import 'package:meep_todo/hive/config/config.dart';
import 'package:meep_todo/model/importance.dart';
import 'package:meep_todo/model/todo.dart';
import 'package:meep_todo/pages/add_todo_dialog/add_todo_view.dart';
import 'package:meep_todo/pages/todo_list/todo_list_page_view_model.dart';
import 'package:meep_todo/todo_app.dart';
import 'package:meep_todo/util/widget_key.dart';

const int testItemLength = 20;
const double scrollDelta = 500;

void main() {
  setUp(() async {
    await initialHive();
  });

  group('Testing App Driver Tests', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('Finding the last item in the list', (tester) async {
      // initial view
      final fackViewModel = await pumpAppWithViewModel(tester);

      // ACC
      final itemFinder =
          await findLastItem(tester: tester, viewmodel: fackViewModel);

      // ASSERT
      expect(itemFinder, findsOneWidget);
      final lastIndex = fackViewModel.state.todos.length - 1;
      final content =
          ((tester.widget<Dismissible>(itemFinder).child as ListTile).title
                  as Text)
              .data;
      final todo = fackViewModel.state.todos[lastIndex];
      expect(content, todo.content);
    });

    testWidgets('Testing IconButtons', (tester) async {
      // initial view
      final fackViewModel = await pumpAppWithViewModel(tester);

      // ACC
      final iconFinder = await findIndexedKeyItem(
        tester: tester,
        viewmodel: fackViewModel,
        prefixKey: WidgetKey.todoIsCompleteIconPrefix,
      );
      final lastStatus4IsCompleted =
          ((tester.widget<IconButton>(iconFinder).icon as Icon).icon
                  as IconData) ==
              Icons.check_box;
      await tester.tap(iconFinder);
      await tester.pumpAndSettle();

      // ASSERT
      final newStatus4IsCompleted =
          ((tester.widget<IconButton>(iconFinder).icon as Icon).icon
                  as IconData) ==
              Icons.check_box;
      expect(lastStatus4IsCompleted, !newStatus4IsCompleted);
    });

    testWidgets('Verifying whether item gets added to todo list',
        (tester) async {
      // initial view
      final fackViewModel = await pumpAppWithViewModel(tester);

      // show AddTodoView
      final addTodoFloatingButton =
          find.byKey(const ValueKey(WidgetKey.addTodoFloatingButton));
      expect(addTodoFloatingButton, findsOneWidget);

      await tester.tap(addTodoFloatingButton);
      await tester.pumpAndSettle();

      final addTodoView = find.byType(AddTodoView);
      expect(addTodoView, findsOneWidget);

      // ACC
      // create a new todo
      const newTodoContent = 'newTodoContent';
      const newTodoImportance = Importance.high;
      final contentTextFild = find.byKey(const Key(WidgetKey.contentTextField));
      await tester.enterText(contentTextFild, newTodoContent);
      await tester.pumpAndSettle();

      await tester.tap(find.text(newTodoImportance.name));
      await tester.pumpAndSettle();

      final addTodoButton = find.byKey(const Key(WidgetKey.addTodoButton));
      await tester.tap(addTodoButton);
      await tester.pumpAndSettle();

      final itemFinder =
          await findLastItem(tester: tester, viewmodel: fackViewModel);

      // ASSERT
      expect(itemFinder, findsOneWidget);
    });

    testWidgets('Testing remove button', (tester) async {
      // initial view
      final fackViewModel = await pumpAppWithViewModel(tester);

      // ACC
      final itemFinder =
          await findLastItem(tester: tester, viewmodel: fackViewModel);
      expect(itemFinder, findsOneWidget);
      await tester.drag(itemFinder, const Offset(500, 0));
      await tester.pumpAndSettle();

      // ASSERT
      expect(itemFinder, findsNothing);
    });
  });
}

Future<TodoListPageViewmodel> pumpAppWithViewModel(WidgetTester tester) async {
  final fackViewModel = TodoListPageViewmodel();
  await initTodos(viewmodel: fackViewModel);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        todoListPageViewmodel.overrideWith((ref) => fackViewModel),
      ],
      child: const TodoApp(),
    ),
  );
  return fackViewModel;
}

Future<void> initTodos({required TodoListPageViewmodel viewmodel}) async {
  final todoList = viewmodel.state.todos;
  if (todoList.isNotEmpty) {
    return;
  }
  final List<Todo> list = [];
  for (int i = 1; i <= (testItemLength - todoList.length); i++) {
    String content = 'add $i to test';
    Importance importance = Importance.values[i % Importance.values.length];
    bool isCompleted = i.isEven;

    list.add(Todo(
        content: content, importance: importance, isCompleted: isCompleted));
  }
  await viewmodel.addTodos(list: list);
}

Future<Finder> findIndexedKeyItem({
  required WidgetTester tester,
  required TodoListPageViewmodel viewmodel,
  required String prefixKey,
  int index = 0,
}) async {
  // definite the list item to find
  final todoList = viewmodel.state.todos;
  if (todoList.isEmpty) throw Exception('Error to find item by key.');
  final todo = viewmodel.state.todos[index];
  final todoKey = Key('$prefixKey${todo.key}');
  return find.byKey(todoKey);
}

Future<Finder> findLastItem({
  required WidgetTester tester,
  required TodoListPageViewmodel viewmodel,
}) async {
  // ACC
  final testIndex = viewmodel.state.todos.length - 1;
  final itemFinder = await findIndexedKeyItem(
    tester: tester,
    viewmodel: viewmodel,
    index: testIndex,
    prefixKey: WidgetKey.todoListItemPrefix,
  );
  await tester.scrollUntilVisible(itemFinder, scrollDelta);

  // ASSERT
  return itemFinder;
}
