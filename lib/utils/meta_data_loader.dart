import 'package:quran_flutter/data/quran_meta_data.dart';
import 'package:quran_flutter/enums/surah_type.dart';

import '../models/juz.dart';
import '../models/juz_surah_verses.dart';
import '../models/page.dart';
import '../models/page_surah_verses.dart';
import '../models/surah.dart';
import '../models/verse.dart';
import '../quran.dart';

/// A class responsible for loading and parsing metadata for Surahs and Juz from the Quran.
class MetaDataLoader {
  /// Loads the metadata for all Surahs from [QuranMetaData] and returns a
  /// map of Surah objects.
  static Map<int, Surah> loadSurah() {
    Map<int, Surah> surah = {};

    QuranMetaData.surahMeta.forEach((key, value) {
      surah[int.parse(key)] = Surah(
        start: value['start'],
        end: value['end'],
        verseCount: value['ayas'],
        revealationOrder: value['revelationOrder'],
        rukus: value['rukus'],
        number: int.parse(key),
        name: value['name'],
        nameEnglish: value['tname'],
        meaning: value['ename'],
        type: SurahType.fromString(value['type']),
      );
    });

    return surah;
  }

  /// Loads the metadata for all Juz from [QuranMetaData] and returns a map of
  /// Juz objects.
  static Map<int, Juz> loadJuz() {
    Map<int, Juz> juz = {};

    QuranMetaData.juzMeta.forEach((key, value) {
      Map<int, JuzSurahVerses> surahVerses = {};
      (value['surahVerses'] as Map<int, List<int>>).forEach((key, value) {
        int startVerseNumber = value[0];
        int endVerseNumber = value[1];
        Map<int, Verse> allVersesInSurah = Quran.getSurahVersesAsMap(key);
        Map<int, Verse> presentVersesOfSurah = {};
        for (int i = startVerseNumber; i <= endVerseNumber; i++) {
          presentVersesOfSurah[i] = allVersesInSurah[i]!;
        }
        surahVerses[key] = JuzSurahVerses(
          surahNumber: key,
          startVerseNumber: startVerseNumber,
          endVerseNumber: endVerseNumber,
          verses: presentVersesOfSurah,
          verseCount: presentVersesOfSurah.length,
        );
      });
      juz[int.parse(key)] = Juz(
        number: int.parse(key),
        start: value['start'],
        end: value['end'],
        verseCount: value['end'] - (value['start'] - 1),
        surahVerses: surahVerses,
      );
    });

    return juz;
  }

  /// Loads the metadata for all pages from [QuranMetaData] and returns a map of
  /// QuranPage objects.
  static Map<int, QuranPage> loadPages() {
    Map<int, QuranPage> pages = {};
    QuranMetaData.pageMeta.forEach((key, value) {
      Map<int, PageSurahVerses> surahVerses = {};
      (value['surahVerses'] as Map<int, List<int>>).forEach((key, value) {
        int startVerseNumber = value[0];
        int endVerseNumber = value[1];
        Map<int, Verse> allVersesInSurah = Quran.getSurahVersesAsMap(key);
        Map<int, Verse> presentVersesOfSurah = {};
        for (int i = startVerseNumber; i <= endVerseNumber; i++) {
          presentVersesOfSurah[i] = allVersesInSurah[i]!;
        }
        surahVerses[key] = PageSurahVerses(
          surahNumber: key,
          startVerseNumber: startVerseNumber,
          endVerseNumber: endVerseNumber,
          verses: presentVersesOfSurah,
          verseCount: presentVersesOfSurah.length,
        );
      });
      pages[int.parse(key)] = QuranPage(
        number: int.parse(key),
        start: value['start'],
        end: value['end'],
        verseCount: value['end'] - (value['start'] - 1),
        surahVerses: surahVerses,
      );
    });
    return pages;
  }
}
