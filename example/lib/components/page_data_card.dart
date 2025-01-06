import 'package:flutter/material.dart' hide Page;
import 'package:quran_flutter/models/page_surah_verses.dart';
import 'package:quran_flutter/quran_flutter.dart';

class QuranPageDataCard extends StatelessWidget {
  final QuranPage page;
  final void Function()? onTap;
  const QuranPageDataCard({
    super.key,
    required this.page,
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
                  'Page ${page.number}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Verses ${page.verseCount}',
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
              List<PageSurahVerses> pageSurahVersesList =
                  Quran.getSurahVersesInPageAsList(page.number);
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: pageSurahVersesList.length,
                itemBuilder: (context, index) {
                  PageSurahVerses pageSurahVerses = pageSurahVersesList[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: _buildDataRow(
                      pageSurahVerses.surahNumber.toString(),
                      Quran.getSurahNameEnglish(pageSurahVerses.surahNumber),
                      '${pageSurahVerses.startVerseNumber}-'
                      '${pageSurahVerses.endVerseNumber} '
                      '(${pageSurahVerses.verseCount.toString()})',
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
