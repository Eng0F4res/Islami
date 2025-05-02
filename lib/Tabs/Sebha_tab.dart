import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    bool isDark = pro.modeApp == ThemeMode.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 668,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(pro.changeSebha()),
              Text(
                AppLocalizations.of(context)!.tsbeh,
                style: TextStyle(
                  color: isDark ? MyThemeData.Cwhite : MyThemeData.Cblack,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: isDark ? MyThemeData.Scblue : MyThemeData.Scbage,
                  border: Border.all(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 69,
                width: 81,
                alignment: Alignment.center,
                child: Text(
                  '${count%33+0}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark ? MyThemeData.Cwhite : MyThemeData.Cblack,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (count >= 99) {
                    setState(() {
                      count = 0; // Reset here after reaching 99
                    });
                  } else {
                    setState(() {
                      count++;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? MyThemeData.Cyellow : MyThemeData.Cbage,
                    border: Border.all(color: Colors.transparent, width: 0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  width: 137,
                  height: 51,
                  child: Text(
                    tsbeh(),
                    style: GoogleFonts.amiri(
                      color: isDark ? MyThemeData.Cblack : MyThemeData.Cwhite,
                    ),
                  ),
                ),
              ),
              if (tsbeh() == 'تمام المائة')
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
                SizedBox(height: 150,width: 331.2),
            ],
          ),
        ),
      ],
    );
  }
  String tsbeh() {
    if (count < 33) return 'سبحان اللّه';
    if (count < 66) return 'الحمد للّه';
    if (count < 99) return 'اللّه اكبر';
    return 'تمام المائة';
  }
}
