import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/library/model/library_manga.dart';
import 'package:flutteryomi/domain/source/service/source_manager.dart';
import 'package:flutteryomi/source/api/source_extensions.dart';

part 'library_item.freezed.dart';

@freezed
class LibraryItem with _$LibraryItem {
  const LibraryItem._();
  const factory LibraryItem({
    required LibraryManga libraryManga,
    @Default(-1) int downloadCount,
    @Default(-1) int unreadCount,
    @Default(false) bool isLocal,
    @Default('') String sourceLanguage,
    required SourceManager sourceManager,
  }) = _LibraryItem;

  /// Checks if a query [constraint] matches the manga.
  ///
  /// Returns true if the manga matches the query, false otherwise.
  //bool matches(String constraint) {
    //final sourceName = this
    //    .sourceManager
    //    .getOrStub(libraryManga.manga.source)
    //    .getNameForMangaInfo();
  Future<bool> matches(String constraint) async {
    final source = await this.sourceManager.getOrStub(libraryManga.manga.source);
    final sourceName = source.getNameForMangaInfo();
    return libraryManga.manga.title.containsIgnoreCase(constraint) ||
        (libraryManga.manga.author?.containsIgnoreCase(constraint) ?? false) ||
        (libraryManga.manga.artist?.containsIgnoreCase(constraint) ?? false) ||
        (libraryManga.manga.description?.containsIgnoreCase(constraint) ??
            false) ||
        constraint //
            .split(",")
            .map((it) => it.trim())
            .every(
              (subconstraint) => _checkNegatableConstraint(
                subconstraint,
                (it) =>
                    sourceName.containsIgnoreCase(it) ||
                    (libraryManga.manga.genre?.any(
                          (genre) => genre.toLowerCase() == it.toLowerCase(),
                        ) ??
                        false),
              ),
            );
  }

  /// Checks a [predicate] on a negatable [constraint]. If the constraint starts with a minus character,
  /// the minus is stripped and the result of the predicate is inverted.
  ///
  /// Returns !predicate(x) if constraint = "-x", otherwise predicate(constraint)
  bool _checkNegatableConstraint(
          String constraint, bool Function(String) predicate) =>
      constraint.startsWith("-")
          ? !predicate(
              constraint.substring(constraint.indexOf('-') + 1).trimLeft())
          : predicate(constraint);
}

extension _StringContainsIgnoreCase on String {
  bool containsIgnoreCase(String string) =>
      toLowerCase().contains(string.toLowerCase());
}
