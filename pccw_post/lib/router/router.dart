import 'package:bot_toast/bot_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:pccw_post/pages/second/second_page.dart';

import '../pages/first/first_page.dart';

extension RouterNameExtension on String {
  String get routerFullName => '/$this';
}

GoRouter router() {
  return GoRouter(
    observers: [
      BotToastNavigatorObserver(),
    ],
    routes: [
      GoRoute(
        path: FirstPage.routeName,
        builder: (context, state) => const FirstPage(),
        routes: [
          GoRoute(
            path: SecondPage.routeName,
            builder: (context, state) => const SecondPage(),
          ),
        ],
      ),
    ],
  );
}
