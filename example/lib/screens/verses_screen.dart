import 'package:example/components/surah_data_card.dart';
import 'package:example/components/verse_data_item.dart';
import 'package:flutter/material.dart';
import 'package:quran_flutter/quran_flutter.dart';

enum VerseGrouping {
  surah,
  juz,
  page;
}

class VersesScreen extends StatefulWidget {
  final VerseGrouping verseGrouping;
  final Surah? surah;
  final Juz? juz;
  final QuranPage? page;
  const VersesScreen({
    super.key,
    required this.verseGrouping,
    this.surah,
    this.juz,
    this.page,
  });

  factory VersesScreen.ofSurah(Surah surah) =>
      VersesScreen(verseGrouping: VerseGrouping.surah, surah: surah);

  factory VersesScreen.ofJuz(Juz juz) =>
      VersesScreen(verseGrouping: VerseGrouping.juz, juz: juz);

  factory VersesScreen.ofPage(QuranPage page) =>
      VersesScreen(verseGrouping: VerseGrouping.page, page: page);

  @override
  State<VersesScreen> createState() => _VersesScreenState();
}

class _VersesScreenState extends State<VersesScreen> {
  late VerseGrouping verseGrouping;
  Surah? surah;
  Juz? juz;
  QuranPage? page;
  final List<dynamic> surahVersList = [];
  QuranLanguage translationLanguage = QuranLanguage.english;
  Map<int, Map<int, Verse>> translatedVerses = {};

  @override
  void initState() {
    verseGrouping = widget.verseGrouping;
    surah = widget.surah;
    juz = widget.juz;
    page = widget.page;
    translatedVerses = Quran.getQuranVerses(language: translationLanguage);
    switch (verseGrouping) {
      case VerseGrouping.surah:
        surahVersList.add(widget.surah);
        surahVersList.addAll(Quran.getSurahVersesAsList(widget.surah!.number));
        break;
      case VerseGrouping.juz:
        juz!.surahVerses.forEach((key, value) {
          surahVersList.add(Quran.getSurah(value.surahNumber));
          surahVersList.addAll(value.verses.values);
        });
      case VerseGrouping.page:
        page!.surahVerses.forEach((key, value) {
          surahVersList.add(Quran.getSurah(value.surahNumber));
          surahVersList.addAll(value.verses.values);
        });
    }
    super.initState();
  }

  String getTitle() {
    switch (verseGrouping) {
      case VerseGrouping.surah:
        return surah!.nameEnglish;
      case VerseGrouping.juz:
        return 'Juz ${juz!.number}';
      case VerseGrouping.page:
        return 'Page ${page!.number}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitle()),
        actions: [
          PopupMenuButton<QuranLanguage>(
            onSelected: (QuranLanguage result) {
              setState(() {
                translationLanguage = result;
                translatedVerses =
                    Quran.getQuranVerses(language: translationLanguage);
              });
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<QuranLanguage>>[
              for (QuranLanguage language in QuranLanguage.values)
                PopupMenuItem<QuranLanguage>(
                  value: language,
                  child: Text(language.value),
                ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: surahVersList.length,
        padding: const EdgeInsets.only(bottom: 20),
        itemBuilder: (context, index) {
          dynamic item = surahVersList[index];
          if (item is Surah) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SurahDataCard(surah: item),
                  ),
                  if (item.number != 1 && item.number != 9)
                    const Padding(
                      padding: EdgeInsets.only(top: 28),
                      child: Text(
                        Quran.bismillah,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                ],
              ),
            );
          } else if (item is Verse) {
            return VerseDataItem(
              verse: item,
              translationLanguage: translationLanguage,
              translatedVerses: translatedVerses,
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
