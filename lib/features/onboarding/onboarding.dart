import 'package:flutter/material.dart';
import 'package:islami_app_online_sun/core/resources/colors_manager.dart';
import 'package:islami_app_online_sun/models/onboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(child: Image.asset("assets/images/islami_logo.png",)),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: OnboardingModel.onboardingData.length,
              itemBuilder: (context, index) {
                return buildOnboardingPage(
                  OnboardingModel.onboardingData[index],
                );
              },
            ),
          ),
          buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget buildOnboardingPage(OnboardingModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(model.image),
          SizedBox(height: 15),
          Text(
            model.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ColorsManager.gold),
          ),
          SizedBox(height: 20),
          Visibility(
            visible: model.description != null,
            child: Text(
              model.description ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 19, color: ColorsManager.gold,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavigation() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (_currentPage == 0)
              ? SizedBox(width: 60) 
              : TextButton(
                  onPressed: () {
                    _controller.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Text("Back",style: TextStyle(color: ColorsManager.gold),),
                ),
          Row(
            children: List.generate(
              OnboardingModel.onboardingData.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: _currentPage == index ? ColorsManager.gold : Colors.grey,
                ),
              ),
            ),
          ),
          (_currentPage == OnboardingModel.onboardingData.length - 1)
              ? TextButton(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, '/mainLayout');
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('seenOnboarding', true);
                  },
                  child: Text("Finish",style: TextStyle(color: ColorsManager.gold),),
                )
              : TextButton(
                  onPressed: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: Text("Next",style: TextStyle(color: ColorsManager.gold),),
                ),
        ],
      ),
    );
  }
}
