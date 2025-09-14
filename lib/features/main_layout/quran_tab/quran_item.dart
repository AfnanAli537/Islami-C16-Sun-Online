import 'package:flutter/material.dart';
import 'package:islami_app_online_sun/core/cache/prefs_manager.dart';
import 'package:islami_app_online_sun/core/resources/assets_manager.dart';
import 'package:islami_app_online_sun/core/resources/colors_manager.dart';
import 'package:islami_app_online_sun/core/routes_manager/routes_manager.dart';
import 'package:islami_app_online_sun/features/main_layout/quran_tab/most_recent_items.dart';
import 'package:islami_app_online_sun/models/sura_model.dart';

class QuranItem extends StatelessWidget {
  const QuranItem({super.key, required this.sura, required this.mostRecentKey});

  final SuraModel sura;
  final GlobalKey<MostRecentItemsState> mostRecentKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PrefsManager.saveSuraIndexs(sura.suraIndex);
        Navigator.pushNamed(
          context,
          RoutesManager.suraDetails,
          arguments: QuranDetailsArguments(
            sura: sura,
            mostRecentKey: mostRecentKey,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(ImageAssets.suraNumberBg),
                Text(
                  sura.suraIndex,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
            SizedBox(width: 24),
            Column(
              children: [
                Text(
                  sura.suraNameEn,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: ColorsManager.white,
                  ),
                ),
                Text(
                  "${sura.versesNum} Verses  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              sura.suraNameAr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: ColorsManager.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuranDetailsArguments {
  final SuraModel sura;
  final GlobalKey<MostRecentItemsState> mostRecentKey;

  const QuranDetailsArguments({
    required this.sura,
    required this.mostRecentKey,
  });
}
