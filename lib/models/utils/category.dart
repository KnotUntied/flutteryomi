import 'package:flutteryomi/models/tables/categories.drift.dart';

extension CategoryUtils on Category {
  bool get isSystemCategory => id == 0;
}
