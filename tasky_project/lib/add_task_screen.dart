import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
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
            Text(
              'Task Name',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: 8),
            TextField(
              cursorColor: const Color(0xFFFFFFFF),
              style: Theme.of(context).textTheme.displaySmall,
              decoration: const InputDecoration(
                hintText: 'Finish UI design for login screen',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Task Description',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: 8),
            TextField(
              cursorColor: const Color(0xFFFFFFFF),
              style: Theme.of(context).textTheme.displaySmall,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText:
                    'Finish onboarding UI and hand off to devs by Thursday.',
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'High Priority  ',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(width: 16),
              ],
            ),
            SizedBox(height: 90),
            ElevatedButton(
              onPressed: () {
                // Add task logic here
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
