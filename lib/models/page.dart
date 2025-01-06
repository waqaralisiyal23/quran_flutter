import 'page_surah_verses.dart';

/// Model representing a page of the Quran
class QuranPage {
  /// The page number.
  final int number;

  /// The verse number at which the page starts.
  final int start;

  /// The verse number at which the page ends.
  final int end;

  /// The total number of verses in the page.
  final int verseCount;

  /// A map containing the verses of each Surah within the page, where the key
  /// is the Surah number and the value is a JuzSurahVerses object.
  final Map<int, PageSurahVerses> surahVerses;

  QuranPage({
    required this.number,
    required this.start,
    required this.end,
    required this.verseCount,
    required this.surahVerses,
  });
}
