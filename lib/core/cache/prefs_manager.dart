import 'package:islami_app_online_sun/core/resources/strings_manager.dart';
import 'package:islami_app_online_sun/models/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static Future<void> saveSuraIndexs(String suraIndex) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> mostRecentSuraIndexs =
        prefs.getStringList(StringsManager.surasPrefsKey) ?? [];

    if (mostRecentSuraIndexs.length >= 5) {
      mostRecentSuraIndexs.remove(mostRecentSuraIndexs.first);
    }

    if (mostRecentSuraIndexs.contains(suraIndex)) {
      mostRecentSuraIndexs.remove(suraIndex);
    }

    mostRecentSuraIndexs.add(suraIndex);

    await prefs.setStringList(
      StringsManager.surasPrefsKey,
      mostRecentSuraIndexs,
    );
  }

  static Future<List<SuraModel>> getMostRecentSuras() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSuraIndexs =
        prefs.getStringList(StringsManager.surasPrefsKey) ?? [];

    List<SuraModel> mostRecentSuras = [];

    for (int i = 0; i < mostRecentSuraIndexs.length; i++) {
      int index = int.parse(mostRecentSuraIndexs[i]);
      SuraModel sura = SuraModel.suras[index - 1];
      mostRecentSuras.add(sura);
    }

    return mostRecentSuras.reversed.toList();
  }
}
