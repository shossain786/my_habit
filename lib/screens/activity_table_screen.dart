import 'package:flutter/material.dart';

import '../model/activity_model.dart';
import '../services/activity_service.dart';
import '../widgets/my_navbar.dart';
import 'activity_table.dart';

class ActivityTableScreen extends StatelessWidget {
  final ActivityService activityService = ActivityService();

  ActivityTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Table'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Activity>>(
          future: activityService.getActivity(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final activities = snapshot.data!;
              return ActivityTable(activities: activities);
            }
          },
        ),
      ),
      bottomNavigationBar: const MyNavbar(),
    );
  }
}
