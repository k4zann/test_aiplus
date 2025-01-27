import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_aiplus/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:test_aiplus/features/todo/presentation/pages/todo_page.dart';
import 'package:test_aiplus/features/todo/presentation/view_models/todo_view_model.dart';

class TodoPageWrapper extends StatelessWidget {
  const TodoPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => TodoBloc()),
        ChangeNotifierProvider(create: (_) => TodoViewModel()..fetchTodos()),
      ],
      child: const TodoPage(),
    );
  }
}