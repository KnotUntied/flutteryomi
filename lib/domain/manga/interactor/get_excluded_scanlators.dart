// TODO
// In master but not in latest release, wait and see how it goes
// Uses db handler instead of repo, hmm

import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/data/database.dart';

part 'get_excluded_scanlators.g.dart';

class GetExcludedScanlators {
  final Database db;
  GetExcludedScanlators(this.db);

  Future<Set<String>> await_(int mangaId) async {
    final excludedScanlators = await db.excludedScanlatorsDrift //
        .getExcludedScanlatorsByMangaId(mangaId: mangaId)
        .get();
    return excludedScanlators.toSet();
  }

  Stream<Set<String>> subscribe(int mangaId) => db.excludedScanlatorsDrift
      .getExcludedScanlatorsByMangaId(mangaId: mangaId)
      .watch()
      .map((list) => list.toSet());
}

@riverpod
GetExcludedScanlators getExcludedScanlators(GetExcludedScanlatorsRef ref) =>
    GetExcludedScanlators(ref.watch(databaseProvider));
