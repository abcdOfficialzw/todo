import 'package:flutter/material.dart';

import '../../../../utils/constants/dimens.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.isCompleted,
    required this.title,
    required this.time,
    required this.onDelete,
    required this.onComplete,
    required this.onEdit,
  });

  final bool isCompleted;
  final String title;
  final String time;
  final Function() onDelete;
  final Function() onComplete;
  final Function() onEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.padding.small,
        vertical: Dimens.padding.normal,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            isCompleted
                ? Icons.check_circle_outline
                : Icons.radio_button_unchecked,
            size: 24,
            color: isCompleted
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          ),
          SizedBox(width: Dimens.spacing.normal),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Task', style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: Dimens.spacing.small),
                Text(
                  'Today, 9:30AM',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Spacer(),

          IconButton(
            icon: Icon(Icons.check),
            color: Colors.green,
            onPressed: onComplete,
          ),
        ],
      ),
    );
  }
}
