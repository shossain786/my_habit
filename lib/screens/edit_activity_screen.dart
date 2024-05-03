// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../model/activity_model.dart';
import '../services/activity_service.dart';

class EditActivityScreen extends StatefulWidget {
  final Activity activity;

  const EditActivityScreen({super.key, required this.activity});

  @override
  _EditActivityScreenState createState() => _EditActivityScreenState();
}

class _EditActivityScreenState extends State<EditActivityScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  final activityService = ActivityService();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.activity.activity;
    _notesController.text = widget.activity.notes;
    _startTime = TimeOfDay.fromDateTime(widget.activity.startTime);
    _endTime = TimeOfDay.fromDateTime(widget.activity.endTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(_startTime != null
                        ? 'Start Time: ${_startTime!.format(context)}'
                        : 'Select Start Time'),
                    onTap: () async {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: _startTime ?? TimeOfDay.now(),
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
                    title: Text(_endTime != null
                        ? 'End Time: ${_endTime!.format(context)}'
                        : 'Select End Time'),
                    onTap: () async {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: _endTime ?? TimeOfDay.now(),
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
            TextField(
              controller: _notesController,
              maxLines: null,
              decoration: const InputDecoration(labelText: 'Notes'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                activityService.updateActivity(widget.activity.id, Activity());
                // Update activity details
                // final updatedActivity = Activity(
                //   id: widget.activity.id,
                //   title: _titleController.text,
                //   startTime: _startTime != null
                //       ? convertTimeOfDayToDateTime(_startTime!)
                //       : widget.activity.startTime,
                //   endTime: _endTime != null
                //       ? convertTimeOfDayToDateTime(_endTime!)
                //       : widget.activity.endTime,
                //   notes: _notesController.text,
                // );
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
