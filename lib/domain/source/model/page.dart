import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutteryomi/domain/chapter/model/chapter.dart';
import 'package:flutteryomi/domain/manga/model/manga.dart';

part 'page.freezed.dart';

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

  int get status {
    return 0;
  }

  int get progress {
    return 0;
  }
}

enum PageState {
  queue,
  loadPage,
  downloadImage,
  ready,
  error,
}
