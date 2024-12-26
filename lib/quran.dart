import 'package:quran_flutter/enums/surah_type.dart';

import 'enums/quran_language.dart';
import 'models/juz.dart';
import 'models/juz_surah_verses.dart';
import 'models/page.dart';
import 'models/page_surah_verses.dart';
import 'models/surah.dart';
import 'models/verse.dart';
import 'utils/asset_loader.dart';
import 'utils/meta_data_loader.dart';

/// The `Quran` class provides methods to access Quranic data and translations.
class Quran {
  static late final Map<int, Surah> _surahMap;
  static late final List<Surah> _surahList;
  static late final Map<int, Map<int, Verse>> _quranVerses;
  static late final List<Map<int, Map<int, Verse>>> _translatedQuranVerses;
  static late final Map<int, Juz> _juzMap;
  static late final List<Juz> _juzList;
  static late final Map<int, QuranPage> _pageMap;
  static late final List<QuranPage> _pageList;

  /// The Bismillah phrase.
  static const String bismillah = 'بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ';

  /// Total number of surahs in the Quran.
  static const int surahCount = 114;

  /// Total number of Makki surahs in the Quran.
  static const makkiSurahCount = 86;

  /// Total number of Madani surahs in the Quran.
  static const madaniSurahCount = 28;

  /// Total number of verses in the Quran.
  static const int verseCount = 6236;

  /// Total number of juz in the Quran.
  static const int juzCount = 30;

  /// Total number of pages in the Quran.
  static const int pageCount = 604;

  /// Initializes the Quranic data and translations.
  ///
  /// This method loads the Quranic text and translations from the assets.
  static Future<void> initialize() async {
    _surahMap = MetaDataLoader.loadSurah();
    _surahList = _surahMap.values.toList();
    _quranVerses = await AssetLoader.loadQuranText();
    _translatedQuranVerses = await AssetLoader.loadTranslatedQuranText();
    _juzMap = MetaDataLoader.loadJuz();
    _juzList = _juzMap.values.toList();
    _pageMap = MetaDataLoader.loadPages();
    _pageList = _pageMap.values.toList();
  }

  /// Retrieves the Quranic verses in the specified language.
  static Map<int, Map<int, Verse>> getQuranVerses({QuranLanguage? language}) {
    if (language == null) {
      return _quranVerses;
    } else {
      return _translatedQuranVerses[language.index];
    }
  }

  /// Retrieves the map of all surahs.
  static Map<int, Surah> getSurahAsMap() => _surahMap;

  /// Retrieves the list of all surahs.
  static List<Surah> getSurahAsList() => _surahList;

  /// Retrieves a [Surah] object by its number.
  ///
  /// Throws an [AssertionError] if the surah number is not between 1 and 114.
  static Surah getSurah(int surahNumber) {
    _validateSurahNumberArgument(surahNumber);
    return _surahMap[surahNumber]!;
  }

  /// Retrieves all the verses of a surah as a map.
  static Map<int, Verse> getSurahVersesAsMap(int surahNumber,
      {QuranLanguage? language}) {
    _validateSurahNumberArgument(surahNumber);
    return getQuranVerses(language: language)[surahNumber]!;
  }

  /// Retrieves all the verses of a surah as a list.
  static List<Verse> getSurahVersesAsList(int surahNumber,
      {QuranLanguage? language}) {
    _validateSurahNumberArgument(surahNumber);
    return getQuranVerses(language: language)[surahNumber]!.values.toList();
  }

  /// Retrieves the name of a surah by its number.
  static String getSurahName(int surahNumber) {
    _validateSurahNumberArgument(surahNumber);
    return _surahMap[surahNumber]!.name;
  }

  /// Retrieves the English name of a surah by its number.
  static String getSurahNameEnglish(int surahNumber) {
    _validateSurahNumberArgument(surahNumber);
    return _surahMap[surahNumber]!.nameEnglish;
  }

  /// Retrieves the total number of verses in a surah.
  static int getTotalVersesInSurah(int surahNumber) {
    _validateSurahNumberArgument(surahNumber);
    return _surahMap[surahNumber]!.verseCount;
  }

  /// Retrieves the revelation order of a surah.
  static int getRevealationOrderInSurah(int surahNumber) {
    _validateSurahNumberArgument(surahNumber);
    return _surahMap[surahNumber]!.revealationOrder;
  }

  /// Retrieves the number of rukus in a surah.
  static int getRukusInSurah(int surahNumber) {
    _validateSurahNumberArgument(surahNumber);
    return _surahMap[surahNumber]!.rukus;
  }

  /// Retrieves the type of a surah (Makki or Madani).
  static SurahType getSurahType(int surahNumber) {
    _validateSurahNumberArgument(surahNumber);
    return _surahMap[surahNumber]!.type;
  }

  /// Returns true if the surah is a Makki surah.
  static bool isMakkiSurah(int surahNumber) {
    _validateSurahNumberArgument(surahNumber);
    return _surahMap[surahNumber]!.type == SurahType.meccan;
  }

  /// Returns true if the surah is a Madani surah.
  static bool isMadaniSurah(int surahNumber) {
    _validateSurahNumberArgument(surahNumber);
    return _surahMap[surahNumber]!.type == SurahType.medinan;
  }

