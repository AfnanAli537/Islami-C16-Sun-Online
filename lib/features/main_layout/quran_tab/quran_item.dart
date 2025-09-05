import 'package:flutter/material.dart';
import 'package:islami_app_online_sun/core/resources/assets_manager.dart';
import 'package:islami_app_online_sun/core/resources/colors_manager.dart';
import 'package:islami_app_online_sun/core/resources/constant_manager.dart';
import 'package:islami_app_online_sun/models/sura_model.dart';

class QuranItem extends StatelessWidget {
  QuranItem({super.key, required this.sura});

  SuraModel sura;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      SizedBox(width: 24,),
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


    ]
    ,
    )
    ,
    );
  }
}
