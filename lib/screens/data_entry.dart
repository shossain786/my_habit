// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:my_habit/main.dart';

import '../model/activity_model.dart';
import '../services/activity_service.dart';
import 'activity_table_screen.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({super.key});

  @override
  _DataEntryScreenState createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  final activityService = ActivityService();
  final TextEditingController _notesController = TextEditingController();
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  late String _selectedActivity;
  List<String> activityList = <String>[
    'Namaz',
    'Zikar',
    'Tilawat',
    'Taharat',
    'Sleeping',
    'Reading',
    'Teaching',
    'Marketing',
    'Shopping',
    'Travelling',
    'Cooking',
    'Work',
    'Home Work',
    'Class',
    'Playing',
    'Doctor Visit',
    'Family Work',
    'Phone Calls',
    'Social Media',
    'Youtube',
    'Others'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Activity'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(colors: [
                Colors.cyanAccent,
                Colors.yellow,
              ])),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Select Activity',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    DropdownMenu<String>(
                      menuHeight: 250,
                      width: 160,
                      label: const Text('Activity'),
                      menuStyle: const MenuStyle(
                        elevation: MaterialStatePropertyAll(10),
                      ),
                      requestFocusOnTap: true,
                      dropdownMenuEntries:
                          activityList.map<DropdownMenuEntry<String>>(
                        (String value) {
                          return DropdownMenuEntry<String>(
                            value: value,
                            label: value,
                            style: ButtonStyle(
                              foregroundColor: MaterialStatePropertyAll(
                                kColorScheme.onSecondary,
                              ),
                              textStyle: const MaterialStatePropertyAll(
                                TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                      onSelected: (value) {
                        setState(() {
                          _selectedActivity = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: kColorScheme.onPrimaryContainer),
                  ),
                  child: TextField(
                    maxLines: 3,
                    controller: _notesController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: InputBorder.none,
                      labelText: 'Enter Activity Details',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          _startTime != null
                              ? 'Start Time: ${_startTime!.format(context)}'
                              : 'Select Start Time',
                        ),
                        onTap: () async {
                          final selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (selectedTime != null) {
                            setState(() {
                              _startTime = selectedTime;
                            });
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          _endTime != null
                              ? 'End Time: ${_endTime!.format(context)}'
                              : 'Select End Time',
                        ),
                        onTap: () async {
                          final selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (selectedTime != null) {
                            setState(() {
                              _endTime = selectedTime;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_startTime == null || _endTime == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please provide all informations.'),
                            ),
                          );
                          return;
                        }
                        final activity = Activity()
                          ..title = _selectedActivity
                          ..startTime = convertTimeOfDayToDateTime(_startTime!)
                          ..endTime = convertTimeOfDayToDateTime(_endTime!)
                          ..notes = _notesController.text;
                        activityService.addNewActivity(activity);
                        resetAll();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DataEntryScreen(),
                          ),
                        );
                      },
                      child: const Text('Add Activity'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ActivityTableScreen(),
                          ),
                        );
                      },
                      child: const Text('Display Data'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  DateTime convertTimeOfDayToDateTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  void resetAll() {
    _notesController.clear();
    _startTime = null;
    _endTime = null;
  }
}
