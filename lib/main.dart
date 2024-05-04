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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              // kColorScheme.onPrimaryContainer.withOpacity(0.3),
              Colors.indigo..withOpacity(0.8),
            ),
            foregroundColor: MaterialStatePropertyAll(
              kColorScheme.onSecondary,
            ),
            elevation: const MaterialStatePropertyAll(
              20,
            ),
            shadowColor: const MaterialStatePropertyAll(
              Colors.yellowAccent,
            ),
          ),
        ),
        colorScheme: kColorScheme.copyWith(
          background: kColorScheme.onBackground,
        ),
        dataTableTheme: DataTableThemeData(
          dataTextStyle: TextStyle(
            color: kColorScheme.onSecondary,
            fontSize: 16,
          ),
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                width: 2,
                color: kColorScheme.onSecondary,
                style: BorderStyle.solid,
              ),
            ),
          ),
          headingTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondary,
            wordSpacing: 4,
            fontSize: 18,
          ),
          dataRowColor: MaterialStatePropertyAll(
            kColorScheme.onPrimary.withOpacity(0.2),
          ),
          headingRowColor: const MaterialStatePropertyAll(
            Colors.blue,
          ),
          dividerThickness: 2,
          horizontalMargin: 10,
          headingRowHeight: 40,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// https://github.com/KrzysztofLen/flutter-isar/blob/main/lib/service/isar_service.dart