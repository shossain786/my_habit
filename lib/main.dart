import 'package:flutter/material.dart';
import 'package:my_habit/model/activity_model.dart';
import 'package:my_habit/screens/activity_table_screen.dart';
import 'package:my_habit/services/activity_service.dart';

import 'screens/data_entry.dart';

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
          // Your theme data
          ),
      home: Builder(
        builder: (context) => Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DataEntryScreen(),
                        ),
                      );
                    },
                    child: const Text('Go to Data Entry Screen'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// https://github.com/KrzysztofLen/flutter-isar/blob/main/lib/service/isar_service.dart