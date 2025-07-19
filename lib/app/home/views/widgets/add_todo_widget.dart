import 'package:flutter/material.dart';
import 'package:todo/app/home/views/widgets/send_todo_button.dart';
import 'package:uuid/uuid.dart';

import '../../../../database/todo_model.dart';
import '../../../../utils/constants/dimens.dart';

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({
    super.key,
    this.todo,
    this.onAddTodo,
    this.onUpdateTodo,
  });

  final Todo? todo;
  final Function(Todo todo)? onAddTodo;
  final Function(Todo todo)? onUpdateTodo;

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _taskTitleController = TextEditingController();
  String updatedTitle = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.todo != null) {
      _taskTitleController.text = widget.todo!.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.padding.large),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: Theme.of(context).textTheme.titleLarge,
              controller: _taskTitleController,
              onChanged: (value) {
                updatedTitle = value;
              },
              decoration: InputDecoration.collapsed(
                hintText: "e.g.. Take the trash out",
                hintStyle: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Colors.grey),
              ),
            ),

            SizedBox(height: Dimens.spacing.medium),

            Divider(color: Theme.of(context).colorScheme.primaryContainer),
            SizedBox(height: Dimens.spacing.medium),
            SendNewTaskButton(
              onSendTask: () {
                if (_formKey.currentState!.validate()) {
                  if (widget.todo != null) {
                    print("Updating Todo: ${updatedTitle}");

                    Todo todo = Todo(
                      widget.todo!.id,
                      updatedTitle,
                      widget.todo!.isDone,
                      widget.todo!.createdAt,
                    );
                    widget.onUpdateTodo!(todo);
                  } else {
                    Uuid uuid = const Uuid();
                    Todo todo = Todo(
                      uuid.v4(),
                      _taskTitleController.text,
                      false,
                      DateTime.now().toIso8601String(),
                    );

                    widget.onAddTodo!(todo);
                  }

                  _taskTitleController.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
