import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../core/constants/storage_key.dart';
import '../../core/services/preferences_manager.dart';
import 'task_model.dart';

class TasksController with ChangeNotifier {
  List<TaskModel> tasks = [];
  List<TaskModel> completedTasks = [];
  List<TaskModel> todoTasks = [];
  bool isLoading = true;
  int totalDoneTasks = 0;
  int get totalTasks => tasks.length;

  double get percent {
    if (totalTasks == 0) return 0.0;
    return totalDoneTasks / totalTasks;
  }

  init() async {
    await loadTasks();
    loadCompletedTasks();
    loadTodoTasks();
    isLoading = false;
    notifyListeners();
  }

  Future<void> loadTasks() async {
    final finalTask = PreferencesManager().getString(StorageKey.tasks);
    if (finalTask != null) {
      final taskAfterDecode = jsonDecode(finalTask) as List<dynamic>;
      tasks =
          taskAfterDecode.map((element) => TaskModel.fromMap(element)).toList();
    }
  }

  void loadCompletedTasks() {
    completedTasks = tasks.where((task) => task.isCompleted).toList();
    totalDoneTasks = completedTasks.length;
  }

  void loadTodoTasks() {
    todoTasks = tasks.where((task) => !task.isCompleted).toList();
  }

  Future<void> addTask(TaskModel task) async {
    tasks.add(task.copyWith(
      id: tasks.length + 1,
    ));
    final taskMap = tasks.map((e) => e.toMap()).toList();
    await PreferencesManager().setString(StorageKey.tasks, jsonEncode(taskMap));
    loadCompletedTasks();
    loadTodoTasks();
    notifyListeners();
  }

  // change swatch isCompleted status
  void changeTaskStatus(int id, bool isCompleted) {
    final taskIndex = tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      tasks[taskIndex] = tasks[taskIndex].copyWith(isCompleted: isCompleted);
      PreferencesManager().setString(
        StorageKey.tasks,
        jsonEncode(tasks.map((e) => e.toMap()).toList()),
      );
      loadCompletedTasks();
      loadTodoTasks();
      notifyListeners();
    }
  }
}
