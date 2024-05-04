import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_habit/main.dart';
import 'package:my_habit/services/activity_service.dart';

import '../model/activity_model.dart';

class ActivityTable extends StatefulWidget {
  final List<Activity> activities;

  const ActivityTable({super.key, required this.activities});

  @override
  State<ActivityTable> createState() => _ActivityTableState();
}

class _ActivityTableState extends State<ActivityTable> {
  List<Activity> _activities = [];

  @override
  void initState() {
    super.initState();
    _activities = widget.activities;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Activity')),
          DataColumn(label: Text('Details')),
          DataColumn(label: Text('Start Time')),
          DataColumn(label: Text('End Time')),
          DataColumn(label: Text('Time Spent')),
          DataColumn(label: Text('Actions')),
        ],
        rows: widget.activities.map((activity) {
          final startTimeFormatted =
              DateFormat('HH:mm').format(activity.startTime);
          final endTimeFormatted = DateFormat('HH:mm').format(activity.endTime);
          DateTime adjustedEndTime =
              activity.endTime.isBefore(activity.startTime)
                  ? activity.endTime.add(const Duration(days: 1))
                  : activity.endTime;

          final duration = adjustedEndTime.difference(activity.startTime);
          final hours = duration.inHours;
          final minutes = duration.inMinutes.remainder(60);
          final formattedDuration = '${hours}h ${minutes}m';

          return DataRow(cells: [
            DataCell(Text(activity.activity)),
            DataCell(Text(
              activity.notes,
              softWrap: true,
            )),
            DataCell(Text(startTimeFormatted)),
            DataCell(Text(endTimeFormatted)),
            DataCell(Text(formattedDuration)),
            DataCell(IconButton(
              icon: Icon(
                Icons.delete,
                color: kColorScheme.onSecondary,
              ),
              onPressed: () {
                deleteItem(activity.id);
              },
            ))
          ]);
        }).toList(),
      ),
    );
  }

  Future<void> deleteItem(int id) async {
    await ActivityService().deleteActivity(id);
    setState(() {
      _activities.removeWhere((activity) => activity.id == id);
    });
  }
}
