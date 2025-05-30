import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_project/core/components/custom_form_field.dart';
import 'package:tasky_project/core/constants/storage_key.dart';
import 'package:tasky_project/core/services/preferences_manager.dart';

import '../navigation/nav_main_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _key,
              child: Column(
                children: [
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
                  CustomFormField(
                    title: 'Full Name',
                    hintText: 'e.g. Sarah Khalid',
                    controller: nameController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState?.validate() ?? false) {
                        await PreferencesManager().setString(
                            StorageKey.username, nameController.text);
                        String? name =
                            PreferencesManager().getString(StorageKey.username);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavMainScreen(),
                          ),
                        );
                      }
                    },
                    child: Text('Let’s Get Started'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
