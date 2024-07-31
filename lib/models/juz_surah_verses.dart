import 'package:quran_flutter/models/verse.dart';

/// Model representing verses of a Surah within a Juz.
class JuzSurahVerses {
  /// The number of the Surah.
  final int surahNumber;

  /// The verse number at which the Surah starts in the Juz.
  final int startVerseNumber;

  /// The verse number at which the Surah ends in the Juz.
  final int endVerseNumber;

  /// A map containing the verses of the Surah, where the key is the verse number
  /// and the value is the Verse object.
  final Map<int, Verse> verses;

  /// The total number of verses in the Surah.
  final int verseCount;

  /// Constructor for creating a JuzSurahVerses object.
  JuzSurahVerses({
    required this.surahNumber,
    required this.startVerseNumber,
    required this.endVerseNumber,
    required this.verses,
    required this.verseCount,
  });
}
