// TODO
// In master but not in latest release, wait and see how it goes
// Uses db handler instead of repo, hmm

import 'dart:async';

import 'package:drift/drift.dart';

import 'package:flutteryomi/data/database.dart';
import 'package:flutteryomi/data/drift/data/excluded_scanlators.drift.dart';

class SetExcludedScanlators {
  final Database db;
  SetExcludedScanlators(this.db);

  Future<void> await_(int mangaId, Set<String> excludedScanlators) async {
    db.transaction(() async {
      final query = await db.excludedScanlatorsDrift //
          .getExcludedScanlatorsByMangaId(mangaId: mangaId)
          .get();
      final currentExcluded = query.toSet();
      final toAdd = excludedScanlators.difference(currentExcluded);
      for (final scanlator in toAdd) {
        await db //
            .into(db.excludedScanlators)
            .insert(ExcludedScanlatorsCompanion(
              mangaId: Value(mangaId),
              scanlator: Value(scanlator),
            ));
      }
      final toRemove = currentExcluded.difference(excludedScanlators);
      await (db.delete(db.excludedScanlators)
            ..where(
              (s) => s.mangaId.equals(mangaId) & s.scanlator.isIn(toRemove),
            ))
          .go();
    });
  }
}
