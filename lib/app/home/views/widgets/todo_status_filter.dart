import 'package:flutter/material.dart';

import '../../../../utils/constants/dimens.dart';

class TodoStatusFilter extends StatefulWidget {
  const TodoStatusFilter({
    super.key,
    required this.selectedStatus,
    required this.onStatusSelected,
  });

  final String selectedStatus;
  final Function(String status) onStatusSelected;

  @override
  State<TodoStatusFilter> createState() => _TodoStatusFilterState();
}

class _TodoStatusFilterState extends State<TodoStatusFilter> {
  final List<String> statuses = ['All', 'Completed', 'Pending'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.onStatusSelected(statuses[index]);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.padding.normal,
                vertical: Dimens.padding.small / 4,
              ),
              decoration: BoxDecoration(
                color: widget.selectedStatus == statuses[index]
                    ? Theme.of(context).colorScheme.primaryContainer
                    : null,
                // Add primary color on the border
                border: Border.all(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),

                borderRadius: BorderRadius.circular(
                  Dimens.borderRadius.veryLarge,
                ),
              ),
              child: Center(
                child: Text(
                  statuses[index],
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          );
        },

        separatorBuilder: (context, index) {
          return SizedBox(width: Dimens.spacing.small);
        },
      ),
    );
  }
}
