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
import '../widgets/todo_status_filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedStatus = 'All';

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
            child: Column(
              children: [
                TodoStatusFilter(
                  selectedStatus: selectedStatus,
                  onStatusSelected: (value) {
                    setState(() {
                      selectedStatus = value;
                      context.read<TodoBloc>().add(
                        FetchTodoTasks(
                          selectedStatus == 'Completed'
                              ? 1
                              : selectedStatus == "Pending"
                              ? 0
                              : null,
                        ),
                      );
                    });
                  },
                ),
                SizedBox(height: Dimens.spacing.normal),

                Expanded(
                  child: Container(
                    child: state is TodoLoaded
                        ? RefreshIndicator(
                            onRefresh: () async {
                              context.read<TodoBloc>().add(
                                FetchTodoTasks(
                                  selectedStatus == 'Completed'
                                      ? 1
                                      : selectedStatus == "Pending"
                                      ? 0
                                      : null,
                                ),
                              );
                            },
                            child: ListView.builder(
                              itemCount: state.todos.length,
                              itemBuilder: (context, index) {
                                return TodoItem(
                                  todo: state.todos[index],
                                  onDelete: (Todo todo) {
                                    context.read<TodoBloc>().add(
                                      DeleteTodoTask(todo),
                                    );
                                  },
                                  onComplete: (String id) {
                                    context.read<TodoBloc>().add(
                                      CompleteTodoTask(id),
                                    );
                                  },
                                  onUnComplete: (String id) {
                                    context.read<TodoBloc>().add(
                                      UnCompleteTodoTask(id),
                                    );
                                  },
                                  onEdit: (Todo todo) {
                                    context.read<TodoBloc>().add(
                                      UpdateTodoTask(todo),
                                    );
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
                        : SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
