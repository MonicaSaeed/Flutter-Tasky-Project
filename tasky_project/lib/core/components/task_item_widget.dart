import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../features/tasks/task_model.dart';
import '../../features/tasks/tasks_controller.dart';
import '../enums/task_item_actions_enum.dart';
import '../theme/theme_controller.dart';
import 'custom_check_box.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.model,
    required this.onChanged,
  });

  final TaskModel model;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ThemeController.isDark()
              ? Colors.transparent
              : const Color(0xFFD1DAD6),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          CustomCheckBox(
            value: model.isCompleted,
            onChanged: (bool? value) => onChanged(value),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: model.isCompleted
                      ? Theme.of(context).textTheme.headlineMedium!.copyWith(
                            decoration: TextDecoration.lineThrough,
                          )
                      : Theme.of(context).textTheme.headlineMedium,
                  maxLines: 1,
                ),
                if (model.description.isNotEmpty)
                  Text(
                    model.description,
                    style: Theme.of(context).textTheme.displaySmall,
                    maxLines: 1,
                  ),
              ],
            ),
          ),
          const Spacer(),
          PopupMenuButton<TaskItemActionsEnum>(
            icon: SvgPicture.asset(
              'assets/images/dots-vertical.svg',
              width: 24,
              height: 24,
            ),
            onSelected: (value) async {
              switch (value) {
                case TaskItemActionsEnum.delete:
                  await _showAlertDialog(context);
                case TaskItemActionsEnum.edit:
              }
            },
            itemBuilder: (context) => TaskItemActionsEnum.values.map((e) {
              return PopupMenuItem<TaskItemActionsEnum>(
                value: e,
                child: Text(e.name),
              );
            }).toList(),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Future<String?> _showAlertDialog(context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Task"),
          content: const Text('Are you sure you want to delete this task '),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            Consumer<TasksController>(
              builder: (context, tasksController, child) {
                return TextButton(
                  onPressed: () {
                    tasksController.deleteTask(model.id);
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.error,
                  ),
                  child: const Text('Delete'),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
