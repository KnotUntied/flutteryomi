import 'package:riverpod/riverpod.dart';

class AppHelper {
  final Ref ref;
  AppHelper(this.ref);
  // rest of class has access to ref
}

final appHelperProvider = Provider(AppHelper.new);
