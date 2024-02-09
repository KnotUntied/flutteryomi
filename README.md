# Flutteryomi

*I can't believe it's not [Tachiyomi/Mihon](https://mihon.app/)!*

*Well, close enough.*

A personal project for learning Flutter. An attempt to port the now-defunct Tachiyomi's UI and (some) functionality to Flutter and its target platforms.

## Running Locally

```sh
flutter run --verbose --fast-start
```

## Localization

See [Mihon's English localization file](https://github.com/mihonapp/mihon/blob/main/i18n/src/commonMain/resources/MR/base/strings.xml) for naming and arrangement conventions when adding or editing `.arb` files. The `app_name` key-value pair is not included.

Update localizations by adding or editing the `.arb` files in `lib/l10n`. Then run:

```sh
flutter gen-l10n
```

## Code Generation

Required when updating Riverpod providers, database models, etc.

See [Drift's official documentation](https://drift.simonbinder.eu/docs/getting-started/) regarding the SQLite database.

```sh
dart run build_runner build
```

## Updating Custom Icons

Configure generator using `icon_font.yaml`.

See [`icon_font_generator`](https://github.com/ScerIO/icon_font_generator) for more information.

```sh
dart run icon_font_generator:generator
```

## Migrations

```sh
dart run drift_dev schema dump lib/data/database.dart lib/data/drift/migrations/
```

## Todo

- [ ] License (esp. wrt. existing Tachiyomi license and permissions)
- [ ] Replace `toList()` with [`cached`](https://pub.dev/documentation/dartx_nullsafety/latest/dartx/IterableX/cached.html), hmm?
- [ ] Better downloader
  - Consider https://pub.dev/packages/flutter_downloader
- [ ] Feature parity with Tachiyomi/Mihon
- [ ] Platform-adaptive interface, i.e., using `CupertinoApp` alongside `MaterialApp`
- [ ] XML to ARB for localization
- [ ] Dart-specific optimizations and naming conventions
