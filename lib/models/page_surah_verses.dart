import 'surah_verses.dart';

/// Model representing verses of a Surah within a Page.
class PageSurahVerses extends SurahVerses {
  PageSurahVerses({
    required super.surahNumber,
    required super.startVerseNumber,
    required super.endVerseNumber,
    required super.verses,
    required super.verseCount,
  });
}
