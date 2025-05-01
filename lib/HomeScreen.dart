import 'package:flutter/material.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:islami/Tabs/Ahadith_tab.dart';
import 'package:islami/Tabs/Quran_tab.dart';
import 'package:islami/Tabs/Radio_tab.dart';
import 'package:islami/Tabs/Sebha_tab.dart';
import 'package:islami/Tabs/Settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 3;
  List<Widget> Tabs = [RadioTab(), SebhaTab(), AhadithTab(), QuranTab(),settings()];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('إسلامي', style: Theme.of(context).textTheme.bodyLarge),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentTab,
            onTap: (index) {
              currentTab = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/radio_icon.png")),
                label: 'الراديو',
                backgroundColor: MyThemeData.Cprime,
              ), //radio
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/sebha_icon.png")),
                label: 'التسبيح',
                backgroundColor: MyThemeData.Cprime,
              ), //sbha
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ahadith_icon.png")),
                label: 'الأحاديث',
                backgroundColor: MyThemeData.Cprime,
              ), //ahadith
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/quran_icon.png")),
                label: 'القرآن',
                backgroundColor: MyThemeData.Cprime,
              ),//quran
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'الاعدادات',
                backgroundColor: MyThemeData.Cprime,
              ),//settings
            ],
          ),
          body: Tabs[currentTab],
        ),
      ],
    );
  }
}
