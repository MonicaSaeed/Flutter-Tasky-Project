import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_project/features/profile/user_controller.dart';

import '../../core/components/custom_form_field.dart';

class UserDetailsScreen extends StatefulWidget {
  UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final TextEditingController useNameController = TextEditingController();

  final TextEditingController userMotivationQuoteController =
      TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  initState() {
    super.initState();
    final userController = Provider.of<UserController>(context, listen: false);
    useNameController.text = userController.username;
    userMotivationQuoteController.text = userController.motivationQuote;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<UserController>(
          builder: (context, userController, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'User Details',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    CustomFormField(
                      title: 'User Name',
                      hintText: 'Enter your name',
                      maxLines: 1,
                      controller: useNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomFormField(
                      title: 'Motivation Quote',
                      hintText: 'Enter your motivation quote',
                      maxLines: 5,
                      controller: userMotivationQuoteController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 90),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 40),
                      ),
                      icon: const Icon(Icons.save),
                      onPressed: () async {
                        if (_key.currentState?.validate() ?? false) {
                          await userController.updateUserData(
                            useNameController.text,
                            userMotivationQuoteController.text,
                          );
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        }
                      },
                      label: const Text('Save'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
