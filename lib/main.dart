import 'package:flutter/material.dart';
import 'package:islami/Ahadith_detailz.dart';
import 'package:islami/Azkar_Detailz.dart';
import 'package:islami/HomeScreen.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:islami/Sora_detailz.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/providers/radio_provider.dart';
import 'package:islami/providers/sebha_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SebhaProvider()),
        ChangeNotifierProvider(create: (_) => RadioProvider()),
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  late MyProvider pro;

  @override
  Widget build(BuildContext context) {
    pro = Provider.of<MyProvider>(context);
    getSharedPrefs();
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(pro.LanguageCode),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (buildContext) => HomeScreen(),
        SoraDetailz.routeName: (buildContext) => SoraDetailz(),
        AzkarDetailz.routeName: (buildContext) => AzkarDetailz(),
        AhadithDetailz.routeNames: (buildContext) => AhadithDetailz(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.LightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: pro.modeApp,
    );
  }
  getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('language')??'ar';
    String theme = prefs.getString('theme')??'light';
    pro.changeLanguage(lang);
    pro.changeTheme(theme=='light'?ThemeMode.light:ThemeMode.dark);
  }
}

