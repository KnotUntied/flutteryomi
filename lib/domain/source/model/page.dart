import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';

part 'page.freezed.dart';
part 'page.g.dart';

//TODO
@freezed
class Page with _$Page {
  const Page._();
  const factory Page(
    int index, [
    @Default('') String url,
    String? imageUrl,
  ]) = _Page;

  int get number => index + 1;

  PageState get status => PageState.queue;

  int get progress => 0;

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}

enum PageState {
  queue,
  loadPage,
  downloadImage,
  ready,
  error,
}
