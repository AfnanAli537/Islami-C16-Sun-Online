import 'package:flutter/material.dart';
import 'package:islami_app_online_sun/core/resources/assets_manager.dart';
import 'package:islami_app_online_sun/core/resources/colors_manager.dart';
import 'package:islami_app_online_sun/features/main_layout/hadith/hadith_tab.dart';
import 'package:islami_app_online_sun/features/main_layout/quran_tab/quran_tab.dart';
import 'package:islami_app_online_sun/features/main_layout/radio/radio_tab.dart';
import 'package:islami_app_online_sun/features/main_layout/tasbeh/tasbeeh_tab.dart';
import 'package:islami_app_online_sun/features/main_layout/time/time_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    TasbehTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        backgroundColor: ColorsManager.gold,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorsManager.white,
        unselectedItemColor: ColorsManager.black,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(icon: IconAssets.quran, isSelected: selectedIndex == 0),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(icon: IconAssets.hadith, isSelected: selectedIndex == 01),
            label: "Hadith",
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(icon: IconAssets.sebha, isSelected: selectedIndex == 2),
            label: "Tasbeh",
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(icon: IconAssets.radio, isSelected: selectedIndex == 3),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(icon: IconAssets.time, isSelected: selectedIndex == 4),
            label: "Time",
          ),
        ],
      ),
    );
  }

  Widget _buildIcon({required String icon, required bool isSelected}) {
    return isSelected
        ? Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: BoxDecoration(
          color: ColorsManager.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(14)
        ),
        child: ImageIcon(AssetImage(icon)))
        : ImageIcon(AssetImage(icon));
  }
}
