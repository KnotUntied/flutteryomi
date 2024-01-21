import 'package:flutteryomi/core/preference/preference.dart';
import 'package:flutteryomi/core/preference/preference_store.dart';
import 'package:flutteryomi/domain/release/interactor/get_application_release.dart';
import 'package:flutteryomi/domain/release/model/release.dart';
import 'package:flutteryomi/domain/release/service/release_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

late GetApplicationRelease getApplicationRelease;
late ReleaseService releaseService;
late Preference<int> preference;

class MockPreferenceStore extends Mock implements PreferenceStore {}
class MockPreference<T> extends Mock implements Preference<T> {}
class MockReleaseService extends Mock implements ReleaseService {}


void main() {
  setUp(() {
    PreferenceStore preferenceStore = MockPreferenceStore();
    preference = MockPreference<int>();
    when(() => preferenceStore.getInt(any(), any()))
        .thenReturn(preference);
    releaseService = MockReleaseService();
    getApplicationRelease = GetApplicationRelease(releaseService, preferenceStore);
  });

  test('When has update but is third party expect third party installation', () async{
    when(() => preference.get()).thenReturn(0);
    when(() => preference.set(any())).thenAnswer((_) {});
    when(() => releaseService.latest(any())).thenAnswer(
      (_) => Future<Release>.value(
        const Release(
          "v2.0.0",
          "info",
          "http://example.com/release_link",
          <String>["http://example.com/assets"],
        ),
      ),
    );

    final result = await getApplicationRelease.await_(
      Arguments(
        isPreview: false,
        isThirdParty: true,
        commitCount: 0,
        versionName: "v1.0.0",
        repository: "test",
      ),
    );

    expect(result, const Result.thirdPartyInstallation());
  });

  test('When has update but is preview expect new update', () async {
    when(() => preference.get()).thenReturn(0);
    when(() => preference.set(any())).thenAnswer((_) {});

    const release = Release(
      "r2000",
      "info",
      "http://example.com/release_link",
      <String>["http://example.com/assets"],
    );

    when(() => releaseService.latest(any())).thenAnswer(
      (_) => Future<Release>.value(release),
    );

    final result = await getApplicationRelease.await_(
      Arguments(
        isPreview: true,
        isThirdParty: false,
        commitCount: 1000,
        versionName: "",
        repository: "test",
      ),
    );

    expect((result as NewUpdate).release, (const Result.newUpdate(release) as NewUpdate).release);
  });

  test('When has update expect new update', () async {
    when(() => preference.get()).thenReturn(0);
    when(() => preference.set(any())).thenAnswer((_) {});

    const release = Release(
      "v2.0.0",
      "info",
      "http://example.com/release_link",
      <String>["http://example.com/assets"],
    );

    when(() => releaseService.latest(any())).thenAnswer(
      (_) => Future<Release>.value(release),
    );

    final result = await getApplicationRelease.await_(
      Arguments(
        isPreview: false,
        isThirdParty: false,
        commitCount: 0,
        versionName: "v1.0.0",
        repository: "test",
      ),
    );

    expect((result as NewUpdate).release, (const Result.newUpdate(release) as NewUpdate).release);
  });

  test('When has no update expect no new update', () async {
    when(() => preference.get()).thenReturn(0);
    when(() => preference.set(any())).thenAnswer((_) {});

    const release = Release(
      "v1.0.0",
      "info",
      "http://example.com/release_link",
      <String>["http://example.com/assets"],
    );

    when(() => releaseService.latest(any())).thenAnswer(
      (_) => Future<Release>.value(release),
    );

    final result = await getApplicationRelease.await_(
      Arguments(
        isPreview: false,
        isThirdParty: false,
        commitCount: 0,
        versionName: "v2.0.0",
        repository: "test",
      ),
    );

    expect(result, const Result.noNewUpdate());
  });

  test('When now is before three days expect no new update', () async {
    when(() => preference.get()).thenReturn(DateTime.now().millisecondsSinceEpoch);
    when(() => preference.set(any())).thenAnswer((_) {});

    const release = Release(
      "v1.0.0",
      "info",
      "http://example.com/release_link",
      <String>["http://example.com/assets"],
    );

    when(() => releaseService.latest(any())).thenAnswer(
      (_) => Future<Release>.value(release),
    );

    final result = await getApplicationRelease.await_(
      Arguments(
        isPreview: false,
        isThirdParty: false,
        commitCount: 0,
        versionName: "v2.0.0",
        repository: "test",
      ),
    );

    verifyNever(() => releaseService.latest(any()));
    expect(result, const Result.noNewUpdate());
  });
}
