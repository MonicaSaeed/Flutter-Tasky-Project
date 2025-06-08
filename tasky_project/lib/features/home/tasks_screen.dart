import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tasky_project/features/home/wedgits/analysis_achived_tasks.dart';

import '../../core/components/task_list_widget.dart';
import '../../core/constants/storage_key.dart';
import '../../core/services/preferences_manager.dart';
import '../add_tasks/add_task_screen.dart';
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
            SizedBox(height: 70),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 42,
                  height: 42,
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    Text(
                      'Good Evening ,${PreferencesManager().getString(StorageKey.username)}',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text('One task at a time.One step closer.',
                        style: Theme.of(context).textTheme.displaySmall),
                  ],
                ),
                SizedBox(width: 32),
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/Icon.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Yuhuu ,Your work Is',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 4),
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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.add, size: 18),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddTaskScreen(),
                      ),
                    );
                  },
                  label: Text('Add Task'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(160, 40),
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
