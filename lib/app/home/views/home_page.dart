import 'package:flutter/material.dart';

import '../../../utils/constants/dimens.dart';

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
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.padding.small,
                vertical: Dimens.padding.normal,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 24,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(width: Dimens.spacing.normal),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Task',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
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
                    icon: Icon(Icons.delete_outline),
                    color: Theme.of(context).colorScheme.error,
                    onPressed: () {
                      // Handle delete action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.check),
                    color: Colors.green,
                    onPressed: () {
                      // Handle delete action
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
