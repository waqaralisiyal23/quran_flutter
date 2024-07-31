import 'package:quran_flutter/models/juz_surah_verses.dart';

/// Model representing a Juz (part) of the Quran.
class Juz {
  /// The number of the Juz.
  final int number;

  /// The verse number at which the Juz starts.
  final int start;

  /// The verse number at which the Juz ends.
  final int end;

  /// The total number of verses in the Juz.
  final int verseCount;

  /// A map containing the verses of each Surah within the Juz, where the key
  /// is the Surah number and the value is a JuzSurahVerses object.
  final Map<int, JuzSurahVerses> surahVerses;

  /// Constructor for creating a Juz object.
  Juz({
    required this.number,
    required this.start,
    required this.end,
    required this.verseCount,
    required this.surahVerses,
  });
}
