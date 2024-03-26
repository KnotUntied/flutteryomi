import 'dart:convert';

import 'package:dartx/dartx_io.dart';
import 'package:drift/drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';

part 'download_pending_deleter.freezed.dart';
part 'download_pending_deleter.g.dart';

class DownloadPendingDeleter {
  DownloadPendingDeleter();

  /// Preferences used to store the list of chapters to delete.
  final preferences = Hive.box<String>('chapters_to_delete');

  /// Last added chapter, used to avoid decoding from the preference too often.
  _Entry? _lastAddedEntry;

  /// Adds a list of [chapters] for future deletion.
  void addChapters(List<Chapter> chapters, Manga manga) {
    final lastEntry = _lastAddedEntry;

    final _Entry newEntry;
    if (lastEntry != null && lastEntry.manga.id == manga.id) {
      // Append new chapters
      final newChapters = lastEntry.chapters.addUniqueById(chapters);

      // If no chapters were added, do nothing
      if (newChapters.length == lastEntry.chapters.length) return;

      // Last entry matches the manga, reuse it to avoid decoding json from preferences
      newEntry = lastEntry.copyWith(chapters: newChapters);
    } else {
      final existingEntry = preferences.get(manga.id.toString());
      if (existingEntry != null) {
        // Existing entry found on preferences, decode json and add the new chapter
        final _Entry savedEntry = jsonDecode(existingEntry);

        // Append new chapters
        final newChapters = savedEntry.chapters.addUniqueById(chapters);

        // If no chapters were added, do nothing
        if (newChapters.length == savedEntry.chapters.length) return;

        newEntry = savedEntry.copyWith(chapters: newChapters);
      } else {
        // No entry has been found yet, create a new one
        newEntry = _Entry(
          chapters: chapters.map((it) => it.toEntry()).toList(),
          manga: manga.toEntry(),
        );
      }
    }

    // Save current state
    final json = jsonEncode(newEntry);
    preferences.put(newEntry.manga.id.toString(), json);
    _lastAddedEntry = newEntry;
  }

  /// Returns the list of chapters to be deleted grouped by its manga.
  ///
  /// Note: the returned list of manga and chapters only contain basic information needed by the
  /// downloader, so don't use them for anything else.
  Map<Manga, List<Chapter>> getPendingChapters() {
    final entries = _decodeAll();
    preferences.clear();
    _lastAddedEntry = null;

    return entries.associate(
      (entry) => MapEntry(
        entry.manga.toModel(),
        entry.chapters.map((it) => it.toModel()).toList(),
      ),
    );
  }

  /// Decodes all the chapters from preferences.
  List<_Entry> _decodeAll() {
    return preferences.values.mapNotNull<_Entry>((rawEntry) {
      try {
        final entryString = rawEntry as String?;
        return entryString != null ? jsonDecode(entryString) : null;
      } catch (_) {
        return null;
      }
    }).toList();
  }
}

extension _ListChapterEntryAddUniqueById on List<_ChapterEntry> {
  /// Returns a copy of chapter entries ensuring no duplicates by chapter id.
  List<_ChapterEntry> addUniqueById(List<Chapter> chapters) {
    const newList = <_ChapterEntry>[];
    for (final chapter in chapters) {
      if (none((it) => it.id == chapter.id)) {
        newList.add(chapter.toEntry());
      }
    }
    return newList;
  }
}

extension _MangaToEntry on Manga {
  /// Returns a manga model from a manga entry.
  _MangaEntry toEntry() => _MangaEntry(
        id: id,
        url: url,
        title: title,
        source: source,
      );
}

extension _ChapterToEntry on Chapter {
  /// Returns a chapter entry from a chapter model.
  _ChapterEntry toEntry() => _ChapterEntry(
        id: id,
        url: url,
        name: name,
        scanlator: scanlator,
      );
}

/// Class used to save an entry of chapters with their manga into preferences.
@freezed
class _Entry with _$Entry {
  const _Entry._();
  const factory _Entry({
    required List<_ChapterEntry> chapters,
    required _MangaEntry manga,
  }) = __Entry;

  factory _Entry.fromJson(Map<String, Object?> json) => _$EntryFromJson(json);
}

/// Class used to save an entry for a chapter into preferences.
@freezed
class _ChapterEntry with _$ChapterEntry {
  const _ChapterEntry._();
  const factory _ChapterEntry({
    required int id,
    required String url,
    required String name,
    String? scanlator,
  }) = __ChapterEntry;

  /// Returns a chapter model from a chapter entry.
  Chapter toModel() => ChapterUtils.create().copyWith(
        id: id,
        url: url,
        name: name,
        scanlator: Value(scanlator),
      );

  factory _ChapterEntry.fromJson(Map<String, Object?> json) =>
      _$ChapterEntryFromJson(json);
}

/// Class used to save an entry for a manga into preferences.
@freezed
class _MangaEntry with _$MangaEntry {
  const _MangaEntry._();
  const factory _MangaEntry({
    required int id,
    required String url,
    required String title,
    required int source,
  }) = __MangaEntry;

  /// Returns a manga model from a manga entry.
  Manga toModel() => MangaUtils.create().copyWith(
        id: id,
        url: url,
        title: title,
        source: source,
      );

  factory _MangaEntry.fromJson(Map<String, Object?> json) =>
      _$MangaEntryFromJson(json);
}
