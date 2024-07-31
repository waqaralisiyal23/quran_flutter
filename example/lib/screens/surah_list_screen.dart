import 'package:example/components/surah_data_card.dart';
import 'package:flutter/material.dart';
import 'package:quran_flutter/models/surah.dart';
import 'package:quran_flutter/quran.dart';

import 'verses_screen.dart';

class SurahListScreen extends StatefulWidget {
  const SurahListScreen({super.key});

  @override
  State<SurahListScreen> createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surah List'),
      ),
      body: ListView.builder(
        itemCount: Quran.getSurahAsList().length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          Surah surah = Quran.getSurahAsList()[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SurahDataCard(
              surah: surah,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VersesScreen(
                      isSurah: true,
                      surah: surah,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
