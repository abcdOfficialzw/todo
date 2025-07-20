import 'package:equatable/equatable.dart';

import '../../../../database/todo_model.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class FetchTodoTasks extends TodoEvent {
  const FetchTodoTasks(this.status);

  final int? status;

  @override
  List<Object> get props => [status ?? -1];
}

class AddTodoTask extends TodoEvent {
  final Todo todo;

  const AddTodoTask(this.todo);

  @override
  List<Object> get props => [todo];
}

class UpdateTodoTask extends TodoEvent {
  final Todo todo;

  const UpdateTodoTask(this.todo);

  @override
  List<Object> get props => [todo];
}

class CompleteTodoTask extends TodoEvent {
  final String id;

  const CompleteTodoTask(this.id);

  @override
  List<Object> get props => [id];
}

class UnCompleteTodoTask extends TodoEvent {
  final String id;

  const UnCompleteTodoTask(this.id);

  @override
  List<Object> get props => [id];
}

class DeleteTodoTask extends TodoEvent {
  final Todo todo;

  const DeleteTodoTask(this.todo);

  @override
  List<Object> get props => [todo];
}
