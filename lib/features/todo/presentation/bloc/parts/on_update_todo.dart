part of '../todo_bloc.dart';

extension OnUpdateTodo on TodoBloc {
  _onUpdateTodo(UpdateTodo event, Emitter<TodoStates> emit) async {
    emit(const Loading());
    try {
      await todoRepo.updateTodo(event.date, event.todo);
      emit(const UpdatedTodo());
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }
}