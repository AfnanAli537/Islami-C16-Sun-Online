import 'package:flutter/material.dart';
import 'package:islami_app_online_sun/core/resources/assets_manager.dart';
import 'package:islami_app_online_sun/core/resources/colors_manager.dart';
import 'package:islami_app_online_sun/core/routes_manager/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  void navigate() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamed(context, RoutesManager.mainLayout);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("ana da5alt el build nww");

    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 7),
              Image.asset(ImageAssets.splashLogo),

              Spacer(flex: 3),
              Image.asset(ImageAssets.brandingImage),
            ],
          ),
        ),
      ),
    );
  }
}
