import 'package:flutter/material.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'My_Theme_Data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeBSheet extends StatelessWidget {
  const ThemeBSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height*.3,
      child: Column(
        children: [
          InkWell(
            onTap: (){
              pro.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.light),
                Spacer(),
                pro.modeApp==ThemeMode.light?Icon(Icons.done):Container()
              ],
            ),
          ),
          SizedBox(height: 5),
          Divider(color: MyThemeData.Cbage,indent: 80,endIndent: 80,),
          InkWell(
            onTap: (){
              pro.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.dark),
                Spacer(),
                pro.modeApp==ThemeMode.dark?Icon(Icons.done):Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
