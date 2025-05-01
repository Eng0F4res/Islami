import 'package:flutter/material.dart';
import 'package:islami/Ahadith_detailz.dart';
import 'package:islami/HomeScreen.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:islami/Sora_detailz.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MyProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
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
        AhadithDetailz.routeNames: (buildContext) => AhadithDetailz(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.LightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: pro.modeApp,
    );
  }
}

