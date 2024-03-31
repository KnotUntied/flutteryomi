import 'dart:collection';

import 'package:dartx/dartx_io.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutteryomi/core/util/system/logger.dart';
import 'package:flutteryomi/domain/source/interactor/get_enabled_sources.dart';
import 'package:flutteryomi/domain/source/interactor/get_remote_manga.dart';
import 'package:flutteryomi/domain/source/interactor/toggle_source.dart';
import 'package:flutteryomi/domain/source/interactor/toggle_source_pin.dart';
import 'package:flutteryomi/domain/source/model/filter_list.dart';
import 'package:flutteryomi/domain/source/model/domain_source.dart';
import 'package:flutteryomi/domain/source/model/filter.dart';
import 'package:flutteryomi/domain/source/model/pin.dart';
import 'package:flutteryomi/presentation/browse/source/sources.dart';

part 'browse_sources_screen_model.freezed.dart';
part 'browse_sources_screen_model.g.dart';

@riverpod
class BrowseSourcesScreenModel extends _$BrowseSourcesScreenModel {
  @override
  Stream<BrowseSourcesScreenState> build() {
//    final getEnabledSources = ref.watch(getEnabledSourcesProvider);
//    final logger = ref.watch(loggerProvider);
//    return getEnabledSources.subscribe().handleError((it) {
//      logger.e(it);
//      //_events.send(Event.FailedFetchingSources)
//    }).asyncMap(_collectLatestSources);
    return const Stream.empty();
  }

//  Future<void> toggleSource(Source source) async {
//    final toggleSourceInteractor = ref.watch(toggleSourceProvider);
//    await toggleSourceInteractor.await_(source);
//  }

//  Future<void> togglePin(Source source) async {
//    final toggleSourcePin = ref.watch(toggleSourcePinProvider);
//    await toggleSourcePin.await_(source);
//  }
}

@freezed
class BrowseSourcesScreenState with _$BrowseSourcesScreenState {
  const BrowseSourcesScreenState._();
  const factory BrowseSourcesScreenState({
    required Listing listing,
    required FilterList filters,
    String? toolbarQuery,
  }) = _BrowseSourcesScreenState;

  bool get isUserQuery => listing is ListingSearch && listing.query.isNotNullOrEmpty;
}

sealed class Listing extends Equatable {
  const Listing({
    this.query,
    required this.filters,
  });

  final String? query;
  final FilterList filters;

  static Listing valueOf(String? query) => switch (query) {
    GetRemoteManga.queryPopular => const ListingPopular(),
    GetRemoteManga.queryLatest => const ListingLatest(),
    _ => ListingSearch(query: query, filters: const []), // filters are filled in later
  };

  @override
  List<Object?> get props => [query, filters];

  @override
  bool get stringify => true;
}

class ListingPopular implements Listing {
  const ListingPopular();

  @override
  String? get query => GetRemoteManga.queryPopular;

  @override
  FilterList get filters => const [];

  @override
  List<Object?> get props => [query, filters];

  @override
  bool get stringify => true;
}

class ListingLatest implements Listing {
  const ListingLatest();

  @override
  String? get query => GetRemoteManga.queryLatest;

  @override
  FilterList get filters => const [];

  @override
  List<Object?> get props => [query, filters];

  @override
  bool get stringify => true;
}

class ListingSearch extends Listing {
  const ListingSearch({
    super.query,
    required super.filters,
  });
}
