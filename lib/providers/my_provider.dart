import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String LanguageCode = "en";
  ThemeMode modeApp = ThemeMode.light;

  changeLanguage(langcode){
    LanguageCode = langcode ;
    notifyListeners();
  }
  changeTheme(ThemeMode mode){
    modeApp = mode;
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