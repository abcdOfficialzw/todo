import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/app/home/state/todo/bloc.dart';
import 'package:todo/app/home/state/todo/event.dart';
import 'package:todo/app/home/state/todo/state.dart';
import 'package:todo/app/home/views/widgets/add_todo_widget.dart';

import '../../../../database/todo_model.dart';
import '../../../../utils/constants/dimens.dart';
import '../widgets/todo_empty_widget.dart';
import '../widgets/todo_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Todo',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            centerTitle: false,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                enableDrag: true,
                isDismissible: true,
                isScrollControlled: false,
                builder: (BuildContext context) {
                  return AddTodoWidget(
                    onAddTodo: (Todo todo) {
                      context.read<TodoBloc>().add(AddTodoTask(todo));
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
            child: Icon(Icons.add),
          ),
          body: Padding(
            padding: EdgeInsets.all(Dimens.padding.normal),
            child: state is TodoLoaded
                ? RefreshIndicator(
                    onRefresh: () async {
                      context.read<TodoBloc>()..add(FetchTodoTasks());
                    },
                    child: ListView.builder(
                      itemCount: state.todos.length,
                      itemBuilder: (context, index) {
                        return TodoItem(
                          todo: state.todos[index],
                          onDelete: (Todo todo) {
                            context.read<TodoBloc>().add(DeleteTodoTask(todo));
                          },
                          onComplete: (String id) {
                            context.read<TodoBloc>().add(CompleteTodoTask(id));
                          },
                          onUnComplete: (String id) {
                            context.read<TodoBloc>().add(
                              UnCompleteTodoTask(id),
                            );
                          },
                          onEdit: (Todo todo) {
                            print("Rceived Todo for Edit: ${todo.toString()}");
                            context.read<TodoBloc>()..add(UpdateTodoTask(todo));
                          },
                        );
                      },
                    ),
                  )
                : state is TodoLoading
                ? Center(child: CircularProgressIndicator())
                : state is TodoError
                ? Center(
                    child: Text(
                      'Error: ${state.message}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                : state is TodoEmpty
                ? Center(child: TodoEmptyWidget())
                : Center(
                    child: Text(
                      '${state}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
