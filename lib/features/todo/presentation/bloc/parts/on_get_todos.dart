part of '../todo_bloc.dart';

extension OnGetTodos on TodoBloc {
  _onGetTodos(GetTodos event, Emitter<TodoStates> emit) async {
    emit(const Loading());
    try {
      final todos = await todoRepo.getTodos(event.date);
      emit(FetchedTodos(todos));
    } catch (e) {
      emit(Failure(e.toString()));
    }
  }
}
