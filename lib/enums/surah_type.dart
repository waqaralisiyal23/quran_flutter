/// Enum representing the type of Surahs in the Quran.
enum SurahType {
  meccan('Meccan'),
  medinan('Medinan');

  final String value;
  const SurahType(this.value);

  static SurahType fromString(String value) {
    return values.firstWhere((e) => e.value == value);
  }
}
