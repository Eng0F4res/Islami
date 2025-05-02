import 'package:flutter/material.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:islami/Tabs/Ahadith_tab.dart';
import 'package:islami/Tabs/Quran_tab.dart';
import 'package:islami/Tabs/Radio_tab.dart';
import 'package:islami/Tabs/Sebha_tab.dart';
import 'package:islami/Tabs/Settings.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    var pro = Provider.of<MyProvider>(context);
    bool isDark = pro.modeApp == ThemeMode.dark;
    return Stack(
      children: [
        Image.asset(
          pro.changeBackground(),
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(AppLocalizations.of(context)!.title, style: Theme.of(context).textTheme.bodyLarge),
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
                label: AppLocalizations.of(context)!.radio,
                backgroundColor: isDark ? MyThemeData.Cblue : MyThemeData.Cbage,
              ), //radio
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/sebha_icon.png")),
                label: AppLocalizations.of(context)!.sbha,
                backgroundColor: isDark ? MyThemeData.Cblue : MyThemeData.Cbage,
              ), //sbha
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/ahadith_icon.png")),
                label: AppLocalizations.of(context)!.ahadith,
                backgroundColor: isDark ? MyThemeData.Cblue : MyThemeData.Cbage,
              ), //ahadith
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/images/quran_icon.png")),
                label: AppLocalizations.of(context)!.quran,
                backgroundColor: isDark ? MyThemeData.Cblue : MyThemeData.Cbage,
              ),//quran
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.setting,
                backgroundColor: isDark ? MyThemeData.Cblue : MyThemeData.Cbage,
              ),//settings
            ],
          ),
          body: Tabs[currentTab],
        ),
      ],
    );
  }
}
