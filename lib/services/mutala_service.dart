import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../model/mutala_model.dart';

class MutalaService extends ChangeNotifier {
  late Future<Isar> mDb;

  MutalaService() {
    mDb = openDb();
  }

  Future<Isar> openDb() async {
    if (Isar.instanceNames.isEmpty) {
      final directory = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
        [MutalaSchema],
        directory: directory.path,
        inspector: true,
      );
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> addNewMutala(Mutala mutala) async {
    try {
      final isar = await mDb;
      await isar.writeTxn(() async {
        await isar.mutalas.put(mutala);
      });
      debugPrint('Mutala added successfully: $mutala');
      notifyListeners();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<Mutala>> getMutala() async {
    final isar = await mDb;
    final mutalas = await isar.mutalas.where().findAll();
    debugPrint('Fetched mutalas: $mutalas');
    return mutalas;
  }
}
