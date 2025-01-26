part of 'todo_bloc.dart';

@freezed
class TodoEvents with _$TodoEvents {
  const factory TodoEvents.getTodos(DateTime date) = GetTodos;
  const factory TodoEvents.addTodo(DateTime date, TodoModel todo) = AddTodo;
  const factory TodoEvents.updateTodo(DateTime date, TodoModel todo) = UpdateTodo;
  const factory TodoEvents.deleteTodo(DateTime date, TodoModel todo) = DeleteTodo;
}