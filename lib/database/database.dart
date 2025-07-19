import 'dart:async';

import 'package:floor/floor.dart';
import 'package:todo/database/todo_dao.dart';
import 'package:todo/database/todo_model.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Todo])
abstract class AppDatabase extends FloorDatabase {
  TodoDao get todoDao;
}
