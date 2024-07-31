import 'package:flutter/services.dart' show rootBundle;
import 'package:quran_flutter/enums/quran_language.dart';
import 'package:quran_flutter/models/verse.dart';
import 'package:quran_flutter/quran.dart';

/// A class responsible for loading assets and parsing Quran text files.
class AssetLoader {
  /// Loads an asset file from the given [path].
  static Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  /// Loads the Quran text from the asset file based on the specified [quranLanguage].
  /// Returns a map containing the verses of each Surah, where the key is the Surah number
  /// and the value is another map containing the verses of that Surah, where the key is
  /// the verse number and the value is a Verse object.
  static Future<Map<int, Map<int, Verse>>> loadQuranText({
    QuranLanguage? quranLanguage,
  }) async {
    // Determine the file path based on the provided Quran language.
    String fileContent = await loadAsset(quranLanguage == null
        ? 'packages/quran_flutter/assets/quran.txt'
        : 'packages/quran_flutter/assets/translations/'
            '${quranLanguage.value.toLowerCase()}.txt');

    // Split the file content into individual lines.
    List<String> lines = fileContent.split('\n');

    // Initialize a map to store the Quran text.
    Map<int, Map<int, Verse>> quranText = {};

    // Iterate through each line of the file.
    for (String line in lines) {
      // Split each line into parts: surah number, verse number, and verse text.
      List<String> parts = line.split('|');
      int surahNumber = int.parse(parts[0]);
      int verseNumber = int.parse(parts[1]);
      String verseText = parts[2];

      // Check if the surah already exists in the map.
      if (quranText.containsKey(surahNumber)) {
        // If the surah exists, add the verse to the existing map.
        quranText[surahNumber]![verseNumber] = Verse(
          surahNumber: surahNumber,
          verseNumber: verseNumber,
          text: verseText,
        );
      } else {
        // If the surah does not exist, create a new map for the surah and add the verse.
        quranText[surahNumber] = {
          verseNumber: Verse(
            surahNumber: surahNumber,
            verseNumber: verseNumber,
            // Remove the Bismillah from the verse text if it's not the first
            // verse of Surah Al-Fatiha.
            text: surahNumber == 1
                ? verseText
                : verseText.replaceFirst(
                    Quran.bismillah,
                    '',
                  ),
          )
        };
      }
    }

    return quranText;
  }

  /// Loads the Quran text translations from asset files for all supported languages.
  /// This method performs concurrent asynchronous operations to load the Quran text.
  static Future<List<Map<int, Map<int, Verse>>>>
      loadTranslatedQuranText() async {
    List<Future<Map<int, Map<int, Verse>>>> futures = [];

    for (QuranLanguage language in QuranLanguage.values) {
      futures.add(loadQuranText(quranLanguage: language));
    }

    List<Map<int, Map<int, Verse>>> translatedQuranText =
        await Future.wait(futures);

    return translatedQuranText;
  }
}
