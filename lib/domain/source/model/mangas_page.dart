import 'package:flutteryomi/domain/source/model/smanga.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mangas_page.freezed.dart';

@freezed
class MangasPage with _$MangasPage {
  factory MangasPage({
    required List<SManga> mangas,
    required bool hasNextPage,
  }) = _MangasPage;
}
