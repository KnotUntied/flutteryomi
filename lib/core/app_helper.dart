import 'package:riverpod/riverpod.dart';

class AppHelper {
  final Ref ref;
  AppHelper(this.ref);
}

final appHelperProvider = Provider(AppHelper.new);
