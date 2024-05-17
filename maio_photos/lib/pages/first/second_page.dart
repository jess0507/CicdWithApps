import 'package:go_router/go_router.dart';
import 'package:maio_photos/pages/first/navigation_button.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  static const routeName = 'secondPage';

  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondPage'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          NavigationButton(
            title: 'pop',
            onTap: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
