import 'dart:io';

import 'package:flutteryomi/data/track/model/track_search.dart';
import 'package:flutteryomi/domain/track/model/track.dart';

abstract class Tracker {
  late int id;
  late String name;
  late HttpClient client;
  // Application and remote support for reading dates
  late bool supportsReadingDates;

  int getLogoColor();
  int getLogo();
  List<int> getStatusList();
  String? getStatus(int status);
  int getReadingStatus();
  int getRereadingStatus();
  int getCompletionStatus();
  List<String> getScoreList();

  // Mihon TODO: Store all scores as 10 point in the future maybe?
  double get10PointScore(Track track);

  double indexToScore(int index);

  String displayScore(Track track);

  Future<Track> update(Track track, [bool didReadChapter = false]);

  Future<Track> bind(Track track, [bool hasReadChapters = false]);

  Future<List<TrackSearch>> search(String query);

  Future<Track> refresh(Track track);

  Future<void> login(String username, String password);

  void logout();

  late bool isLoggedIn;

  String getUsername();

  String getPassword();

  void saveCredentials(String username, String password);
}
