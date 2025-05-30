import 'package:flutter/material.dart';
import 'package:tasky_project/features/home/tasks_screen.dart';
import 'package:tasky_project/features/profile/profile_screen.dart';
import 'package:tasky_project/features/tasks/todo_screen.dart';

import '../tasks/complete_screen.dart';

class NavMainScreen extends StatefulWidget {
  NavMainScreen({super.key});

  @override
  State<NavMainScreen> createState() => _NavMainScreenState();
}

class _NavMainScreenState extends State<NavMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      TasksScreen(),
      TodoScreen(),
      CompleteScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'To Do'),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_alt), label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        onTap: (int? index) {
          if (index != null) {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
      body: screens[_currentIndex],
    );
  }
}
