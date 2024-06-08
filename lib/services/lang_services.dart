import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:my_habit/model/lang_model.dart';
import 'package:path_provider/path_provider.dart';

class LangServices extends ChangeNotifier {
  late Future<Isar> lngDB;

  LangServices() {
    lngDB = openLangDB();
  }

  Future<Isar> openLangDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = Isar.open(
        [MyLangSchema],
        directory: dir.path,
        inspector: true,
      );
      return isar;
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> addLang(MyLang myLang) async {
    try {
      final isar = await lngDB;
      await isar.writeTxn(
        () async {
          await isar.myLangs.put(myLang);
        },
      );
      debugPrint('My Languages added successfully');
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<MyLang>> getLanguages() async {
    final isar = await lngDB;
    final languages = await isar.myLangs.where().findAll();
    debugPrint('Fetched mutalas: $languages');
    return languages;
  }

  Future<void> deleteLanguageData(int id) async {
    final isar = await lngDB;
    await isar.writeTxn(() async {
      await isar.myLangs.delete(id);
    });
    notifyListeners();
  }
}
