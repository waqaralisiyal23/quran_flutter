import 'package:flutter/material.dart';
import 'package:quran_flutter/quran_flutter.dart';

import 'juz_list_screen.dart';
import 'surah_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran Flutter'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              Quran.bismillah,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildData('Surah', Quran.surahCount.toString()),
                _buildData('Verse Count', Quran.verseCount.toString()),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildData('Makki Surah', Quran.makkiSurahCount.toString()),
                _buildData('Madani Surah', Quran.madaniSurahCount.toString()),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildData('Juz Count', Quran.juzCount.toString()),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SurahListScreen(),
                  ),
                );
              },
              child: const Text('Surah List'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JuzListScreen(),
                  ),
                );
              },
              child: const Text('Juz List'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildData(String title, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$title: ',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
