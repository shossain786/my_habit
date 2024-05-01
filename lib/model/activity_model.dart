import 'package:isar/isar.dart';

part 'activity_model.g.dart';

@Collection()
class Activity {
  Id id = Isar.autoIncrement;

  late String title;
  late DateTime startTime;
  late DateTime endTime;
  late String notes;
}
