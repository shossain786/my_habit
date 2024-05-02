import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/activity_model.dart';

class ActivityTable extends StatelessWidget {
  final List<Activity> activities;

  const ActivityTable({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Title')),
          DataColumn(label: Text('Details')),
          DataColumn(label: Text('Start Time')),
          DataColumn(label: Text('End Time')),
          DataColumn(label: Text('Time Spent')),
        ],
        rows: activities.map((activity) {
          final startTimeFormatted =
              DateFormat('HH:mm').format(activity.startTime);
          final endTimeFormatted = DateFormat('HH:mm').format(activity.endTime);
          final duration = activity.endTime.difference(activity.startTime);
          final hours = duration.inHours;
          final minutes = duration.inMinutes.remainder(60);
          final formattedDuration = '${hours}h ${minutes}m';

          return DataRow(cells: [
            DataCell(Text(activity.title)),
            DataCell(Text(
              activity.notes,
              softWrap: true,
            )),
            DataCell(Text(startTimeFormatted)),
            DataCell(Text(endTimeFormatted)),
            DataCell(Text(formattedDuration)),
          ]);
        }).toList(),
      ),
    );
  }
}
