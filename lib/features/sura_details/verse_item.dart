import 'package:flutter/material.dart';

import '../../core/resources/colors_manager.dart';

class VerseItem extends StatelessWidget {
   VerseItem({super.key, required this.verse});
String verse;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      color: ColorsManager.gold,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          verse,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorsManager.black,
          ),
        ),
      ),
    );
  }
}
