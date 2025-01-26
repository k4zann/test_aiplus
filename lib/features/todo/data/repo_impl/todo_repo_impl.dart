import 'package:flutter/material.dart';
import 'package:test_aiplus/core/services/injection/injection_container.dart';
import 'package:test_aiplus/features/todo/data/data_source/todo_storage.dart';
import 'package:test_aiplus/features/todo/data/models/todo_model.dart';
import 'package:test_aiplus/features/todo/domain/repo/todo_repo.dart';

class TodoRepoImpl implements TodoRepo {
  TodoRepoImpl();

  final todoStorage = sl<TodoStorage>();

  @override
  Future<void> addTodo(DateTime date, TodoModel todo) async {
    try {
      await todoStorage.addTodo(date, todo);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> deleteTodo(DateTime date, TodoModel todo) async {
    try {
      await todoStorage.deleteTodo(date, todo);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<TodoModel>> getTodos(DateTime date) async {
    try {
      final todos = await todoStorage.getTodos(date);

      return todos;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateTodo(DateTime date, TodoModel todo) async  {
    try {
      await todoStorage.updateTodo(date, todo);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
