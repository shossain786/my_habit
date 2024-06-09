import 'package:isar/isar.dart';
import '../model/lang_model.dart';

class MyLangService {
  final IsarCollection<MyLang> _myLangCollection;

  MyLangService(this._myLangCollection);

  Future<void> addMyLang(MyLang myLang) async {
    await _myLangCollection.isar.writeTxn(() async {
      await _myLangCollection.put(myLang);
    });
  }

  Future<MyLang?> getMyLangById(int id) async {
    return await _myLangCollection.get(id);
  }

  Future<List<MyLang>> getAllMyLangs() async {
    return await _myLangCollection.where().findAll();
  }

  Future<void> updateMyLang(MyLang myLang) async {
    await _myLangCollection.isar.writeTxn(() async {
      await _myLangCollection.put(myLang);
    });
  }

  Future<void> deleteMyLangById(int id) async {
    await _myLangCollection.isar.writeTxn(() async {
      await _myLangCollection.delete(id);
    });
  }
}
