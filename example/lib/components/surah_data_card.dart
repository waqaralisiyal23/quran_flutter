import 'package:flutter/material.dart';
import 'package:quran_flutter/models/surah.dart';

class SurahDataCard extends StatelessWidget {
  final Surah surah;
  final void Function()? onTap;
  const SurahDataCard({super.key, required this.surah, this.onTap});

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
              color: Colors.grey.withOpacity(0.2),
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
                _buildData('No', surah.number.toString()),
                _buildData('Start', surah.start.toString()),
                _buildData('End', surah.end.toString()),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  surah.nameEnglish,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  surah.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  surah.meaning,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  surah.type.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildData('Order', surah.revealationOrder.toString()),
                _buildData('Rukus', surah.rukus.toString()),
                _buildData('Ayas', surah.verseCount.toString()),
              ],
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
