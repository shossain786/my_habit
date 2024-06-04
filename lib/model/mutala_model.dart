import 'package:isar/isar.dart';

part 'mutala_model.g.dart';

@Collection()
class Mutala {
  Id id = Isar.autoIncrement;

  late String ayahNo;
  late String surahNo;
  late String pageNo;
  late String hadis;
  late String others;

  @override
  String toString() {
    return 'Mutala{id: $id, ayahNo: $ayahNo, surahNo: $surahNo, pageNo: $pageNo, hadis: $hadis, others: $others}';
  }
}
