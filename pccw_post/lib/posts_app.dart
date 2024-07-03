import 'package:bot_toast/bot_toast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pccw_post/router/router.dart';

class PostApp extends StatelessWidget {
  const PostApp({super.key});

  @override
  Widget build(BuildContext context) {
    final builder = BotToastInit();

    return ProviderScope(
      child: MaterialApp.router(
        builder: (context, child) {
          child = builder(context, child);
          return child;
        },
        routerConfig: router(),
      ),
    );
  }
}
