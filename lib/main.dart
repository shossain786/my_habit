import 'package:flutter/material.dart';
import 'package:my_habit/screens/home_screen.dart';
import 'package:my_habit/services/activity_service.dart';
import 'package:provider/provider.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => ActivityService(),
    child: MyApp(),
  ));
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
            backgroundColor: WidgetStatePropertyAll<Color>(
              Colors.purple.withOpacity(0.6),
            ),
            shadowColor: const WidgetStatePropertyAll(Colors.blue),
            shape: const WidgetStatePropertyAll(
              BeveledRectangleBorder(),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.onSecondary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              kColorScheme.onPrimaryContainer,
            ),
            foregroundColor: WidgetStatePropertyAll(
              kColorScheme.onSecondary,
            ),
            elevation: const WidgetStatePropertyAll(
              20,
            ),
            shadowColor: const WidgetStatePropertyAll(
              Colors.yellowAccent,
            ),
          ),
        ),
        colorScheme: kColorScheme.copyWith(
          surface: kColorScheme.onSecondary,
        ),
        dataTableTheme: DataTableThemeData(
          dataTextStyle: TextStyle(
            color: kColorScheme.onPrimaryContainer,
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
          dataRowColor: WidgetStatePropertyAll(
            kColorScheme.onPrimary.withOpacity(0.2),
          ),
          headingRowColor: WidgetStatePropertyAll(
            kColorScheme.onPrimaryContainer,
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