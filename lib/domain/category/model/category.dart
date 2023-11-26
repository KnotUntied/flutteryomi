import 'package:flutteryomi/data/drift/data/categories.drift.dart';

extension CategoryUtils on Category {
  bool get isSystemCategory => id == 0;
}
