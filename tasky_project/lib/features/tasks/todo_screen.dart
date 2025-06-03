import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_project/features/tasks/tasks_controller.dart';

import '../../core/components/task_list_widget.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'To Do Tasks',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Consumer<TasksController>(
                  builder: (context, tasksController, child) {
                    return tasksController.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              value: 20,
                            ),
                          )
                        : TaskListWidget(
                            tasks: tasksController.todoTasks,
                            onTap: (value, id) {
                              tasksController.changeTaskStatus(
                                  id!, value ?? false);
                            },
                            emptyMessage: 'No Task Found',
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
