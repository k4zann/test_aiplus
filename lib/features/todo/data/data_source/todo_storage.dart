import 'dart:convert';

import 'package:test_aiplus/core/extensions/datetime_extension.dart';
import 'package:test_aiplus/core/services/injection/injection_container.dart';
import 'package:test_aiplus/core/services/local_storage/constant_values.dart';
import 'package:test_aiplus/core/services/local_storage/shared_prefs.dart';
import 'package:test_aiplus/features/todo/data/models/todo_model.dart';

class TodoStorage {
  final sharedPreferences = sl<SharedPreferencesService>();

  Future<List<TodoModel>> getTodos(DateTime date) async {
    final data =
        sharedPreferences.getData('${SharedPreferencesKeys.todos}/${date.getFormattedStorageDate()}').toString();
    final decodedData = jsonDecode(data ?? '[]');
    return todosFromList((decodedData ?? []) as List<dynamic>);
  }

  Future<void> saveTodos(DateTime date, List<TodoModel> todos) async {
    final jsonData = jsonEncode(todos.map((e) => e.toJson()).toList());
    await sharedPreferences.saveData(
      '${SharedPreferencesKeys.todos}/${date.getFormattedStorageDate()}',
      jsonData,
    );
  }

  Future<void> addTodo(DateTime date, TodoModel todo) async {
    final todos = await getTodos(date);
    if (todos.isNotEmpty) {
      todos.add(todo);
      return saveTodos(date, todos);
    } else {
      return saveTodos(date, [todo]);
    }
  }

  Future<void> deleteTodo(
    DateTime date,
    TodoModel todo,
  ) async {
    var todos = await getTodos(date);
    if (todos.isNotEmpty) {
      todos.removeWhere((element) => element.id == todo.id);
      return saveTodos(date, todos);
    }
  }

  Future<void> updateTodo(
    DateTime date,
    TodoModel todo,
  ) async {
    var todos = await getTodos(date);
    if (todos.isNotEmpty) {
      final index = todos.indexWhere((element) => element.id == todo.id);
      if (index != -1) {
        todos[index] = todo;
        return saveTodos(date, todos);
      }
    }
  }
}
