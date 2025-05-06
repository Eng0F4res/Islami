import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier{
  String LanguageCode = "ar";
  ThemeMode modeApp = ThemeMode.light;
late SharedPreferences prefs ;

  changeLanguage(String langcode) async {
    LanguageCode = langcode ;
    prefs = await SharedPreferences.getInstance();
    prefs.setString('language', langcode);
    notifyListeners();
  }
  changeTheme(ThemeMode mode) async {
    modeApp = mode;
    prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', mode==ThemeMode.light?'light':'dark');
    notifyListeners();
  }
  String changeBackground(){
    if(modeApp == ThemeMode.light){
      return 'assets/images/background.png';
    }
    else {
      return 'assets/images/darkback.png';
    }
  }
  String changeSebha() {
    if (modeApp == ThemeMode.light) {
      return 'assets/images/Sebha.png';
    }
    else {
      return 'assets/images/Dark_Sebha.png';
    }
  }
}