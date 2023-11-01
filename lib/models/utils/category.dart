import 'package:flutteryomi/database.dart';

extension CategoryUtils on Category {
  bool get isSystemCategory => id == 0;
}
