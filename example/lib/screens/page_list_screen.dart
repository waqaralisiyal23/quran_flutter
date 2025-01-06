import 'package:example/components/page_data_card.dart';
import 'package:flutter/material.dart';
import 'package:quran_flutter/quran_flutter.dart';

import 'verses_screen.dart';

class QuranPageListScreen extends StatefulWidget {
  const QuranPageListScreen({super.key});

  @override
  State<QuranPageListScreen> createState() => _QuranPageListScreenState();
}

class _QuranPageListScreenState extends State<QuranPageListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juz List'),
      ),
      body: ListView.builder(
        itemCount: Quran.getPageAsList().length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          QuranPage page = Quran.getPageAsList()[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: QuranPageDataCard(
              page: page,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VersesScreen.ofPage(page),
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
