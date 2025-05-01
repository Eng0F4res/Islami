import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String LanguageCode = "en";
  changeLanguage(langcode){
    LanguageCode = langcode ;
    notifyListeners();
  }
}