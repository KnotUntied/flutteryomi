import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/source/model/filter.dart';

sealed class OrderBy extends FilterSort {
  final BuildContext context;
  final FilterSortSelection selection;

  // bruh
  OrderBy(this.context, this.selection)
      : super(
          AppLocalizations.of(context).local_filter_order_by,
          [
            AppLocalizations.of(context).title,
            AppLocalizations.of(context).date,
          ],
          selection,
        );
}

class OrderByPopular extends OrderBy {
  OrderByPopular(BuildContext context)
      : super(context, const FilterSortSelection(index: 0, ascending: true));
}

class OrderByLatest extends OrderBy {
  OrderByLatest(BuildContext context)
      : super(context, const FilterSortSelection(index: 1, ascending: false));
}
