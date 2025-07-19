import 'package:floor/floor.dart';
import 'package:todo/database/todo_model.dart';

@dao
abstract class TodoDao {
  @Query('SELECT * FROM Todo')
  Future<List<Todo>> getTodoTasks();

  @insert
  Future<int> insertTodoTask(Todo todo);

  @delete
  Future<void> deleteTodoTask(Todo todo);

  @update
  Future<void> updateTodoTask(Todo todo);

  @Query('UPDATE Todo SET isDone = :isDone WHERE id = :id')
  Future<void> updateTodoTaskStatus(int id, bool isDone);
}
