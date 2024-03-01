import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:equatable/equatable.dart';
import 'package:flutteryomi/core/network/progress_listener.dart';
import 'package:rxdart/rxdart.dart';

part 'page.g.dart';

@JsonSerializable()
class Page extends Equatable implements ProgressListener {
  Page(
    this.index, [
    this.url = '',
    this.imageUrl,
  ]);

  final int index;
  final String url;
  final String? imageUrl;

  int get number => index + 1;

  final _statusStream = BehaviorSubject.seeded(PageState.queue);

  late final statusStream = _statusStream.stream;
  PageState get status => _statusStream.value;
  set status(value) => _statusStream.add(value);

  final _progressStream = BehaviorSubject.seeded(0);

  ValueStream<int> get progressStream => _progressStream.stream;
  int get progress => _progressStream.value;
  set progress(value) => _progressStream.add(value);

  @override
  void update(int bytesRead, int contentLength, bool done) {
    progress = contentLength > 0
        ? 100 * bytesRead ~/ contentLength
        : -1;
  }

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
  Map<String, dynamic> toJson() => _$PageToJson(this);

  @override
  List<Object?> get props => [index, url, imageUrl];
}

enum PageState {
  queue,
  loadPage,
  downloadImage,
  ready,
  error,
}
