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
    when(() => preferenceStore.getInt(any(), defaultValue: any(named: 'defaultValue')))
        .thenReturn(preference);
    releaseService = MockReleaseService();
    getApplicationRelease = GetApplicationRelease(releaseService, preferenceStore);
  });

  test('When has update but is third party expect third party installation', () async{
    when(() => preference.get()).thenReturn(0);
    when(() => preference.set(any())).thenAnswer((_) {});
    when(() => releaseService.latest(any())).thenAnswer(
      (_) => Future<Release>.value(
        Release(
          "v2.0.0",
          "info",
          "http://example.com/release_link",
          <String>["http://example.com/assets"],
        ),
      ),
    );

    var result = getApplicationRelease.await_(
      Arguments(
        isPreview: false,
        isThirdParty: true,
        commitCount: 0,
        versionName: "v1.0.0",
        repository: "test",
      ),
    );

    expect(await result, ThirdPartyInstallation());
  });

  //test('When has update but is preview expect new update', () {
    //every { preference.get() } returns 0
    //every { preference.set(any()) }.answers { }

    //val release = Release(
    //    "r2000",
    //    "info",
    //    "http://example.com/release_link",
    //    listOf("http://example.com/assets"),
    //)

    //coEvery { releaseService.latest(any()) } returns release

    //val result = getApplicationRelease.await(
    //    GetApplicationRelease.Arguments(
    //        isPreview = true,
    //        isThirdParty = false,
    //        commitCount = 1000,
    //        versionName = "",
    //        repository = "test",
    //    ),
    //)

    //(result as GetApplicationRelease.Result.NewUpdate).release shouldBe GetApplicationRelease.Result.NewUpdate(
    //    release,
    //).release
  //});

  //test('When has update expect new update', () {
    //every { preference.get() } returns 0
    //every { preference.set(any()) }.answers { }

    //val release = Release(
    //    "v2.0.0",
    //    "info",
    //    "http://example.com/release_link",
    //    listOf("http://example.com/assets"),
    //)

    //coEvery { releaseService.latest(any()) } returns release

    //val result = getApplicationRelease.await(
    //    GetApplicationRelease.Arguments(
    //        isPreview = false,
    //        isThirdParty = false,
    //        commitCount = 0,
    //        versionName = "v1.0.0",
    //        repository = "test",
    //    ),
    //)

    //(result as GetApplicationRelease.Result.NewUpdate).release shouldBe GetApplicationRelease.Result.NewUpdate(
    //    release,
    //).release
  //});

  //test('When has no update expect no new update', () {
    //every { preference.get() } returns 0
    //every { preference.set(any()) }.answers { }

    //val release = Release(
    //    "v1.0.0",
    //    "info",
    //    "http://example.com/release_link",
    //    listOf("http://example.com/assets"),
    //)

    //coEvery { releaseService.latest(any()) } returns release

    //val result = getApplicationRelease.await(
    //    GetApplicationRelease.Arguments(
    //        isPreview = false,
    //        isThirdParty = false,
    //        commitCount = 0,
    //        versionName = "v2.0.0",
    //        repository = "test",
    //    ),
    //)

    //result shouldBe GetApplicationRelease.Result.NoNewUpdate
  //});

  //test('When now is before three days expect no new update', () {
    //every { preference.get() } returns Instant.now().toEpochMilli()
    //every { preference.set(any()) }.answers { }

    //val release = Release(
    //    "v1.0.0",
    //    "info",
    //    "http://example.com/release_link",
    //    listOf("http://example.com/assets"),
    //)

    //coEvery { releaseService.latest(any()) } returns release

    //val result = getApplicationRelease.await(
    //    GetApplicationRelease.Arguments(
    //        isPreview = false,
    //        isThirdParty = false,
    //        commitCount = 0,
    //        versionName = "v2.0.0",
    //        repository = "test",
    //    ),
    //)

    //coVerify(exactly = 0) { releaseService.latest(any()) }
    //result shouldBe GetApplicationRelease.Result.NoNewUpdate
  //});
}
