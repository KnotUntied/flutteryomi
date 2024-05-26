import 'package:dartx/dartx.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';
import 'package:flutteryomi/domain/manga/model/manga_update.dart';
import 'package:flutteryomi/domain/chapter/interactor/get_chapters_by_manga_id.dart';

part 'fetch_interval.g.dart';

class FetchInterval {
  final GetChaptersByMangaId getChapterByMangaId;
  FetchInterval(this.getChapterByMangaId);

  Future<MangaUpdate?> toMangaUpdateOrNull(
    Manga manga,
    DateTime dateTime,
    Pair<int, int> window,
  ) async {
    final currentWindow = (window.first == 0 && window.second == 0)
        ? getWindow(DateTime.now())
        : window;
    final chapters =
        await getChapterByMangaId.await_(manga.id, applyScanlatorFilter: true);
    final interval = manga.fetchInterval < 0
        ? manga.fetchInterval
        : calculateInterval(chapters);
    final nextUpdate =
        _calculateNextUpdate(manga, interval, dateTime, currentWindow);
    if (manga.nextUpdate!.millisecondsSinceEpoch == nextUpdate &&
        manga.fetchInterval == interval) {
      return null;
    } else {
      return MangaUpdate(
        id: Value(manga.id),
        nextUpdate: Value(
          DateTime.fromMillisecondsSinceEpoch(nextUpdate, isUtc: true),
        ),
        fetchInterval: Value(interval),
      );
    }
  }

  Pair<int, int> getWindow(DateTime dateTime) {
    final today = DateUtils.dateOnly(dateTime.toLocal());
    final lowerBound = DateUtils.addDaysToDate(today, -_gracePeriod);
    final upperBound = DateUtils.addDaysToDate(today, _gracePeriod);
    return Pair(
      lowerBound.millisecondsSinceEpoch,
      upperBound.millisecondsSinceEpoch - 1,
    );
  }

  int calculateInterval(List<Chapter> chapters) {
    final uploadDates = chapters
        .where((c) => c.dateUpload > _zeroDT)
        .sortedByDescending((c) => c.dateUpload)
        .map((c) => DateUtils.dateOnly(c.dateUpload))
        .distinct()
        .take(10)
        .toList();
    final fetchDates = chapters
        .where((c) => c.dateFetch > _zeroDT)
        .sortedByDescending((c) => c.dateFetch)
        .map((c) => DateUtils.dateOnly(c.dateFetch))
        .distinct()
        .take(10)
        .toList();
    int interval;
    if (uploadDates.length > 3) {
      final uploadDelta = uploadDates.first.difference(uploadDates.last).inDays;
      final uploadPeriod = uploadDates.indexOf(uploadDates.last);
      interval = uploadDelta ~/ uploadPeriod;
    } else if (fetchDates.length > 3) {
      final fetchDelta = fetchDates.first.difference(fetchDates.last).inDays;
      final uploadPeriod = fetchDates.indexOf(fetchDates.last);
      interval = fetchDelta ~/ uploadPeriod;
    } else {
      interval = 7;
    }
    return interval.clamp(1, maxInterval);
  }

  int _calculateNextUpdate(
    Manga manga,
    int interval,
    DateTime dateTime,
    Pair<int, int> window,
  ) {
    if (window.first
            .rangeTo(window.second + 1)
            .contains(manga.nextUpdate!.millisecondsSinceEpoch) ||
        manga.fetchInterval == 0) {
      final latestDate = DateUtils.dateOnly(manga.lastUpdate!);
      final timeSinceLatest = latestDate.difference(dateTime).inDays;
      final cycle = timeSinceLatest ~/
          (interval < 0
              ? interval.abs()
              : _doubleInterval(interval, timeSinceLatest, 10));
      return DateUtils.addDaysToDate(latestDate, (cycle + 1) * interval)
          .millisecondsSinceEpoch;
    } else {
      return manga.nextUpdate!.millisecondsSinceEpoch;
    }
  }

  int _doubleInterval(int delta, int timeSinceLatest, int doubleWhenOver) {
    if (delta >= maxInterval) return maxInterval;
    final cycle = (timeSinceLatest ~/ delta) + 1;
    // no tail-call optimization in dart oof
    if (cycle > doubleWhenOver) {
      return _doubleInterval(delta * 2, timeSinceLatest, doubleWhenOver);
    } else {
      return delta;
    }
  }

  static const int maxInterval = 28;
  static const int _gracePeriod = 1;
}

final DateTime _zeroDT = DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);

@riverpod
FetchInterval fetchInterval(FetchIntervalRef ref) =>
    FetchInterval(ref.watch(getChaptersByMangaIdProvider));
