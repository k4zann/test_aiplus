part of 'todo_bloc.dart';

@freezed
class TodoStates with _$TodoStates {
  const factory TodoStates.initial() = Initial;
  
  const factory TodoStates.loading() = Loading;
  const factory TodoStates.failure(String err) = Failure;

  const factory TodoStates.fetchedTodos(List<TodoModel> todos) = FetchedTodos;

  const factory TodoStates.addedTodo() = AddedTodo;

  const factory TodoStates.updatedTodo() = UpdatedTodo;

  const factory TodoStates.deletedTodo() = DeletedTodo;
}