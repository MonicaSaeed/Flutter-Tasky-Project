import 'package:flutter/material.dart';

import '../models/task_model.dart';
import '../theme/theme_controller.dart';
import 'custom_check_box.dart';

class TaskItemWidget extends StatelessWidget {
  TaskItemWidget({
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
          color:
              ThemeController.isDark() ? Colors.transparent : Color(0xFFD1DAD6),
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
        ],
      ),
    );
  }
}
