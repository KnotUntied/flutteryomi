# Flutteryomi

*I can't believe it's not [Mihon](https://mihon.app/)!*

*Well, close enough.*

A personal project for learning Flutter. An attempt to port Mihon's UI and (some) functionality to Flutter and its target platforms.

## Running Locally

```sh
flutter run --verbose --fast-start
```

## Localization

See [Mihon's English localization file](https://github.com/mihonapp/mihon/blob/main/i18n/src/commonMain/resources/MR/base/strings.xml) for naming and arrangement conventions when adding or editing `.arb` files. The `app_name` key-value pair is not included.

Update localizations by adding or editing the `.arb` files in `lib/l10n`. Then run:

```sh
dart run slang
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

- [ ] Better structure for sources (bruh) (probably move from `source/api/` and `source/local/` to `domain/source/api` and `domain/source/local`, respectively)
- [ ] License (esp. wrt. existing Tachiyomi license and permissions)
- [ ] Replace `toList()` with [`cached`](https://pub.dev/documentation/dartx_nullsafety/latest/dartx/IterableX/cached.html) (beware of memory tradeoffs)
- [ ] ~~Replace some stream maps with 'mapLatest' implementations (see https://stackoverflow.com/q/73932539)~~
- [ ] Better downloader
  - Consider https://pub.dev/packages/flutter_downloader
- [ ] Feature parity with Tachiyomi/Mihon
- [ ] Platform-adaptive UI, i.e., using `CupertinoApp` alongside `MaterialApp`
  - [ ] Use [OrientationBuilder](https://docs.flutter.dev/cookbook/design/orientation) for some screens
- [ ] XML to ARB for localization (tools exist but aren't bespoke)
- [ ] Dart-specific optimizations and naming conventions
