import 'package:flutter/material.dart';
import 'package:my_habit/screens/home_screen.dart';
import 'package:my_habit/services/activity_service.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final activityService = ActivityService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: kColorScheme,
        dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: TextStyle(
            color: kColorScheme.onPrimaryContainer,
          ),
        ),
        menuTheme: MenuThemeData(
          style: MenuStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
              Colors.purple.withOpacity(0.6),
            ),
            shadowColor: const MaterialStatePropertyAll(Colors.blue),
            shape: const MaterialStatePropertyAll(
              BeveledRectangleBorder(),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// https://github.com/KrzysztofLen/flutter-isar/blob/main/lib/service/isar_service.dart