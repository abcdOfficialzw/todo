import 'package:floor/floor.dart';

@entity
class Todo {
  @primaryKey
  final int id;
  final String title;
  final bool isDone;
  final String
  createdAt; // Using String because DateTime is not supported. createdAt will be stored as ISO 8601 string.

  Todo(this.id, this.title, this.isDone, this.createdAt);
}
