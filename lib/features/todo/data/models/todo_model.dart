import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

TodoModel todoFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoToJson(TodoModel data) => json.encode(data.toJson());

List<TodoModel> todosFromList(List<dynamic> data) {
  return data.map((json) => TodoModel.fromJson(json)).toList();
}

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    required int? id,
    required String? task,
    required bool? done,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);
}
