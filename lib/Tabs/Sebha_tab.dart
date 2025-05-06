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
    double screenHeight = MediaQuery.of(context).size.height;
    int count = sebha.sebhaCount;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            pro.changeSebha(),
            height: screenHeight * 0.3,
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
          InkWell(
            onTap: () {
              sebha.incrementSebhaCount();
            },
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? MyThemeData.Cyellow : MyThemeData.Cbage,
                borderRadius: BorderRadius.circular(50),
              ),
              alignment: Alignment.center,
              width: 140,
              height: 50,
              child: Text(
                tsbeh(count),
                style: GoogleFonts.amiri(
                  color: isDark ? MyThemeData.Cblack : MyThemeData.Cwhite,
                ),
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
          else
            SizedBox(height: screenHeight * 0.2),
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
