# Flutteryomi

A personal project for learning Flutter. An attempt to port Tachiyomi's UI and functionality to Flutter and its target platforms.

## Running Locally

```sh
flutter run --verbose --fast-start
```

## Localization

See [Tachiyomi's English localization file](https://github.com/tachiyomiorg/tachiyomi/blob/master/i18n/src/main/res/values/strings.xml) for naming and arrangement conventions when adding or editing `.arb` files. The `app_name` key-value pair is not included.

Update localizations by adding or editing the `.arb` files in `lib/l10n`. Then run:

```sh
flutter gen-l10n
```

## Updating Models

See [Drift's official documentation](https://drift.simonbinder.eu/docs/getting-started/).

```sh
dart run build_runner build
```

## Todo

- Folder structure and conventions
- Feature parity with Tachiyomi
- Desktop layout
  - Browser-like tabs (?)
- ~~Conditional Cupertino for iOS~~ Cupertino is not interchangeable with Material