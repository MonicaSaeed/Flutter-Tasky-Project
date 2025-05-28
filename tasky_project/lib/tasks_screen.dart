import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

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
                      'Good Evening ,Monica',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text('One task at a time.One step closer.',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: const Color(0xFFC6C6C6D))),
                  ],
                ),
                SizedBox(width: 32),
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF282828),
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
            SizedBox(height: 600),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add Task'),
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
