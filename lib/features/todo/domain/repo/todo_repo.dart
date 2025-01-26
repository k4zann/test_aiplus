import 'package:test_aiplus/features/todo/data/models/todo_model.dart';

abstract class TodoRepo {
  Future<List<TodoModel>> getTodos(DateTime date);
  Future<void> addTodo(DateTime date, TodoModel todo);
  Future<void> updateTodo(DateTime date, TodoModel todo);
  Future<void> deleteTodo(DateTime date, TodoModel todo);
}