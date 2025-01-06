import 'verse.dart';

abstract class SurahVerses {
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

  /// Constructor for creating a SurahVerses object.
  SurahVerses({
    required this.surahNumber,
    required this.startVerseNumber,
    required this.endVerseNumber,
    required this.verses,
    required this.verseCount,
  });
}
