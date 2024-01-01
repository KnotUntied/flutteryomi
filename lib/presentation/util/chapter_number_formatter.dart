import 'package:intl/intl.dart';

final _formatter = NumberFormat('#.###', 'en_US');

String formatChapterNumber(double chapterNumber) => _formatter.format(chapterNumber);