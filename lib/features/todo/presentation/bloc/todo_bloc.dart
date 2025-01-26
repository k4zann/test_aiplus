import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_aiplus/core/services/injection/injection_container.dart';
import 'package:test_aiplus/features/todo/data/models/todo_model.dart';
import 'package:test_aiplus/features/todo/domain/repo/todo_repo.dart';

part 'todo_states.dart';
part 'todo_events.dart';
part 'todo_bloc.freezed.dart';

part 'parts/on_get_todos.dart';
part 'parts/on_add_todo.dart';
part 'parts/on_update_todo.dart';
part 'parts/on_delete_todo.dart';

class TodoBloc extends Bloc<TodoEvents, TodoStates> {
  final todoRepo = sl<TodoRepo>();

  TodoBloc() : super(const Initial()) {
    on<GetTodos>(_onGetTodos);

    on<AddTodo>(_onAddTodo);

    on<UpdateTodo>(_onUpdateTodo);

    on<DeleteTodo>(_onDeleteTodo);
  }
}