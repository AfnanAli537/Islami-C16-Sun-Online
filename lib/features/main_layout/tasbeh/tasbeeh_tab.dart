import 'package:flutter/material.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  int zikrIndex = 0;
  double rotation = 0;

  final List<String> azkar = [
    "سُبْحَانَ الله",
    "الْحَمْدُ لِلَّهِ",
    "الله أكبر",
  ];

  void _incrementCounter() {
    setState(() {
      counter++;
      rotation += 0.2;
      if (counter >= 34) {
        counter = 0;
        zikrIndex = (zikrIndex + 1) % azkar.length;
        rotation = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sebha_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/islami_sebha_logo.png"),
              const Text(
                "سَبِّح اسْمَ رَبِّكَ الْأَعْلَى",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: _incrementCounter,
                    child: Transform.rotate(
                      angle: rotation,
                      child: Image.asset(
                        "assets/images/sebha.png",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: 80),
                        Text(
                          azkar[zikrIndex],
                          style: const TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    
                        const SizedBox(height: 15),
                    
                        Text(
                          "$counter",
                          style: const TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
