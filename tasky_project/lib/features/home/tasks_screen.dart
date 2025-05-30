import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky_project/core/components/custom_task_details.dart';
import 'package:tasky_project/core/models/task_model.dart';

import '../../core/constants/storage_key.dart';
import '../../core/services/preferences_manager.dart';
import '../add_tasks/add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<TaskModel> tasks = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? tasksLocal = prefs.getString('tasks');
    // print('tasks: $tasks');
    final List<dynamic> taskList =
        tasksLocal != null ? jsonDecode(tasksLocal) : [];
    // print('taskList: $taskList');
    tasks = taskList
        .map((task) => TaskModel.fromMap(task as Map<String, dynamic>))
        .toList();
    print('taskssssss maaaaapppppp from tasks page : $tasks');
    setState(() {});
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
                SizedBox(width: 8),
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
                SizedBox(width: 8),
                SvgPicture.asset(
                  'assets/images/waving-hand.svg',
                  width: 32,
                  height: 32,
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'My Tasks',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CustomTaskDetails(task: task)),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.add, size: 18),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddTaskScreen(),
                      ),
                    );
                    getData(); // Refresh the task list after adding a new task
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
