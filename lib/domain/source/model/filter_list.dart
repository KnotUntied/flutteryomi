//import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/source/model/filter.dart';

//part 'filter_list.freezed.dart';

//@unfreezed
//class FilterList with _$FilterList {
//  FilterList._();
//  //factory FilterList(List<Filter> list) = _FilterList;
//  factory FilterList(List<Filter> list) = list;

//  @override
//  bool operator ==(Object other) => false;

//  @override
//  int get hashCode => list.hashCode;
//}

typedef FilterList<T> = List<Filter<T>>;
