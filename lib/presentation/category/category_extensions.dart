import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutteryomi/domain/category/model/category.dart';

extension CategoryExtensions on Category {
  String visualName(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return isSystemCategory ? lang.label_default : name;
  }
}
