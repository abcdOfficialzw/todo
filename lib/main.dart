import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/home/state/todo/bloc.dart';
import 'package:todo/app/home/state/todo/event.dart';
import 'package:todo/routes.dart';
import 'package:todo/utils/theme/color_schemes.dart';
import 'package:todo/utils/theme/type.dart';

import 'database/database.dart';

void main() {
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print(
        '${record.loggerName.toUpperCase()} ${record.level.name}: ${record.time.hour}:${record.time.minute} => ${record.message}',
      );
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) =>
          $FloorAppDatabase.databaseBuilder('app_database.db').build(),
      initialData: null,
      child: Consumer<AppDatabase?>(
        builder: (context, database, child) {
          if (database == null) {
            return MaterialApp(
              home: Scaffold(body: Center(child: CircularProgressIndicator())),
            );
          }
          return BlocProvider<TodoBloc>(
            create: (context) => TodoBloc(database)..add(FetchTodoTasks()),
            child: MaterialApp.router(
              title: 'Taskyy',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: lightColorScheme,
                textTheme: materialTextTheme(),
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: darkColorScheme,
                textTheme: materialTextTheme(),
              ),
              themeMode: ThemeMode.system,
              routerConfig: router,
            ),
          );
        },
      ),
    );
  }
}
