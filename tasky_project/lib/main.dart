import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky_project/features/navigation/nav_main_screen.dart';
import 'package:tasky_project/features/welcome/home_screen.dart';

import 'core/constants/storage_key.dart';
import 'core/services/preferences_manager.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'core/theme/theme_controller.dart';
import 'features/profile/user_controller.dart';
import 'features/tasks/tasks_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager().init();
  ThemeController().init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TasksController()..init()),
        ChangeNotifierProvider(
            create: (_) => UserController()), // your second provider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.themeNotifier,
      builder: (context, ThemeMode themeMode, Widget? child) {
        return MaterialApp(
          title: 'Tasky App',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          home: PreferencesManager().getString(StorageKey.username) == null
              ? HomeScreen()
              : NavMainScreen(),
        );
      },
    );
  }
}
