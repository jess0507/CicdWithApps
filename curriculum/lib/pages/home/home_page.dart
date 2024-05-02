import 'package:curriculum/pages/teacher_list/teacher_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首頁'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeListButton(
            title: '導師列表',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TeacherListPage()),
              );
            },
          ),
          HomeListButton(
            title: '導師列表',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TeacherListPage()),
              );
            },
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: const Color.fromARGB(255, 219, 218, 218),
          )
        ],
      ),
    );
  }
}

class HomeListButton extends StatelessWidget {
  final String title;

  final VoidCallback onTap;

  const HomeListButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Text(title),
      ),
    );
  }
}
