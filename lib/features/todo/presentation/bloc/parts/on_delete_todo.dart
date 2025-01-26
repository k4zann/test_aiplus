part of '../todo_bloc.dart';

extension OnDeleteTodo on TodoBloc {
  _onDeleteTodo(DeleteTodo event, Emitter<TodoStates> emit) async {
    emit(const Loading());
    try {
      await todoRepo.deleteTodo(event.date, event.todo);
      emit(const DeletedTodo());
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }
}