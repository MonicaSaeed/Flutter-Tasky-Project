import 'package:flutter/material.dart';
import 'package:tasky_project/features/navigation/nav_main_screen.dart';
import 'package:tasky_project/features/welcome/home_screen.dart';

import 'core/constants/storage_key.dart';
import 'core/services/preferences_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures binding is ready
  await PreferencesManager().init(); // Initialize the singleton instance
  await PreferencesManager().remove(StorageKey.username);

  final String? name = PreferencesManager().getString(StorageKey.username);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF181818),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 28,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,
          ),
          displayMedium: TextStyle(
            fontSize: 24,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,
          ),
          displaySmall: TextStyle(
            fontSize: 16,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF15B86C),
            foregroundColor: const Color(0xFFFFFFFF),
            fixedSize: Size(MediaQuery.of(context).size.width, 40),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF282828),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(
            color: Color(0xFF6D6D6D),
            fontSize: 16,
          ),
        ),
        switchTheme: SwitchThemeData(
          trackColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const Color(0xFF15B86C);
              } else {
                return const Color(0xFFFFFFFF);
              }
            },
          ),
          thumbColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const Color(0xFFFFFFFF);
              } else {
                return const Color(0xFF9E9E9E);
              }
            },
          ),
          trackOutlineColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.transparent;
              } else {
                return const Color(0xFF9E9E9E);
              }
            },
          ),
          trackOutlineWidth: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return 0.0;
              } else {
                return 2.0;
              }
            },
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF181818),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color(0xFFC6C6C6),
          selectedItemColor: Color(0xFF15B86C),
        ),
      ),
      home: PreferencesManager().getString(StorageKey.username) == null
          ? HomeScreen()
          : NavMainScreen(),
    );
  }
}
