import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import '../../../../database/database.dart';
import '../../../../database/todo_model.dart';
import 'event.dart';
import 'state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AppDatabase _database;
  final Logger logger = Logger("TodoBloc");

  TodoBloc(this._database) : super(TodoInitial()) {
    on<FetchTodoTasks>((event, emit) async {
      logger.info("Fetching todo tasks");
      emit(TodoLoading());
      try {
        List<Todo> todos = await _database.todoDao.getTodoTasks();
        if (todos.isEmpty) {
          logger.info("No todo tasks found, emitting TodoEmpty state");
          emit(TodoEmpty());
        } else {
          logger.info(
            "Todo tasks fetched successfully, emitting TodoLoaded state",
          );
          emit(TodoLoaded(todos));
        }
      } catch (e) {
        logger.severe("Error fetching todo tasks: ${e.toString()}");
        emit(TodoError(e.toString()));
      }
    });

    on<AddTodoTask>((event, emit) async {
      try {
        logger.info("Adding new todo task: ${event.todo.title}");
        int id = await _database.todoDao.insertTodoTask(event.todo);

        // Fetch the updated list of todos
        List<Todo> todos = await _database.todoDao.getTodoTasks();
        if (todos.isEmpty) {
          logger.info(
            "No todo tasks found after adding, emitting TodoEmpty state",
          );
          emit(TodoEmpty());
        } else {
          logger.info(
            "Todo task added successfully, emitting TodoLoaded state",
          );
          emit(TodoLoaded(todos));
        }
      } catch (e) {
        logger.severe("Error adding todo task: ${e.toString()}");
        emit(TodoError(e.toString()));
      }
    });

    on<UpdateTodoTask>((event, emit) async {
      try {
        logger.info("Updating todo task: ${event.todo.toString()}");
        await _database.todoDao.updateTodoTask(event.todo);
        logger.info("Todo task updated, fetching updated list of todos");
        List<Todo> todos = await _database.todoDao.getTodoTasks();
        emit(TodoLoaded(todos));
      } catch (e) {
        logger.severe("Error updating todo task: ${e.toString()}");
        emit(TodoError(e.toString()));
      }
    });

    on<CompleteTodoTask>((event, emit) async {
      try {
        logger.info("Completing todo task with ID: ${event.id}");
        _database.todoDao.updateTodoTaskStatus(event.id, true);
        // Fetch the updated list of todos
        List<Todo> todos = await _database.todoDao.getTodoTasks();
        logger.info("Todo task completed, fetching updated list of todos");
        emit(TodoLoaded(todos));
      } catch (e) {
        logger.severe("Error completing todo task: ${e.toString()}");
        emit(TodoError(e.toString()));
      }
    });

    on<UnCompleteTodoTask>((event, emit) async {
      try {
        logger.info("Completing todo task with ID: ${event.id}");
        _database.todoDao.updateTodoTaskStatus(event.id, false);
        // Fetch the updated list of todos
        List<Todo> todos = await _database.todoDao.getTodoTasks();
        logger.info("Todo task completed, fetching updated list of todos");
        emit(TodoLoaded(todos));
      } catch (e) {
        logger.severe("Error completing todo task: ${e.toString()}");
        emit(TodoError(e.toString()));
      }
    });

    on<DeleteTodoTask>((event, emit) async {
      try {
        logger.info("Deleting todo task: ${event.todo.title}");
        await _database.todoDao.deleteTodoTask(event.todo);
        // Fetch the updated list of todos
        await _database.todoDao.getTodoTasks().then((todos) {
          if (todos.isEmpty) {
            logger.info("No todo tasks left, emitting TodoEmpty state");
            emit(TodoEmpty());
          } else {
            logger.info("Todo task deleted, emitting TodoLoaded state");
            emit(TodoLoaded(todos));
          }
        });
      } catch (e) {
        logger.severe("Error deleting todo task: ${e.toString()}");
        emit(TodoError(e.toString()));
      }
    });
  }
}
