/// Enum representing the language of the Quran.
enum QuranLanguage {
  albanian('Albanian'),
  amazigh('Amazigh'),
  amharic('Amharic'),
  azerbaijani('Azerbaijani'),
  bengali('Bengali'),
  bosnian('Bosnian'),
  bulgarian('Bulgarian'),
  chinese('Chinese'),
  czech('Czech'),
  divehi('Divehi'),
  dutch('Dutch'),
  english('English'),
  french('French'),
  german('German'),
  hausa('Hausa'),
  hindi('Hindi'),
  indonesian('Indonesian'),
  italian('Italian'),
  japanese('Japanese'),
  korean('Korean'),
  kurdish('Kurdish'),
  malay('Malay'),
  malayalam('Malayalam'),
  norwegian('Norwegian'),
  pashto('Pashto'),
  persian('Persian'),
  polish('Polish'),
  portuguese('Portuguese'),
  romanian('Romanian'),
  russian('Russian'),
  sindhi('Sindhi'),
  somali('Somali'),
  spanish('Spanish'),
  swahili('Swahili'),
  swedish('Swedish'),
  tajik('Tajik'),
  tamil('Tamil'),
  tatar('Tatar'),
  thai('Thai'),
  turkish('Turkish'),
  urdu('Urdu'),
  uyghur('Uyghur'),
  uzbek('Uzbek');

  final String value;
  const QuranLanguage(this.value);

  bool get isRTL {
    switch (this) {
      case QuranLanguage.bengali:
      case QuranLanguage.divehi:
      case QuranLanguage.kurdish:
      case QuranLanguage.pashto:
      case QuranLanguage.persian:
      case QuranLanguage.sindhi:
      case QuranLanguage.urdu:
      case QuranLanguage.uyghur:
        return true;
      default:
        return false;
    }
  }
}
