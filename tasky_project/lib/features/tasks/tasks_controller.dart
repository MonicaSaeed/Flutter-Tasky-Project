import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../core/constants/storage_key.dart';
import '../../core/models/task_model.dart';
import '../../core/services/preferences_manager.dart';

class TasksController with ChangeNotifier {
  List<TaskModel> tasks = [];
  List<TaskModel> completedTasks = [];
  List<TaskModel> todoTasks = [];
  bool isLoading = true;
  int totalDoneTasks = 0;

  init() {
    loadTask();
  }

  void loadTask() async {
    final finalTask = PreferencesManager().getString(StorageKey.tasks);
    if (finalTask != null) {
      final taskAfterDecode = jsonDecode(finalTask) as List<dynamic>;
      tasks =
          taskAfterDecode.map((element) => TaskModel.fromMap(element)).toList();
    }
    loadCompletedTasks();
    loadTodoTasks();
    isLoading = false;
    notifyListeners();
  }

  void loadCompletedTasks() {
    completedTasks = tasks.where((task) => task.isCompleted).toList();
    totalDoneTasks = completedTasks.length;
    notifyListeners();
  }

  void loadTodoTasks() {
    todoTasks = tasks.where((task) => !task.isCompleted).toList();
    notifyListeners();
  }
}
