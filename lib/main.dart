import 'package:flutter/material.dart';
import 'package:my_habit/model/activity_model.dart';
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
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final activity = Activity()
                      ..title = 'Read'
                      ..startTime = DateTime.now()
                      ..endTime = DateTime.now()
                      ..notes = 'Reading time morning';
                    activityService.addNewActivity(activity);
                  },
                  child: const Text('Add Item'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// https://github.com/KrzysztofLen/flutter-isar/blob/main/lib/service/isar_service.dart