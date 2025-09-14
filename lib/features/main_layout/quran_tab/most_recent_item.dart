import 'package:flutter/material.dart';
import 'package:islami_app_online_sun/core/cache/prefs_manager.dart';
import 'package:islami_app_online_sun/core/resources/assets_manager.dart';
import 'package:islami_app_online_sun/core/resources/colors_manager.dart';
import 'package:islami_app_online_sun/core/routes_manager/routes_manager.dart';
import 'package:islami_app_online_sun/features/main_layout/quran_tab/most_recent_items.dart';
import 'package:islami_app_online_sun/features/main_layout/quran_tab/quran_item.dart';
import 'package:islami_app_online_sun/models/sura_model.dart';

class MostRecentItem extends StatelessWidget {
  final SuraModel suraModel;
  final GlobalKey<MostRecentItemsState> mostRecentKey;
  const MostRecentItem({
    super.key,
    required this.suraModel,
    required this.mostRecentKey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PrefsManager.saveSuraIndexs(suraModel.suraIndex);
        Navigator.pushNamed(
          context,
          RoutesManager.suraDetails,
          arguments: QuranDetailsArguments(
            sura: suraModel,
            mostRecentKey: mostRecentKey,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 14),
        decoration: BoxDecoration(
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  suraModel.suraNameEn,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black,
                  ),
                ),
                Text(
                  suraModel.suraNameAr,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black,
                  ),
                ),
                Text(
                  "${suraModel.versesNum} Verses ",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.black,
                  ),
                ),
              ],
            ),
            Image.asset(ImageAssets.mostRecentCardImage),
          ],
        ),
      ),
    );
  }
}
