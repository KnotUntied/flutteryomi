import 'package:riverpod/riverpod.dart';

import 'package:flutteryomi/domain/source/model/filter.dart';
import 'package:flutteryomi/l10n/l10n.dart';

sealed class OrderBy extends FilterSort {
  final Ref ref;
  final FilterSortSelection selection;

  OrderBy(this.ref, this.selection)
      : super(
          ref.read(appLocalizationsProvider).local_filter_order_by,
          [
            ref.read(appLocalizationsProvider).title,
            ref.read(appLocalizationsProvider).date,
          ],
          selection,
        );
}

class OrderByPopular extends OrderBy {
  OrderByPopular(Ref ref)
      : super(ref, const FilterSortSelection(index: 0, ascending: true));
}

class OrderByLatest extends OrderBy {
  OrderByLatest(Ref ref)
      : super(ref, const FilterSortSelection(index: 1, ascending: false));
}
