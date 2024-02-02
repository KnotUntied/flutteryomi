import 'package:flutteryomi/data/track/tracker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tracker_manager.g.dart';

class TrackerManager {
  final trackers = <Tracker>[];

  List<Tracker> loggedInTrackers() => trackers.where((it) => it.isLoggedIn).toList();

  Tracker get(int id) => trackers.firstWhere((it) => it.id == id);
}

@riverpod
TrackerManager trackerManager(TrackerManagerRef ref) => TrackerManager();
