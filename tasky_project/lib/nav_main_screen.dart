import 'package:flutter/material.dart';
import 'package:tasky_project/profile_screen.dart';
import 'package:tasky_project/tasks_screen.dart';
import 'package:tasky_project/todo_screen.dart';

import 'complete_screen.dart';

class NavMainScreen extends StatefulWidget {
  final String name;
  NavMainScreen({super.key, required this.name});

  @override
  State<NavMainScreen> createState() => _NavMainScreenState();
}

class _NavMainScreenState extends State<NavMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      TasksScreen(name: widget.name),
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
