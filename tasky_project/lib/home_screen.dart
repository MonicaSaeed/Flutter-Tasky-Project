import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_project/tasks_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: 42,
                    height: 42,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Tasky',
                    style: Theme.of(
                      context,
                    ).textTheme.displayLarge,
                  ),
                ],
              ),
              SizedBox(height: 108),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome To Tasky',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SvgPicture.asset(
                    'assets/images/waving-hand.svg',
                    width: 28,
                    height: 28,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Your productivity journey starts here.',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: 24),
              SvgPicture.asset(
                'assets/images/pana.svg',
                width: 215,
                height: 205,
              ),
              SizedBox(height: 28),
              Row(
                children: [
                  Text(
                    'Full Name',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
              SizedBox(height: 8),
              TextField(
                cursorColor: const Color(0xFFFFFFFF),
                style: Theme.of(context).textTheme.displaySmall,
                decoration: const InputDecoration(
                  hintText: 'e.g. Sarah Khalid',
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TasksScreen(),
                    ),
                  );
                },
                child: Text('Let’s Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
