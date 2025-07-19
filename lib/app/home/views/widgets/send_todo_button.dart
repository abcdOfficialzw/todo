import 'package:flutter/material.dart';

import '../../../../utils/constants/dimens.dart';

class SendNewTaskButton extends StatelessWidget {
  final Function()? onSendTask;

  const SendNewTaskButton({super.key, this.onSendTask});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onSendTask,
          child: Container(
            padding: EdgeInsets.all(Dimens.padding.small),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(Dimens.borderRadius.large),
            ),
            child: Icon(
              Icons.arrow_upward,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
