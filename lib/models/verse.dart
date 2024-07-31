/// Model representing a verse of the Quran.
class Verse {
  /// The number of the Surah to which the verse belongs.
  final int surahNumber;

  /// The number of the verse within its Surah.
  final int verseNumber;

  /// The text of the verse.
  final String text;

  /// Constructor for creating a Verse object.
  Verse({
    required this.surahNumber,
    required this.verseNumber,
    required this.text,
  });
}
