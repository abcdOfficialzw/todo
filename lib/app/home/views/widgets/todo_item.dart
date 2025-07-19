import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/app/home/views/widgets/add_todo_widget.dart';
import 'package:todo/app_manager.dart';

import '../../../../database/todo_model.dart';
import '../../../../utils/constants/dimens.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    super.key,

    required this.onDelete,
    required this.onComplete,
    required this.onEdit,
    required this.todo,
    required this.onUnComplete,
  });

  final Todo todo;
  final Function(Todo todo) onDelete;
  final Function(String id) onComplete;
  final Function(String id) onUnComplete;
  final Function(Todo todo) onEdit;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.padding.small,
        vertical: Dimens.padding.normal,
      ),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            enableDrag: true,
            isDismissible: true,
            builder: (BuildContext context) {
              return AddTodoWidget(
                todo: widget.todo,
                onUpdateTodo: (Todo todo) {
                  print(todo.toString());
                  widget.onEdit(todo);
                  Navigator.pop(context);
                },
              );
            },
          );
        },
        child: Slidable(
          endActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                flex: 1,
                onPressed: (_) {
                  widget.onDelete(widget.todo);
                },
                backgroundColor: Colors.red,

                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: widget.todo.isDone
                    ? () {
                        widget.onUnComplete(widget.todo.id);
                      }
                    : null,

                child: Icon(
                  widget.todo.isDone
                      ? Icons.check_circle_outline
                      : Icons.radio_button_unchecked,
                  size: 24,
                  color: widget.todo.isDone
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                ),
              ),
              SizedBox(width: Dimens.spacing.normal),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.todo.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: Dimens.spacing.small),
                    Text(
                      AppManager().formatDateString(widget.todo.createdAt),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Spacer(),

              if (!widget.todo.isDone) ...[
                IconButton(
                  icon: Icon(Icons.check),
                  color: Colors.green,
                  onPressed: () {
                    widget.onComplete(widget.todo.id);
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
