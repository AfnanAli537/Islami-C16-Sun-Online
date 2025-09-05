import 'package:flutter/material.dart';
import 'package:islami_app_online_sun/core/resources/assets_manager.dart';
import 'package:islami_app_online_sun/core/resources/colors_manager.dart';
import 'package:islami_app_online_sun/features/main_layout/quran_tab/most_recent_item.dart';
import 'package:islami_app_online_sun/features/main_layout/quran_tab/quran_item.dart';
import 'package:islami_app_online_sun/models/sura_model.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraModel> filteredList = SuraModel.suras;
  @override
  Widget build(BuildContext context) {
    return Container(
//alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(ImageAssets.quranTabBg),
        ),
      ),

      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
            Image.asset(ImageAssets.islamiLogo),
        SizedBox(height: 21),
        TextField(
          onChanged: (input){
        filterSuraListBySearchKey(input);
          },
          cursorColor: ColorsManager.gold,
          style: TextStyle(
            fontSize: 22,
            color: ColorsManager.white,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            prefixIcon: ImageIcon(
              AssetImage(IconAssets.quran),
              color: ColorsManager.gold,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: ColorsManager.gold, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: ColorsManager.gold, width: 2),
            ),
            labelText: "Sura Name",
            labelStyle: TextStyle(fontSize: 18, color: ColorsManager.gold),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Most Recently",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorsManager.ofWhite,
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.18,
            child: ListView.separated(
          scrollDirection:Axis.horizontal,
          itemCount: 10,
            separatorBuilder: (context, index) => SizedBox(width: 10,),
            itemBuilder: (context, index) => MostRecentItem())),
              SizedBox(height: 10,),

              Text(
                "Suras List",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.ofWhite,
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                              separatorBuilder: (context, index)=> Divider(color: Colors.white,thickness: 2,indent: 20,endIndent: 20,),
                              itemBuilder: (context, index)=> QuranItem(sura: filteredList[index],), itemCount: filteredList.length,)


            ],
        ),
      ),
    );
  }

  void filterSuraListBySearchKey(String searchKey){
    filteredList = SuraModel.suras.where((sura)=> sura.suraNameEn.toLowerCase().contains(searchKey.toLowerCase()) || sura.suraNameAr.contains(searchKey)).toList();
 setState(() {

 });
  }
}
