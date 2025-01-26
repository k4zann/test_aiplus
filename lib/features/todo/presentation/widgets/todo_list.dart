import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_aiplus/features/todo/presentation/view_models/todo_view_model.dart';
import 'package:test_aiplus/features/todo/presentation/widgets/task_container.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoViewModel>(builder: (context, state, _) {
      return ListView.builder(
        itemCount: state.filteredTodos.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(bottom: 8), child: TaskContainer(todoModel: state.filteredTodos[index]));
        },
      );
    });
  }
}
