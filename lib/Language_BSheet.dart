import 'package:flutter/material.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanBSheet extends StatelessWidget {
  const LanBSheet({super.key});

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
              pro.changeLanguage('en');
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.english),
                Spacer(),
                pro.LanguageCode=='en'?Icon(Icons.done):Container()
              ],
            ),
          ),
          SizedBox(height: 5),
          Divider(color: MyThemeData.Cbage,indent: 80,endIndent: 80,),
          InkWell(
            onTap: (){
              pro.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: Row(
              children: [
              Text(AppLocalizations.of(context)!.arabic),
              Spacer(),
                pro.LanguageCode=='ar'?Icon(Icons.done):Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
