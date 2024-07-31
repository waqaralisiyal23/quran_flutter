import 'package:quran_flutter/enums/surah_type.dart';

/// Model representing a Surah (chapter) of the Quran.
class Surah {
  /// The verse number at which the Surah starts.
  final int start;

  /// The verse number at which the Surah ends.
  final int end;

  /// The total number of verses in the Surah.
  final int verseCount;

  /// The order of revelation of the Surah.
  final int revealationOrder;

  /// The number of rukus (sections) in the Surah.
  final int rukus;

  /// The number of the Surah.
  final int number;

  /// The name of the Surah in Arabic.
  final String name;

  /// The name of the Surah in English.
  final String nameEnglish;

  /// The meaning or translation of the Surah name.
  final String meaning;

  /// The type of the Surah (Meccan or Medinan).
  final SurahType type;

  /// Constructor for creating a Surah object.
  Surah({
    required this.start,
    required this.end,
    required this.verseCount,
    required this.revealationOrder,
    required this.rukus,
    required this.number,
    required this.name,
    required this.nameEnglish,
    required this.meaning,
    required this.type,
  });
}
