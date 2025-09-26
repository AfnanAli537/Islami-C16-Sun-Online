import 'package:flutter/cupertino.dart';
import 'package:islami_app_online_sun/features/main_layout/main_layout.dart';
import 'package:islami_app_online_sun/features/onboarding/onboarding.dart';
import 'package:islami_app_online_sun/features/splash/splash.dart';
import 'package:islami_app_online_sun/features/sura_details/sura_details.dart';

class RoutesManager {
  static const String splash = "/splash";
  static const String mainLayout = "/mainLayout";
  static const String onBoarding = "/onBoarding";
  static const String suraDetails = "/suraDetails";
  static Map<String, WidgetBuilder> routes = {
    splash: (context) => Splash(),
    mainLayout : (context)=> MainLayout(),
    suraDetails : (context)=> SuraDetails(),
    onBoarding : (context)=> OnBoarding(),
  };

}
