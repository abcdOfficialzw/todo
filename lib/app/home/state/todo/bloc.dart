import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../database/database.dart';
import '../../../../database/todo_model.dart';
import 'event.dart';
import 'state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AppDatabase _database;

  TodoBloc(this._database) : super(TodoInitial()) {
    on<FetchTodoTasks>((event, emit) async {
      emit(TodoLoading());
      try {
        List<Todo> todos = await _database.todoDao.getTodoTasks();
        if (todos.isEmpty) {
          emit(TodoEmpty());
        } else {
          emit(TodoLoaded(todos));
        }
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });

    on<AddTodoTask>((event, emit) async {
      try {
        int id = await _database.todoDao.insertTodoTask(event.todo);

        // Fetch the updated list of todos
        List<Todo> todos = await _database.todoDao.getTodoTasks();
        if (todos.isEmpty) {
          emit(TodoEmpty());
        } else {
          emit(TodoLoaded(todos));
        }
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });

    on<CompleteTodoTask>((event, emit) async {
      try {
        _database.todoDao.updateTodoTaskStatus(event.id, true);
        // Fetch the updated list of todos
        List<Todo> todos = await _database.todoDao.getTodoTasks();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });

    on<DeleteTodoTask>((event, emit) {
      try {
        _database.todoDao.deleteTodoTask(event.todo);
        // Fetch the updated list of todos
        _database.todoDao.getTodoTasks().then((todos) {
          if (todos.isEmpty) {
            emit(TodoEmpty());
          } else {
            emit(TodoLoaded(todos));
          }
        });
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });
  }
}
