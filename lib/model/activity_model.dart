import 'package:isar/isar.dart';

part 'activity_model.g.dart';

@Collection()
class Activity {
  Id id = Isar.autoIncrement;

  late String activity;
  late DateTime date;
  late DateTime startTime;
  late DateTime endTime;
  late String notes;

  @override
  String toString() {
    return 'Activity{id: $id, activity: $activity, notes: $notes, startTime: $startTime, endTime: $endTime}';
  }
}
