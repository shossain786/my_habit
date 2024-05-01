// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../model/activity_model.dart';

class ActivityService {
  late Future<Isar> db;

  ActivityService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([ActivitySchema],
          directory: dir.path, inspector: true);
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> addNewActivity(Activity newActivity) async {
    debugPrint('Activity to Add $newActivity');
    final isar = await db;
    isar.writeTxnSync<int>(
      () => isar.activitys.putSync(newActivity),
    );
    debugPrint('Activity Added successfully');
  }

  Future<List<Activity>> getActivity() async {
    final isar = await db;

    IsarCollection<Activity> contactsCollection = isar.collection<Activity>();
    final activity = contactsCollection.where().findAll();
    return activity;
  }

  Future<void> updateActivity(int id, Activity updatedActivity) async {
    final isar = await db;

    await isar.writeTxn(
      () async {
        final contactToUpdate = await isar.activitys.get(id);

        if (contactToUpdate != null) {
          await isar.activitys.put(updatedActivity);
        } else {
          debugPrint('Contact with ID not found.');
        }
      },
    );
  }

  Future<void> deleteActivity(int id) async {
    final isar = await db;

    await isar.writeTxn(() async {
      final success = await isar.activitys.delete(id);
      debugPrint('Contact deleted: $success');
    });
  }
}
