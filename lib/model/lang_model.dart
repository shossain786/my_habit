import 'package:isar/isar.dart';
part 'lang_model.g.dart';

@Collection()
class MyLang {
  Id id = Isar.autoIncrement;
  late String inputString;
  late String outPutString;
  late String otherData;

  @override
  String toString() {
    return 'MyLang{inputString: $inputString, outputString: $outPutString, otherData: $otherData}';
  }
}
