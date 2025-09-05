import 'package:flutter/cupertino.dart';
import 'package:islami_app_online_sun/features/main_layout/main_layout.dart';
import 'package:islami_app_online_sun/features/splash/splash.dart';

class RoutesManager {
  static const String splash = "/splash";
  static const String mainLayout = "/mainLayout";
  static const String onBoarding = "/onBoarding";
  static Map<String, WidgetBuilder> routes = {
    splash: (context) => Splash(),
    mainLayout : (context)=> MainLayout(),
  };

}
