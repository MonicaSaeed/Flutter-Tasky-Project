import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tasky_project/features/home/wedgits/analysis_achived_tasks.dart';
import 'package:tasky_project/features/home/wedgits/high_priority_tasks.dart';

import '../../core/components/task_list_widget.dart';
import '../add_tasks/add_task_screen.dart';
import '../profile/user_controller.dart';
import '../tasks/tasks_controller.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            Row(
              children: [
                Selector<UserController, String?>(
                  selector: (context, UserController controller) =>
                      controller.userImagePath,
                  builder: (BuildContext context, String? userImagePath,
                      Widget? child) {
                    return CircleAvatar(
                      backgroundImage: userImagePath == null
                          ? const AssetImage('assets/images/default_user.jpg')
                          : FileImage(File(userImagePath)),
                    );
                  },
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    Consumer<UserController>(
                      builder: (context, userController, _) {
                        return Text(
                          'Good Evening, ${userController.username}',
                          style: Theme.of(context).textTheme.displayMedium,
                        );
                      },
                    ),
                    Text('One task at a time.One step closer.',
                        style: Theme.of(context).textTheme.displaySmall),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Yuhuu ,Your work Is',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'almost done ! ',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  'assets/images/waving-hand.svg',
                  width: 32,
                  height: 32,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const AnalysisAchievedTasks(),
            const SizedBox(height: 8),
            Consumer<TasksController>(
              builder: (context, tasksController, child) {
                return const HighPriorityTasksWidget();
              },
            ),
            const SizedBox(height: 16),
            Text(
              'My Tasks',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Consumer<TasksController>(
                  builder: (context, tasksController, child) {
                return tasksController.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        value: 20,
                      ))
                    : TaskListWidget(
                        tasks: tasksController.tasks,
                        onTap: (value, id) {
                          tasksController.changeTaskStatus(id!, value ?? false);
                        },
                        emptyMessage: 'No Task Found',
                      );
              }),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.add, size: 18),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddTaskScreen(),
                      ),
                    );
                  },
                  label: const Text('Add Task'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(160, 40),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
