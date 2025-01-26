import 'package:flutter/material.dart';
import 'package:test_aiplus/features/todo/data/models/todo_model.dart';
import 'package:test_aiplus/features/todo/presentation/bloc/todo_bloc.dart';

class TodoViewModel extends ChangeNotifier {
  // list of todos
  List<TodoModel> _todos = [];

  List<TodoModel> get todos => List<TodoModel>.from(_todos);

  List<TodoModel> get filteredTodos {
    if (_filterStatus == 0) {
      return _todos;
    } else if (_filterStatus == 1) {
      return _todos.where((element) => element.done ?? false).toList();
    } else {
      return _todos.where((element) => !(element.done ?? false)).toList();
    }
  }

  void setTodos(List<TodoModel> todos) {
    _todos = [];
    _todos.addAll(todos);
    notifyListeners();
  }

  // bloc
  final TodoBloc _todoBloc = TodoBloc();

  TodoBloc get todoBloc => _todoBloc;

  // datetime selection
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    fetchTodos();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  // controller for task
  final TextEditingController _taskController = TextEditingController();

  TextEditingController get taskController => _taskController;

  // events
  void fetchTodos() {
    _todoBloc.add(GetTodos(selectedDate));
  }

  void addTask() {
    final task = _taskController.text;
    if (task.isNotEmpty) {
      final TodoModel todo = TodoModel(
        id: todos.length,
        task: task,
        done: false,
      );
      _todoBloc.add(AddTodo(selectedDate, todo));
      _taskController.clear();
    }
  }

  void toggleTask(TodoModel todo) {
    final updatedTodo = todo.copyWith(done: !(todo.done ?? false));
    _todoBloc.add(UpdateTodo(selectedDate, updatedTodo));
  }

  void deleteTask(TodoModel todo) {
    _todoBloc.add(DeleteTodo(selectedDate, todo));
  }

  // dates
  final List<DateTime> _days =
      List.generate(7, (index) => (DateTime.now().subtract(const Duration(days: 1))).add(Duration(days: index)));

  List<DateTime> get days => _days;

  // filter
  /// 0: all, 1: done, 2: undone
  int _filterStatus = 1;

  int get filterStatus => _filterStatus;

  void setFilterStatus(int status) {
    _filterStatus = status;
    notifyListeners();
  }

  @override
  void dispose() {
    _todoBloc.close();
    _taskController.dispose();
    super.dispose();
  }
}