  /// Retrieves a [Verse] object by its surah and verse numbers.
  ///
  /// Throws an [AssertionError] if the surah number is not between 1 and 114.
  /// Throws an [AssertionError] if the verse number is not valid for the given surah.
  static Verse getVerse({
    required int surahNumber,
    required int verseNumber,
    QuranLanguage? language,
  }) {
    _validateSurahNumberAndVerseNumberArgument(
      surahNumber: surahNumber,
      verseNumber: verseNumber,
    );
    return getQuranVerses(language: language)[surahNumber]![verseNumber]!;
  }

  /// Retrieves the map of all juz.
  static Map<int, Juz> getJuzAsMap() => _juzMap;

  /// Retrieves the list of all juz.
  static List<Juz> getJuzAsList() => _juzList;

  /// Retrieves the map of all pages.
  static Map<int, QuranPage> getPageAsMap() => _pageMap;

  /// Retrieves the list of all pages.
  static List<QuranPage> getPageAsList() => _pageList;

  /// Retrieves the total number of verses in a juz.
  static int getTotalVersesInJuz(int juzNumber) {
    _validateJuzNumberArgument(juzNumber);
    return _juzMap[juzNumber]!.verseCount;
  }

  /// Retrieves the surah verses in a juz as a map.
  static Map<int, JuzSurahVerses> getSurahVersesInJuzAsMap(int juzNumber) {
    _validateJuzNumberArgument(juzNumber);
    return _juzMap[juzNumber]!.surahVerses;
  }

  /// Retrieves the surah verses in a juz as a list.
  static List<JuzSurahVerses> getSurahVersesInJuzAsList(int juzNumber) {
    _validateJuzNumberArgument(juzNumber);
    return _juzMap[juzNumber]!.surahVerses.values.toList();
  }

  /// Retrieves the surah verses in a page as a map.
  static Map<int, PageSurahVerses> getSurahVersesInPageAsMap(int pageNumber) {
    _validatePageNumberArgument(pageNumber);
    return _pageMap[pageNumber]!.surahVerses;
  }

  /// Retrieves the surah verses in a page as a list.
  static List<PageSurahVerses> getSurahVersesInPageAsList(int pageNumber) {
    _validatePageNumberArgument(pageNumber);
    return _pageMap[pageNumber]!.surahVerses.values.toList();
  }

  /// Retrieves the total number of verses of a surah in a specific juz.
  ///
  /// Throws an [ArgumentError] if the surah is not in the specified juz.
  static int getTotalVersesOfSurahInJuz({
    required int surahNumber,
    required int juzNumber,
  }) {
    _validateSurahNumberArgument(surahNumber);
    _validateJuzNumberArgument(juzNumber);
    Juz juz = _juzMap[juzNumber]!;
    if (juz.surahVerses.containsKey(surahNumber) == false) {
      throw ArgumentError('Surah $surahNumber is not in Juz $juzNumber');
    }
    return juz.surahVerses[surahNumber]!.verseCount;
  }

  /// Retrieves the juz number that contains the specified surah and verse.
  static int getJuzNumber({
    required int surahNumber,
    required int verseNumber,
  }) {
    _validateSurahNumberAndVerseNumberArgument(
      surahNumber: surahNumber,
      verseNumber: verseNumber,
    );
    late int juzNumber;
    _juzMap.forEach((key, value) {
      if (value.surahVerses.containsKey(surahNumber)) {
        if (verseNumber >= value.surahVerses[surahNumber]!.startVerseNumber &&
            verseNumber <= value.surahVerses[surahNumber]!.endVerseNumber) {
          juzNumber = key;
        }
      }
    });
    return juzNumber;
  }

  /// Validates the surah number argument.
  static void _validateSurahNumberArgument(int surahNumber) {
    assert(
      surahNumber >= 1 && surahNumber <= surahCount,
      'Surah number must be between 1 and 114',
    );
    if (surahNumber < 1 || surahNumber > surahCount) {
      throw ArgumentError('Surah number must be between 1 and 114');
    }
  }

  /// Validates the surah and verse number arguments.
  static void _validateSurahNumberAndVerseNumberArgument({
    required int surahNumber,
    required int verseNumber,
  }) {
    int totalVersesInSurah = getTotalVersesInSurah(surahNumber);
    assert(
      verseNumber >= 1 && verseNumber <= totalVersesInSurah,
      'Verse number must be between 1 and $totalVersesInSurah for '
      'Surah $surahNumber',
    );
    if (verseNumber < 1 || verseNumber > totalVersesInSurah) {
      throw ArgumentError(
          'Verse number must be between 1 and $totalVersesInSurah for '
          'Surah $surahNumber');
    }
  }

  /// Validates the juz number argument.
  static void _validateJuzNumberArgument(int juzNumber) {
    assert(
      juzNumber >= 1 && juzNumber <= juzCount,
      'Juz number must be between 1 and 30',
    );
    if (juzNumber < 1 || juzNumber > juzCount) {
      throw ArgumentError('Juz number must be between 1 and 30');
    }
  }

  /// Validates the page number argument.
  static void _validatePageNumberArgument(int pageNumber) {
    assert(
      pageNumber >= 1 && pageNumber <= pageCount,
      'Juz number must be between 1 and 604',
    );
    if (pageNumber < 1 || pageNumber > pageCount) {
      throw ArgumentError('Juz number must be between 1 and 604');
    }
  }
}
