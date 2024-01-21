import 'package:flutteryomi/domain/chapter/service/chapter_recognition.dart';
import 'package:test/test.dart';

void _assertChapter(String mangaTitle, String name, double expected) {
  expect(ChapterRecognition.parseChapterNumber(mangaTitle, name), expected);
}

void main() {
  test('Basic Ch prefix', () {
    const mangaTitle = "Mokushiroku Alice";

    _assertChapter(
        mangaTitle, "Mokushiroku Alice Vol.1 Ch.4: Misrepresentation", 4.0);
  });

  test('Basic Ch prefix with space after period', () {
    const mangaTitle = "Mokushiroku Alice";

    _assertChapter(
        mangaTitle, "Mokushiroku Alice Vol. 1 Ch. 4: Misrepresentation", 4.0);
  });

  test('Basic Ch prefix with decimal', () {
    const mangaTitle = "Mokushiroku Alice";

    _assertChapter(
        mangaTitle, "Mokushiroku Alice Vol.1 Ch.4.1: Misrepresentation", 4.1);
    _assertChapter(
        mangaTitle, "Mokushiroku Alice Vol.1 Ch.4.4: Misrepresentation", 4.4);
  });

  test('Basic Ch prefix with alpha postfix', () {
    const mangaTitle = "Mokushiroku Alice";

    _assertChapter(
        mangaTitle, "Mokushiroku Alice Vol.1 Ch.4.a: Misrepresentation", 4.1);
    _assertChapter(
        mangaTitle, "Mokushiroku Alice Vol.1 Ch.4.b: Misrepresentation", 4.2);
    _assertChapter(mangaTitle,
        "Mokushiroku Alice Vol.1 Ch.4.extra: Misrepresentation", 4.99);
  });

  test('Name containing one number', () {
    const mangaTitle = "Bleach";

    _assertChapter(mangaTitle, "Bleach 567 Down With Snowwhite", 567.0);
  });

  test('Name containing one number and decimal', () {
    const mangaTitle = "Bleach";

    _assertChapter(mangaTitle, "Bleach 567.1 Down With Snowwhite", 567.1);
    _assertChapter(mangaTitle, "Bleach 567.4 Down With Snowwhite", 567.4);
  });

  test('Name containing one number and alpha', () {
    const mangaTitle = "Bleach";

    _assertChapter(mangaTitle, "Bleach 567.a Down With Snowwhite", 567.1);
    _assertChapter(mangaTitle, "Bleach 567.b Down With Snowwhite", 567.2);
    _assertChapter(mangaTitle, "Bleach 567.extra Down With Snowwhite", 567.99);
  });

  test('Chapter containing manga title and number', () {
    const mangaTitle = "Solanin";

    _assertChapter(mangaTitle, "Solanin 028 Vol. 2", 28.0);
  });

  test('Chapter containing manga title and number decimal', () {
    const mangaTitle = "Solanin";

    _assertChapter(mangaTitle, "Solanin 028.1 Vol. 2", 28.1);
    _assertChapter(mangaTitle, "Solanin 028.4 Vol. 2", 28.4);
  });

  test('Chapter containing manga title and number alpha', () {
    const mangaTitle = "Solanin";

    _assertChapter(mangaTitle, "Solanin 028.a Vol. 2", 28.1);
    _assertChapter(mangaTitle, "Solanin 028.b Vol. 2", 28.2);
    _assertChapter(mangaTitle, "Solanin 028.extra Vol. 2", 28.99);
  });

  test('Extreme case', () {
    const mangaTitle = "Onepunch-Man";

    _assertChapter(mangaTitle, "Onepunch-Man Punch Ver002 028", 28.0);
  });

  test('Extreme case with decimal', () {
    const mangaTitle = "Onepunch-Man";

    _assertChapter(mangaTitle, "Onepunch-Man Punch Ver002 028.1", 28.1);
    _assertChapter(mangaTitle, "Onepunch-Man Punch Ver002 028.4", 28.4);
  });

  test('Extreme case with alpha', () {
    const mangaTitle = "Onepunch-Man";

    _assertChapter(mangaTitle, "Onepunch-Man Punch Ver002 028.a", 28.1);
    _assertChapter(mangaTitle, "Onepunch-Man Punch Ver002 028.b", 28.2);
    _assertChapter(mangaTitle, "Onepunch-Man Punch Ver002 028.extra", 28.99);
  });

  test('Chapter containing dot v2', () {
    const mangaTitle = "random";

    _assertChapter(mangaTitle, "Vol.1 Ch.5v.2: Alones", 5.0);
  });

  test('Number in manga title', () {
    const mangaTitle = "Ayame 14";

    _assertChapter(mangaTitle, "Ayame 14 1 - The summer of 14", 1.0);
  });

  test('Space between ch x', () {
    const mangaTitle = "Mokushiroku Alice";

    _assertChapter(
        mangaTitle, "Mokushiroku Alice Vol.1 Ch. 4: Misrepresentation", 4.0);
  });

  test('Chapter title with ch substring', () {
    const mangaTitle = "Ayame 14";

    _assertChapter(
        mangaTitle, "Vol.1 Ch.1: March 25 (First Day Cohabiting)", 1.0);
  });

  test('Chapter containing multiple zeros', () {
    const mangaTitle = "random";

    _assertChapter(mangaTitle, "Vol.001 Ch.003: Kaguya Doesn't Know Much", 3.0);
  });

  test('Chapter with version before number', () {
    const mangaTitle = "Onepunch-Man";

    _assertChapter(mangaTitle,
        "Onepunch-Man Punch Ver002 086 : Creeping Darkness [3]", 86.0);
  });

  test('Version attached to chapter number', () {
    const mangaTitle = "Ansatsu Kyoushitsu";

    _assertChapter(
        mangaTitle, "Ansatsu Kyoushitsu 011v002: Assembly Time", 11.0);
  });

  /// Case where the chapter title contains the chapter
  /// But wait it's not actual the chapter number.

  test('Number after manga title with chapter in chapter title case', () {
    const mangaTitle = "Tokyo ESP";

    _assertChapter(mangaTitle, "Tokyo ESP 027: Part 002: Chapter 001", 027.0);
  });

  test('Unparseable chapter', () {
    const mangaTitle = "random";

    _assertChapter(mangaTitle, "Foo", -1.0);
  });

  test('Chapter with time in title', () {
    const mangaTitle = "random";

    _assertChapter(mangaTitle, "Fairy Tail 404: 00:00", 404.0);
  });

  test('Chapter with alpha without dot', () {
    const mangaTitle = "random";

    _assertChapter(mangaTitle, "Asu No Yoichi 19a", 19.1);
  });

  test('Chapter title containing extra and vol', () {
    const mangaTitle = "Fairy Tail";

    _assertChapter(mangaTitle, "Fairy Tail 404.extravol002", 404.99);
    _assertChapter(mangaTitle, "Fairy Tail 404 extravol002", 404.99);
  });

  test('Chapter title containing omake (japanese extra) and vol', () {
    const mangaTitle = "Fairy Tail";

    _assertChapter(mangaTitle, "Fairy Tail 404.omakevol002", 404.98);
    _assertChapter(mangaTitle, "Fairy Tail 404 omakevol002", 404.98);
  });

  test('Chapter title containing special and vol', () {
    const mangaTitle = "Fairy Tail";

    _assertChapter(mangaTitle, "Fairy Tail 404.specialvol002", 404.97);
    _assertChapter(mangaTitle, "Fairy Tail 404 specialvol002", 404.97);
  });

  test('Chapter title containing commas', () {
    const mangaTitle = "One Piece";

    _assertChapter(mangaTitle, "One Piece 300,a", 300.1);
    _assertChapter(mangaTitle, "One Piece Ch,123,extra", 123.99);
    _assertChapter(
        mangaTitle, "One Piece the sunny, goes swimming 024,005", 24.005);
  });

  test('Chapter title containing hyphens', () {
    const mangaTitle = "Solo Leveling";

    _assertChapter(mangaTitle, "ch 122-a", 122.1);
    _assertChapter(mangaTitle, "Solo Leveling Ch.123-extra", 123.99);
    _assertChapter(mangaTitle, "Solo Leveling, 024-005", 24.005);
    _assertChapter(mangaTitle, "Ch.191-200 Read Online", 191.200);
  });

  test('Chapters containing season', () {
    _assertChapter("D.I.C.E", "D.I.C.E[Season 001] Ep. 007", 7.0);
  });

  test('Chapters in format sx - chapter xx', () {
    _assertChapter("The Gamer", "S3 - Chapter 20", 20.0);
  });

  test('Chapters ending with s', () {
    _assertChapter("One Outs", "One Outs 001", 1.0);
  });

  test('Chapters containing ordinals', () {
    const mangaTitle = "The Sister of the Woods with a Thousand Young";

    _assertChapter(mangaTitle, "The 1st Night", 1.0);
    _assertChapter(mangaTitle, "The 2nd Night", 2.0);
    _assertChapter(mangaTitle, "The 3rd Night", 3.0);
    _assertChapter(mangaTitle, "The 4th Night", 4.0);
  });
}
