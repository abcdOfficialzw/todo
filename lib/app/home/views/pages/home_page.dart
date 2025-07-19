import 'package:flutter/material.dart';

import '../../../../utils/constants/dimens.dart';
import '../widgets/todo_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimens.padding.normal),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return TodoItem(
              isCompleted: index % 2 == 0,
              title: 'Task ${index + 1}',
              time: 'Today, 9:30 AM',
              onDelete: () {
                // Handle delete action
              },
              onComplete: () {
                // Handle complete action
              },
              onEdit: () {
                // Handle edit action
              },
            );
          },
        ),
      ),
    );
  }
}
