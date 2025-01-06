import 'package:flutter/material.dart';
import 'package:quran_flutter/quran_flutter.dart';

class JuzDataCard extends StatelessWidget {
  final Juz juz;
  final void Function()? onTap;
  const JuzDataCard({
    super.key,
    required this.juz,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Juz ${juz.number}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Verses ${juz.verseCount}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildDataRow(
              'Surah No.',
              'Surah Name',
              'Verses',
              fontWeight: FontWeight.bold,
            ),
            Builder(builder: (context) {
              List<JuzSurahVerses> juzSurahVersesList =
                  Quran.getSurahVersesInJuzAsList(juz.number);
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: juzSurahVersesList.length,
                itemBuilder: (context, index) {
                  JuzSurahVerses juzSurahVerses = juzSurahVersesList[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: _buildDataRow(
                      juzSurahVerses.surahNumber.toString(),
                      Quran.getSurahNameEnglish(juzSurahVerses.surahNumber),
                      '${juzSurahVerses.startVerseNumber}-'
                      '${juzSurahVerses.endVerseNumber} '
                      '(${juzSurahVerses.verseCount.toString()})',
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(String value1, String value2, String value3,
      {FontWeight fontWeight = FontWeight.normal}) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              value1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              value2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              value3,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
