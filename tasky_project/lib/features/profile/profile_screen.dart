import 'package:flutter/material.dart';

import '../../core/theme/theme_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 16),
              Switch(
                value: ThemeController.isDark(),
                onChanged: (val) => ThemeController.toggleTheme(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
