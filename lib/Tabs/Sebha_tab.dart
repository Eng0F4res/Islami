import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:islami/providers/sebha_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  @override
  void initState() {
    super.initState();
    Provider.of<SebhaProvider>(context, listen: false).loadSebhaCount();
  }
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var sebha = Provider.of<SebhaProvider>(context);
    bool isDark = pro.modeApp == ThemeMode.dark;
    int count = sebha.sebhaCount;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Stack(
                alignment: Alignment.center,
                children: [
                Image.asset(
                  pro.changeSebha(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  width: 140,
                  height: 60,
                  child: Text(
                    tsbeh(count),
                    style: GoogleFonts.amiri(
                      color: isDark ? MyThemeData.Cwhite : MyThemeData.Cblack,
                    ),
                  ),
                ),
              ]
            ),
            onTap: () {
              sebha.incrementSebhaCount();
            },
          ),
          Text(
            AppLocalizations.of(context)!.tsbeh,
            style: TextStyle(
              color: isDark ? MyThemeData.Cwhite : MyThemeData.Cblack,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: isDark ? MyThemeData.Scblue : MyThemeData.Scbage,
              borderRadius: BorderRadius.circular(30),
            ),
            height: 60,
            width: 50,
            alignment: Alignment.center,
            child: Text(
              '${count % 33 + 0}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? MyThemeData.Cwhite : MyThemeData.Cblack,
              ),
            ),
          ),
          if (tsbeh(count) == 'تمام المائة')
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: isDark ? MyThemeData.Scblue : MyThemeData.Scbage,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'لا إله إلا الله وحده لا شريك له\n له الملك، وله الحمد\n وهو على كل شيء قدير',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isDark ? MyThemeData.Cwhite : MyThemeData.Cblack,
                ),
              ),
            )
        ],
      ),
    );
  }
  String tsbeh(count1) {
    if (count1 < 33) return 'سبحان اللّه';
    if (count1 < 66) return 'الحمد للّه';
    if (count1 < 99) return 'اللّه اكبر';
    return 'تمام المائة';
  }
}
