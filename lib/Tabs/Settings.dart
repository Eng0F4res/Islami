import 'package:flutter/material.dart';
import 'package:islami/Language_BSheet.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:islami/Theme_BSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:islami/providers/my_provider.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.languages),
          InkWell(
            onTap: () => SBSlangue(context),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55),
                border: Border.all(width: 2, color: MyThemeData.Cbage),
              ),
              child: Row(
                children: [
                  pro.LanguageCode=='en'?Text('English'):Text('لعربيه'),
                  Spacer(),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('Theme :'),
          InkWell(
            onTap: () => SBSTheme(context),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55),
                border: Border.all(width: 2, color: MyThemeData.Cbage),
              ),
              child: Row(
                children: [
                  Text('Light'),
                  Spacer(),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  SBSlangue(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: false,
        shape: OutlineInputBorder(
          borderSide: BorderSide(width: 0,color: Colors.transparent),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35)
          )
        ), 
        context: context,
        builder: (context) => LanBSheet());
  }
  SBSTheme(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: false,
        shape: OutlineInputBorder(
            borderSide: BorderSide(width: 0,color: Colors.transparent),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35)
            )
        ),
        context: context,
        builder: (context) => ThemeBSheet());
  }
}
