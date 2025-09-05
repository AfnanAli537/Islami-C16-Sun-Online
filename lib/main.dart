import 'package:flutter/material.dart';
import 'package:islami_app_online_sun/core/routes_manager/routes_manager.dart';

void main(){
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.routes,
      initialRoute: RoutesManager.splash ,
    );
  }
}
