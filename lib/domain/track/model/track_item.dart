import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/data/drift/data/manga_sync.drift.dart';
import 'package:flutteryomi/data/track/tracker.dart';
import 'package:flutteryomi/domain/track/model/track.dart';

part 'track_item.freezed.dart';

@freezed
class TrackItem with _$TrackItem {
  const factory TrackItem({
    Track? track,
    required Tracker tracker,
  }) = _TrackItem;
}
