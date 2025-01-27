import 'package:flutter/material.dart';
import 'package:test_aiplus/features/todo/presentation/pages/todo_page.dart';


class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo App',
      home: TodoPageWrapper()
    );
  }
}
