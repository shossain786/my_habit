import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../model/activity_model.dart';

class ActivityService extends ChangeNotifier {
  late Future<Isar> db;

  ActivityService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([ActivitySchema], directory: dir.path, inspector: true);
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> addNewActivity(Activity newActivity) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.activitys.put(newActivity);
    });
    debugPrint('Activity Added successfully: $newActivity');
    notifyListeners();
  }

  Future<List<Activity>> getActivity() async {
    final isar = await db;
    final activities = await isar.activitys.where().findAll();
    debugPrint('Fetched activities: $activities');
    return activities;
  }

  Future<void> updateActivity(int id, Activity updatedActivity) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.activitys.put(updatedActivity);
    });
    notifyListeners();
  }

  Future<void> deleteActivity(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.activitys.delete(id);
    });
    notifyListeners();
  }
}
