import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tasky_project/features/profile/user_controller.dart';
import 'package:tasky_project/features/profile/user_details_screen.dart';
import 'package:tasky_project/features/profile/wedgits/show_image_source_dialog.dart';
import 'package:tasky_project/features/welcome/home_screen.dart';

import '../../core/constants/storage_key.dart';
import '../../core/services/preferences_manager.dart';
import '../../core/theme/theme_controller.dart';
import '../tasks/tasks_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<UserController>(
            builder: (context, userController, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'My Profile',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 18),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: userController.userImagePath == ''
                              ? const AssetImage(
                                      'assets/images/default_user.jpg')
                                  as ImageProvider
                              : FileImage(File(userController.userImagePath!)),
                        ),
                        GestureDetector(
                          onTap: () async {
                            showImageSourceDialog(context, (XFile file) {
                              userController.saveUserImage(file);
                            });
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: ThemeController.isDark()
                                ? Color(0xFF282828)
                                : Colors.white,
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          userController.username!,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          userController.motivationQuote,
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Profile Info',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 24),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return UserDetailsScreen();
                        },
                      ));
                    },
                    contentPadding: EdgeInsets.zero,
                    title: const Text('User Details'),
                    leading: const Icon(
                      Icons.person_outline,
                      size: 32,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                    ),
                  ),
                  const Divider(thickness: 1),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Dark Mode'),
                    leading: ValueListenableBuilder(
                      valueListenable: ThemeController.themeNotifier,
                      builder: (BuildContext context, value, Widget? child) {
                        return ThemeController.isDark()
                            ? SvgPicture.asset(
                                'assets/images/sun.svg',
                                width: 32,
                                height: 32,
                              )
                            : SvgPicture.asset(
                                'assets/images/moon.svg',
                                width: 32,
                                height: 32,
                              );
                      },
                    ),
                    trailing: ValueListenableBuilder(
                      valueListenable: ThemeController.themeNotifier,
                      builder: (BuildContext context, value, Widget? child) {
                        return Switch(
                          value: ThemeController.isDark(),
                          onChanged: (val) => ThemeController.toggleTheme(),
                        );
                      },
                    ),
                  ),
                  const Divider(thickness: 1),
                  ListTile(
                    onTap: () async {
                      final userController =
                          Provider.of<UserController>(context, listen: false);
                      await userController.clearUserData();
                      final tasksController =
                          Provider.of<TasksController>(context, listen: false);
                      await tasksController.clearTasks();
                      ThemeController.themeNotifier.value = ThemeMode.dark;
                      await PreferencesManager()
                          .setBool(StorageKey.theme, true);
                      if (context.mounted) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) {
                            return HomeScreen();
                          },
                        ));
                      }
                    },
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Log Out'),
                    leading: const Icon(
                      Icons.logout,
                      size: 32,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
