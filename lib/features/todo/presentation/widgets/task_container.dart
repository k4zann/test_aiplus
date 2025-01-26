import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_aiplus/core/constants/app_colors.dart';
import 'package:test_aiplus/features/todo/data/models/todo_model.dart';
import 'package:test_aiplus/features/todo/presentation/view_models/todo_view_model.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({super.key, required this.todoModel});

  final TodoModel todoModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TodoViewModel>().toggleTask(todoModel);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        decoration: BoxDecoration(
          color: todoModel.done ?? false ? Colors.transparent : AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: todoModel.done ?? false ? AppColors.grey : Colors.transparent
          )
        ),
        width: double.infinity,
        child: Row(
          children: [
            Checkbox(
              value: todoModel.done,
              onChanged: (value) {
                context.read<TodoViewModel>().toggleTask(todoModel);
              },
              fillColor: WidgetStatePropertyAll(todoModel.done?? false ? AppColors.lightBeige : Colors.transparent),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Text(
                todoModel.task ?? 'no task',
                style: TextStyle(
                  color: todoModel.done ?? false ? AppColors.lightBlack : AppColors.black,
                  decoration: todoModel.done ?? false ? TextDecoration.lineThrough : TextDecoration.none,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
