import 'package:flutter/material.dart';
import 'package:tasky_project/core/components/custom_form_field.dart';

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
            CustomFormField(
              title: 'Task Name',
              hintText: 'Finish UI design for login screen',
              maxLines: 1,
              controller: TextEditingController(),
            ),
            SizedBox(height: 20),
            CustomFormField(
              title: 'Task Description',
              hintText:
                  'Finish onboarding UI and hand off to devs by Thursday.',
              maxLines: 5,
              controller: TextEditingController(),
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
            ElevatedButton.icon(
              icon: Icon(Icons.add, size: 18),
              onPressed: () {
                // Add task logic here
              },
              label: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
