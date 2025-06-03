import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_project/core/components/custom_form_field.dart';
import 'package:tasky_project/core/models/task_model.dart';
import 'package:tasky_project/features/tasks/tasks_controller.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool isHighPriority = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 4),
                    Text(
                      'New Task',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
                SizedBox(height: 18),
                CustomFormField(
                  title: 'Task Name',
                  hintText: 'Finish UI design for login screen',
                  maxLines: 1,
                  controller: taskNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                CustomFormField(
                  title: 'Task Description',
                  hintText:
                      'Finish onboarding UI and hand off to devs by Thursday.',
                  maxLines: 5,
                  controller: taskDescriptionController,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'High Priority  ',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Switch(
                        value: isHighPriority,
                        onChanged: (bool newValue) {
                          setState(() {
                            isHighPriority = newValue;
                          });
                        }),
                  ],
                ),
                SizedBox(height: 90),
                ElevatedButton.icon(
                  icon: Icon(Icons.add, size: 18),
                  onPressed: () async {
                    if (_key.currentState?.validate() ?? false) {
                      TaskModel newTask = TaskModel(
                        name: taskNameController.text,
                        description: taskDescriptionController.text,
                        isHighPriority: isHighPriority,
                      );

                      await Provider.of<TasksController>(context, listen: false)
                          .addTask(
                              newTask); // Assuming you have an addTask method
                      taskNameController.clear();
                      taskDescriptionController.clear();
                      // if pop before add task, don't pop gain using Navigator.pop(context)
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    }
                  },
                  label: const Text('Add Task'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
