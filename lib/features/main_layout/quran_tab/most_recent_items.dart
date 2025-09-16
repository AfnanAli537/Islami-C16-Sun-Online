import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:islami_app_online_sun/core/cache/prefs_manager.dart';
import 'package:islami_app_online_sun/core/resources/colors_manager.dart';
import 'package:islami_app_online_sun/features/main_layout/quran_tab/most_recent_item.dart';
import 'package:islami_app_online_sun/models/sura_model.dart';

class MostRecentItems extends StatefulWidget {
  const MostRecentItems({super.key});

  @override
  State<MostRecentItems> createState() => MostRecentItemsState();
}

class MostRecentItemsState extends State<MostRecentItems> {
  List<SuraModel> suras = [];

  void fetchMostRecentSuras() async {
    suras = await PrefsManager.getMostRecentSuras();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    log(suras.length.toString());
    fetchMostRecentSuras();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: suras.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Most Recently",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorsManager.ofWhite,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: suras.length,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (context, index) => MostRecentItem(
                suraModel: suras[index],
                mostRecentKey: widget.key as GlobalKey<MostRecentItemsState>,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
