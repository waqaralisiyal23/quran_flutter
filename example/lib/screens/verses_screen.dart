import 'package:example/components/surah_data_card.dart';
import 'package:example/components/verse_data_item.dart';
import 'package:flutter/material.dart';
import 'package:quran_flutter/quran_flutter.dart';

class VersesScreen extends StatefulWidget {
  final bool isSurah;
  final Surah? surah;
  final Juz? juz;
  const VersesScreen({
    super.key,
    required this.isSurah,
    this.surah,
    this.juz,
  });

  @override
  State<VersesScreen> createState() => _VersesScreenState();
}

class _VersesScreenState extends State<VersesScreen> {
  late bool isSurah;
  Surah? surah;
  Juz? juz;
  final List<dynamic> surahVersList = [];
  QuranLanguage translationLanguage = QuranLanguage.english;
  Map<int, Map<int, Verse>> translatedVerses = {};

  @override
  void initState() {
    isSurah = widget.isSurah;
    surah = widget.surah;
    juz = widget.juz;
    translatedVerses = Quran.getQuranVerses(language: translationLanguage);
    if (isSurah) {
      surahVersList.add(widget.surah);
      surahVersList.addAll(Quran.getSurahVersesAsList(widget.surah!.number));
    } else {
      juz!.surahVerses.forEach((key, value) {
        surahVersList.add(Quran.getSurah(value.surahNumber));
        surahVersList.addAll(value.verses.values);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isSurah ? surah!.nameEnglish : 'Juz ${juz!.number}'),
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
