import 'package:flutteryomi/domain/chapter/model/chapter.dart';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutteryomi/domain/reader/model/reader_page.dart';

part 'reader_chapter.freezed.dart';

//TODO
// ignore: must_be_immutable
class ReaderChapter extends Equatable {
  ReaderChapter(this.chapter);

  final Chapter chapter;

  final _stateStream = BehaviorSubject.seeded(const ReaderChapterStateWait());

  late final stateStream = _stateStream.stream;
  ReaderChapterState get state => _stateStream.value;
  set state(value) => _stateStream.add(value);

  List<ReaderPage>? get pages => (state as ReaderChapterStateLoaded?)?.pages;

  //PageLoader? pageLoader;

  int requestedPage = 0;

  int _references = 0;

  void ref() => _references++;

  void unref() {
    _references--;
    if (_references == 0) {
      //if (pageLoader != null) {
      //  logger.i("Recycling chapter ${chapter.name}");
      //}
      //pageLoader?.recycle();
      //pageLoader = null;
      state = const ReaderChapterStateWait();
    }
  }

  @override
  List<Object?> get props => [chapter];

  @override
  bool get stringify => true;
}

@freezed
sealed class ReaderChapterState with _$ReaderChapterState {
  const factory ReaderChapterState.wait() = ReaderChapterStateWait;
  const factory ReaderChapterState.loading() = ReaderChapterStateLoading;
  const factory ReaderChapterState.error(Exception error) = ReaderChapterStateError;
  const factory ReaderChapterState.loaded(List<ReaderPage> pages) = ReaderChapterStateLoaded;
}
