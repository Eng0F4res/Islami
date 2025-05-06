import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SebhaProvider extends ChangeNotifier{
  int sebhaCount = 0;

  loadSebhaCount() async {
    final prefs = await SharedPreferences.getInstance();
    sebhaCount = prefs.getInt('sebhaCount') ?? 0;
    notifyListeners();
  }

  incrementSebhaCount() async {
    sebhaCount = (sebhaCount >= 99) ? 0 : sebhaCount + 1;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('sebhaCount', sebhaCount);
    notifyListeners();
  }

  resetSebhaCount() async {
    sebhaCount = 0;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('sebhaCount', sebhaCount);
    notifyListeners();
  }
}