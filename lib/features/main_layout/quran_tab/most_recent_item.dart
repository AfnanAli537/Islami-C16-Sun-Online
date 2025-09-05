import 'package:flutter/material.dart';
import 'package:islami_app_online_sun/core/resources/assets_manager.dart';
import 'package:islami_app_online_sun/core/resources/colors_manager.dart';

class MostRecentItem extends StatelessWidget {
  const MostRecentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(vertical: 13, horizontal: 14),
      decoration: BoxDecoration(
        color: ColorsManager.gold,
borderRadius: BorderRadius.circular(14)
      ),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceAround ,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Al-Fatiha", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ColorsManager.black),),
              Text("الفاتحه", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ColorsManager.black),),
              Text("7 Verses ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ColorsManager.black),),
            ],
          ),
          Image.asset(ImageAssets.mostRecentCardImage)
        ],
      ),
    );
  }
}
