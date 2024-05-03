import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../model/activity_model.dart';

class DailyActivityTable extends StatelessWidget {
  final Isar isar;
  final DateTime date;

  const DailyActivityTable({super.key, required this.isar, required this.date});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Activity>>(
      future: _fetchActivitiesForDate(date),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No activities found for this date.');
        } else {
          return _buildActivityTable(snapshot.data!);
        }
      },
    );
  }

  Future<List<Activity>> _fetchActivitiesForDate(DateTime date) async {
    final activities =
        await isar.activitys.filter().startTimeEqualTo(date).findAll();
    return activities;
  }

  Widget _buildActivityTable(List<Activity> activities) {
    Map<String, Duration> activityDurations = {};

    for (var activity in activities) {
      String activityTitle = activity.title;
      Duration duration = activity.endTime.difference(activity.startTime);

      if (activityDurations.containsKey(activityTitle)) {
        activityDurations[activityTitle] =
            activityDurations[activityTitle]! + duration;
      } else {
        activityDurations[activityTitle] = duration;
      }
    }

    return DataTable(
      columns: const [
        DataColumn(label: Text('Activity')),
        DataColumn(label: Text('Time Spent')),
      ],
      rows: activityDurations.entries.map((entry) {
        String activityTitle = entry.key;
        Duration duration = entry.value;

        return DataRow(cells: [
          DataCell(Text(activityTitle)),
          DataCell(Text(_formatDuration(duration))),
        ]);
      }).toList(),
    );
  }

  String _formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    return '$hours h $minutes m';
  }
}
