import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_online_sun/core/resources/assets_manager.dart';
import 'package:islami_app_online_sun/core/resources/colors_manager.dart';
import 'package:islami_app_online_sun/features/sura_details/verse_item.dart';
import 'package:islami_app_online_sun/models/sura_model.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraModel suraModel;
  List<String> verses = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    suraModel = ModalRoute.of(context)?.settings.arguments as SuraModel;

    loadSuraContent(suraModel.suraIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(suraModel.suraNameEn)),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(ImageAssets.suraDetailsPatternLeft),
                  Image.asset(ImageAssets.suraDetailsPatternRight),
                ],
              ),
              Text(
                suraModel.suraNameAr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.gold,
                ),
              ),
            ],
          ),
          Expanded(
            child: verses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(color: ColorsManager.gold),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) =>
                        VerseItem(verse: verses[index]),
                    itemCount: verses.length,
                  ),
          ),
        ],
      ),
    );
  }

  void loadSuraContent(String suraIndex) async {
    print("Hello");
    String filePath = "assets/files/suras/$suraIndex.txt";
    String fileContent = await rootBundle.loadString(filePath);
    List<String> suraLines = fileContent.trim().split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "[${i + 1}]";
    }
    await Future.delayed(Duration(seconds: 1));
    verses = suraLines;
    setState(() {});
  }
}
