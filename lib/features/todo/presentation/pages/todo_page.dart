import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_aiplus/core/constants/app_colors.dart';
import 'package:test_aiplus/core/widgets/default_app_bar.dart';
import 'package:test_aiplus/features/todo/presentation/view_models/todo_view_model.dart';
import 'package:test_aiplus/features/todo/presentation/widgets/add_button.dart';
import 'package:test_aiplus/features/todo/presentation/widgets/filter_bottom_sheet.dart';
import 'package:test_aiplus/features/todo/presentation/widgets/task_text_field.dart';
import 'package:test_aiplus/features/todo/presentation/widgets/todo_list.dart';

import '../bloc/todo_bloc.dart';
import '../widgets/dates_row.dart';

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

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(
          title: 'Todo List',
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (bottomSheetContext) {
                    return ChangeNotifierProvider(
                      create: (context) => context.read<TodoViewModel>(),
                      child: FilterBottomSheet(
                        selectedFilter: context.read<TodoViewModel>().filterStatus,
                        onFilterSelected: (status) {
                          context.read<TodoViewModel>().setFilterStatus(status);
                        },
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.filter_alt_outlined,
                size: 24,
                color: AppColors.lightBlack,
              ),
            ),
          ],
          needBackButton: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                const SizedBox(height: 16),
                ChangeNotifierProvider.value(
                  value: context.read<TodoViewModel>(),
                  child: const DatesRow(),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocConsumer<TodoBloc, TodoStates>(
                    bloc: context.read<TodoViewModel>().todoBloc,
                    listener: (context, state) {
                      if (state is FetchedTodos) {
                        context.read<TodoViewModel>().setTodos(state.todos);
                      }
                      if (state is AddedTodo || state is DeletedTodo || state is UpdatedTodo) {
                        context.read<TodoViewModel>().fetchTodos();
                      }
                    },
                    builder: (context, state) {
                      if (state is Loading) {
                        return const Center(child: CircularProgressIndicator.adaptive());
                      }
                      if (state is Failure) {
                        return Center(
                            child: IconButton(
                          onPressed: () {
                            context.read<TodoViewModel>().fetchTodos();
                          },
                          icon: const Icon(
                            Icons.refresh,
                            size: 24,
                            color: AppColors.lightBlack,
                          ),
                        ));
                      }
                      if (context.read<TodoViewModel>().filteredTodos.isEmpty) {
                        return const Center(child: Text('No tasks'));
                      }
                      return ChangeNotifierProvider.value(
                        value: context.read<TodoViewModel>(),
                        child: const TodoList(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child:
                          TaskTextField(controller: context.read<TodoViewModel>().taskController, hintText: 'Add Task'),
                    ),
                    const SizedBox(width: 12),
                    Flexible(
                        flex: 1,
                        child: AddButton(onPressed: () {
                          if (context.read<TodoViewModel>().taskController.text.isEmpty) {
                            return;
                          }
                          context.read<TodoViewModel>().addTask();
                        }))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
