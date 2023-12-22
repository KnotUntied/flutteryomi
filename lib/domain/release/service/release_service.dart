import 'package:flutteryomi/domain/release/model/release.dart';

abstract interface class ReleaseService {
  Future<Release> latest(String repository);
}
