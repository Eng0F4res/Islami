import 'package:flutter/material.dart';
import 'package:islami/Ahadith_detailz.dart';
import 'package:islami/HomeScreen.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:islami/Sora_detailz.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (buildContext) => HomeScreen(),
        SoraDetailz.routeName: (buildContext) => SoraDetailz(),
        AhadithDetailz.routeNames: (buildContext) => AhadithDetailz(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.LightTheme,
    );
  }
}
