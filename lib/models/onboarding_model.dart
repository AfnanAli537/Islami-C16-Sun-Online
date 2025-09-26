class OnboardingModel {
  final String image;
  final String title;
  final String? description;

  OnboardingModel({
    required this.image,
    required this.title,
     this.description,
  });
  
 static final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: 'assets/images/welcome.png',
    title: 'Welcome to Islami App',
  ),
  OnboardingModel(
    image: 'assets/images/kabba.png',
    title: 'Welcome To Islami',
    description: 'We Are Very Excited To Have You In Our Community',
  ),
  OnboardingModel(
    image: 'assets/images/reading.png',
    title: 'Reading the Quran',
    description: 'Read, and your Lord is the Most Generous',
  ),
  OnboardingModel(
    image: 'assets/images/bearish.png',
    title: 'Bearish',
    description: 'Praise the name of your Lord, the Most High',
  ),
  OnboardingModel(
    image: 'assets/images/radio.png',
    title: 'Holy Quran Radio',
    description: 'You can listen to the Holy Quran Radio through the application for free and easily',
  ),

];

}


