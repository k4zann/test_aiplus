part of '../todo_bloc.dart';

extension OnAddTodo on TodoBloc {
  _onAddTodo(AddTodo event, Emitter<TodoStates> emit) async {
    emit(const Loading());
    try {
      await todoRepo.addTodo(event.date, event.todo);
      emit(const AddedTodo());
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }
}