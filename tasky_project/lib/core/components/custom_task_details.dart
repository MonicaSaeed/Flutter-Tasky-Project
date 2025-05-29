import 'package:flutter/material.dart';
import 'package:tasky_project/core/models/task_model.dart';

class CustomTaskDetails extends StatelessWidget {
  final TaskModel task;
  const CustomTaskDetails({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              task.name,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: 4),
            Text(
              task.description,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: const Color(0xFFC6C6C6D),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
