import 'package:flutter/material.dart';
import 'package:islami_app_online_sun/config/theme/theme_manager.dart';
import 'package:islami_app_online_sun/core/routes_manager/routes_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(IslamiApp(seenOnboarding: seenOnboarding));
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key, required this.seenOnboarding});

  final bool seenOnboarding;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.routes,
      initialRoute: seenOnboarding ? RoutesManager.mainLayout : RoutesManager.onBoarding,
      theme: ThemeManager.light,
      darkTheme: ThemeManager.dark,
      themeMode: ThemeMode.light,
    );
  }
}
