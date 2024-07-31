import 'package:example/components/juz_data_card.dart';
import 'package:flutter/material.dart';
import 'package:quran_flutter/quran_flutter.dart';

import 'verses_screen.dart';

class JuzListScreen extends StatefulWidget {
  const JuzListScreen({super.key});

  @override
  State<JuzListScreen> createState() => _JuzListScreenState();
}

class _JuzListScreenState extends State<JuzListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surah List'),
      ),
      body: ListView.builder(
        itemCount: Quran.getJuzAsList().length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          Juz juz = Quran.getJuzAsList()[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: JuzDataCard(
              juz: juz,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VersesScreen(
                      isSurah: false,
                      juz: juz,
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
