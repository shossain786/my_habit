// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lang_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMyLangCollection on Isar {
  IsarCollection<MyLang> get myLangs => this.collection();
}

const MyLangSchema = CollectionSchema(
  name: r'MyLang',
  id: 8789186722350095453,
  properties: {
    r'inputString': PropertySchema(
      id: 0,
      name: r'inputString',
      type: IsarType.string,
    ),
    r'otherData': PropertySchema(
      id: 1,
      name: r'otherData',
      type: IsarType.string,
    ),
    r'outPutString': PropertySchema(
      id: 2,
      name: r'outPutString',
      type: IsarType.string,
    )
  },
  estimateSize: _myLangEstimateSize,
  serialize: _myLangSerialize,
  deserialize: _myLangDeserialize,
  deserializeProp: _myLangDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _myLangGetId,
  getLinks: _myLangGetLinks,
  attach: _myLangAttach,
  version: '3.1.0+1',
);

int _myLangEstimateSize(
  MyLang object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.inputString.length * 3;
  bytesCount += 3 + object.otherData.length * 3;
  bytesCount += 3 + object.outPutString.length * 3;
  return bytesCount;
}

void _myLangSerialize(
  MyLang object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.inputString);
  writer.writeString(offsets[1], object.otherData);
  writer.writeString(offsets[2], object.outPutString);
}

MyLang _myLangDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MyLang();
  object.id = id;
  object.inputString = reader.readString(offsets[0]);
  object.otherData = reader.readString(offsets[1]);
  object.outPutString = reader.readString(offsets[2]);
  return object;
}

P _myLangDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _myLangGetId(MyLang object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _myLangGetLinks(MyLang object) {
  return [];
}

void _myLangAttach(IsarCollection<dynamic> col, Id id, MyLang object) {
  object.id = id;
}

extension MyLangQueryWhereSort on QueryBuilder<MyLang, MyLang, QWhere> {
  QueryBuilder<MyLang, MyLang, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MyLangQueryWhere on QueryBuilder<MyLang, MyLang, QWhereClause> {
  QueryBuilder<MyLang, MyLang, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MyLangQueryFilter on QueryBuilder<MyLang, MyLang, QFilterCondition> {
  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> inputStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inputString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> inputStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inputString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> inputStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inputString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> inputStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inputString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> inputStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'inputString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> inputStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'inputString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> inputStringContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inputString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> inputStringMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inputString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> inputStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inputString',
        value: '',
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> inputStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inputString',
        value: '',
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> otherDataEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'otherData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> otherDataGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'otherData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> otherDataLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'otherData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> otherDataBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'otherData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> otherDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'otherData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> otherDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'otherData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> otherDataContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'otherData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> otherDataMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'otherData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> otherDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'otherData',
        value: '',
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> otherDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'otherData',
        value: '',
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> outPutStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outPutString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> outPutStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'outPutString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> outPutStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'outPutString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> outPutStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'outPutString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> outPutStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'outPutString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> outPutStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'outPutString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> outPutStringContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'outPutString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> outPutStringMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'outPutString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> outPutStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outPutString',
        value: '',
      ));
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterFilterCondition> outPutStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'outPutString',
        value: '',
      ));
    });
  }
}

extension MyLangQueryObject on QueryBuilder<MyLang, MyLang, QFilterCondition> {}

extension MyLangQueryLinks on QueryBuilder<MyLang, MyLang, QFilterCondition> {}

extension MyLangQuerySortBy on QueryBuilder<MyLang, MyLang, QSortBy> {
  QueryBuilder<MyLang, MyLang, QAfterSortBy> sortByInputString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputString', Sort.asc);
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterSortBy> sortByInputStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputString', Sort.desc);
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterSortBy> sortByOtherData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherData', Sort.asc);
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterSortBy> sortByOtherDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherData', Sort.desc);
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterSortBy> sortByOutPutString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outPutString', Sort.asc);
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterSortBy> sortByOutPutStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outPutString', Sort.desc);
    });
  }
}

extension MyLangQuerySortThenBy on QueryBuilder<MyLang, MyLang, QSortThenBy> {
  QueryBuilder<MyLang, MyLang, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterSortBy> thenByInputString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputString', Sort.asc);
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterSortBy> thenByInputStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputString', Sort.desc);
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterSortBy> thenByOtherData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherData', Sort.asc);
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterSortBy> thenByOtherDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'otherData', Sort.desc);
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterSortBy> thenByOutPutString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outPutString', Sort.asc);
    });
  }

  QueryBuilder<MyLang, MyLang, QAfterSortBy> thenByOutPutStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outPutString', Sort.desc);
    });
  }
}

extension MyLangQueryWhereDistinct on QueryBuilder<MyLang, MyLang, QDistinct> {
  QueryBuilder<MyLang, MyLang, QDistinct> distinctByInputString(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inputString', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MyLang, MyLang, QDistinct> distinctByOtherData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'otherData', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MyLang, MyLang, QDistinct> distinctByOutPutString(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outPutString', caseSensitive: caseSensitive);
    });
  }
}

extension MyLangQueryProperty on QueryBuilder<MyLang, MyLang, QQueryProperty> {
  QueryBuilder<MyLang, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MyLang, String, QQueryOperations> inputStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inputString');
    });
  }

  QueryBuilder<MyLang, String, QQueryOperations> otherDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'otherData');
    });
  }

  QueryBuilder<MyLang, String, QQueryOperations> outPutStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outPutString');
    });
  }
}
