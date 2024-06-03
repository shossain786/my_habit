// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutala_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMutalaCollection on Isar {
  IsarCollection<Mutala> get mutalas => this.collection();
}

const MutalaSchema = CollectionSchema(
  name: r'Mutala',
  id: -2581063558793804535,
  properties: {
    r'ayahNo': PropertySchema(
      id: 0,
      name: r'ayahNo',
      type: IsarType.string,
    ),
    r'hadis': PropertySchema(
      id: 1,
      name: r'hadis',
      type: IsarType.string,
    ),
    r'others': PropertySchema(
      id: 2,
      name: r'others',
      type: IsarType.string,
    ),
    r'pageNo': PropertySchema(
      id: 3,
      name: r'pageNo',
      type: IsarType.string,
    ),
    r'surahNo': PropertySchema(
      id: 4,
      name: r'surahNo',
      type: IsarType.string,
    )
  },
  estimateSize: _mutalaEstimateSize,
  serialize: _mutalaSerialize,
  deserialize: _mutalaDeserialize,
  deserializeProp: _mutalaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _mutalaGetId,
  getLinks: _mutalaGetLinks,
  attach: _mutalaAttach,
  version: '3.1.0+1',
);

int _mutalaEstimateSize(
  Mutala object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ayahNo.length * 3;
  bytesCount += 3 + object.hadis.length * 3;
  bytesCount += 3 + object.others.length * 3;
  bytesCount += 3 + object.pageNo.length * 3;
  bytesCount += 3 + object.surahNo.length * 3;
  return bytesCount;
}

void _mutalaSerialize(
  Mutala object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.ayahNo);
  writer.writeString(offsets[1], object.hadis);
  writer.writeString(offsets[2], object.others);
  writer.writeString(offsets[3], object.pageNo);
  writer.writeString(offsets[4], object.surahNo);
}

Mutala _mutalaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mutala();
  object.ayahNo = reader.readString(offsets[0]);
  object.hadis = reader.readString(offsets[1]);
  object.id = id;
  object.others = reader.readString(offsets[2]);
  object.pageNo = reader.readString(offsets[3]);
  object.surahNo = reader.readString(offsets[4]);
  return object;
}

P _mutalaDeserializeProp<P>(
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
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mutalaGetId(Mutala object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mutalaGetLinks(Mutala object) {
  return [];
}

void _mutalaAttach(IsarCollection<dynamic> col, Id id, Mutala object) {
  object.id = id;
}

extension MutalaQueryWhereSort on QueryBuilder<Mutala, Mutala, QWhere> {
  QueryBuilder<Mutala, Mutala, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MutalaQueryWhere on QueryBuilder<Mutala, Mutala, QWhereClause> {
  QueryBuilder<Mutala, Mutala, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Mutala, Mutala, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterWhereClause> idBetween(
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

extension MutalaQueryFilter on QueryBuilder<Mutala, Mutala, QFilterCondition> {
  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> ayahNoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ayahNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> ayahNoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ayahNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> ayahNoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ayahNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> ayahNoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ayahNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> ayahNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ayahNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> ayahNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ayahNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> ayahNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ayahNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> ayahNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ayahNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> ayahNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ayahNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> ayahNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ayahNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> hadisEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> hadisGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hadis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> hadisLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hadis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> hadisBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hadis',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> hadisStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hadis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> hadisEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hadis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> hadisContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hadis',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> hadisMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hadis',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> hadisIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadis',
        value: '',
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> hadisIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hadis',
        value: '',
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> othersEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'others',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> othersGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'others',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> othersLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'others',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> othersBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'others',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> othersStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'others',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> othersEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'others',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> othersContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'others',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> othersMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'others',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> othersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'others',
        value: '',
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> othersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'others',
        value: '',
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> pageNoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pageNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> pageNoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pageNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> pageNoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pageNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> pageNoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pageNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> pageNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pageNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> pageNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pageNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> pageNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pageNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> pageNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pageNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> pageNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pageNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> pageNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pageNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> surahNoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surahNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> surahNoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surahNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> surahNoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surahNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> surahNoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surahNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> surahNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surahNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> surahNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surahNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> surahNoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surahNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> surahNoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surahNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> surahNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surahNo',
        value: '',
      ));
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterFilterCondition> surahNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surahNo',
        value: '',
      ));
    });
  }
}

extension MutalaQueryObject on QueryBuilder<Mutala, Mutala, QFilterCondition> {}

extension MutalaQueryLinks on QueryBuilder<Mutala, Mutala, QFilterCondition> {}

extension MutalaQuerySortBy on QueryBuilder<Mutala, Mutala, QSortBy> {
  QueryBuilder<Mutala, Mutala, QAfterSortBy> sortByAyahNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahNo', Sort.asc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> sortByAyahNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahNo', Sort.desc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> sortByHadis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadis', Sort.asc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> sortByHadisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadis', Sort.desc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> sortByOthers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'others', Sort.asc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> sortByOthersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'others', Sort.desc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> sortByPageNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageNo', Sort.asc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> sortByPageNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageNo', Sort.desc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> sortBySurahNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNo', Sort.asc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> sortBySurahNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNo', Sort.desc);
    });
  }
}

extension MutalaQuerySortThenBy on QueryBuilder<Mutala, Mutala, QSortThenBy> {
  QueryBuilder<Mutala, Mutala, QAfterSortBy> thenByAyahNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahNo', Sort.asc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> thenByAyahNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayahNo', Sort.desc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> thenByHadis() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadis', Sort.asc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> thenByHadisDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadis', Sort.desc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> thenByOthers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'others', Sort.asc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> thenByOthersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'others', Sort.desc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> thenByPageNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageNo', Sort.asc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> thenByPageNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pageNo', Sort.desc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> thenBySurahNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNo', Sort.asc);
    });
  }

  QueryBuilder<Mutala, Mutala, QAfterSortBy> thenBySurahNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahNo', Sort.desc);
    });
  }
}

extension MutalaQueryWhereDistinct on QueryBuilder<Mutala, Mutala, QDistinct> {
  QueryBuilder<Mutala, Mutala, QDistinct> distinctByAyahNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ayahNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mutala, Mutala, QDistinct> distinctByHadis(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadis', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mutala, Mutala, QDistinct> distinctByOthers(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'others', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mutala, Mutala, QDistinct> distinctByPageNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pageNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mutala, Mutala, QDistinct> distinctBySurahNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surahNo', caseSensitive: caseSensitive);
    });
  }
}

extension MutalaQueryProperty on QueryBuilder<Mutala, Mutala, QQueryProperty> {
  QueryBuilder<Mutala, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Mutala, String, QQueryOperations> ayahNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ayahNo');
    });
  }

  QueryBuilder<Mutala, String, QQueryOperations> hadisProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadis');
    });
  }

  QueryBuilder<Mutala, String, QQueryOperations> othersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'others');
    });
  }

  QueryBuilder<Mutala, String, QQueryOperations> pageNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pageNo');
    });
  }

  QueryBuilder<Mutala, String, QQueryOperations> surahNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surahNo');
    });
  }
}
