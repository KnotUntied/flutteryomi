// https://github.com/simolus3/drift/issues/1339#issue-942163256

import 'dart:convert';

import 'package:drift/drift.dart';

class ListOfStringsConverter extends TypeConverter<List<String>, String> {
  const ListOfStringsConverter();

  @override
  List<String> fromSql(String fromDb) {
    return json.decode(fromDb);
  }

  @override
  String toSql(List<String> value) {
    return json.encode(value);
  }
}
