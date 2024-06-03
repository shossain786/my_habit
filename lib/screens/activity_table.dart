import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:my_habit/services/activity_service.dart';
import '../model/activity_model.dart';

class ActivityTable extends StatefulWidget {
  final List<Activity> activities;

  const ActivityTable({super.key, required this.activities});

  @override
  State<ActivityTable> createState() => _ActivityTableState();
}

class _ActivityTableState extends State<ActivityTable> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityService>(
      builder: (context, activityService, child) {
        return FutureBuilder<List<Activity>>(
          future: activityService.getActivity(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No activities found.'));
            } else {
              final activities = snapshot.data!;
              debugPrint('Displaying activities: $activities');
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
                  rows: activities.map((activity) {
                    final startTimeFormatted =
                        DateFormat('HH:mm').format(activity.startTime);
                    final endTimeFormatted =
                        DateFormat('HH:mm').format(activity.endTime);
                    DateTime adjustedEndTime =
                        activity.endTime.isBefore(activity.startTime)
                            ? activity.endTime.add(const Duration(days: 1))
                            : activity.endTime;

                    final duration =
                        adjustedEndTime.difference(activity.startTime);
                    final hours = duration.inHours;
                    final minutes = duration.inMinutes.remainder(60);
                    final formattedDuration = '${hours}h ${minutes}m';

                    return DataRow(
                      cells: [
                        DataCell(Text(activity.activity)),
                        DataCell(Text(
                          activity.notes,
                          softWrap: true,
                        )),
                        DataCell(Text(startTimeFormatted)),
                        DataCell(Text(endTimeFormatted)),
                        DataCell(Text(formattedDuration)),
                        DataCell(
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            onPressed: () {
                              deleteItem(activity.id);
                            },
                          ),
                        ),
                      ],
                      color: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.pressed)) {
                          return Colors.green;
                        }
                        return Colors.blue;
                      }),
                    );
                  }).toList(),
                ),
              );
            }
          },
        );
      },
    );
  }

  Future<void> deleteItem(int id) async {
    await Provider.of<ActivityService>(context, listen: false)
        .deleteActivity(id);
  }
}
