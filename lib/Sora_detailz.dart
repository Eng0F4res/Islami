import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:islami/Sora_Module.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SoraDetailz extends StatefulWidget {
  static const String routeName = "SoraDetailz";

  @override
  State<SoraDetailz> createState() => _SoraDetailzState();
}

class _SoraDetailzState extends State<SoraDetailz> {
  List<String> verses = [];

  loadfile(int index) async {
    String file = await rootBundle.loadString(
        'assets/files/quran/sura_${(index + 1).toString().padLeft(3, '0')}.txt'
    );
    List<String> lines = file.trim().split('\n');
    List<String> formattedLines = [];

    for (int i = 0; i < lines.length; i++) {
      String formattedLine = lines[i].trim();
      formattedLine += ' \u06DD${_toArabicNumber(i + 1)}'; // ۝ + Arabic number
      formattedLines.add(formattedLine);
    }

    String allLines = formattedLines.join(' ');
    verses = [allLines];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    SoraModule args = ModalRoute.of(context)?.settings.arguments as SoraModule;
    bool isDark = pro.modeApp == ThemeMode.dark;
    if (verses.isEmpty) {
      loadfile(args.index);
    }
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(pro.changeBackground()),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('إسلامي', style: Theme.of(context).textTheme.bodyLarge),
          ),
          body: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 20,
                bottom: 80,
              ),
              child: Card(
                color: isDark? MyThemeData.Tcblue:MyThemeData.Tcwhit,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'سوره ${args.soraName}',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        thickness: 2,
                        indent: 100,
                        endIndent: 100,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                verses[index], // This is the single long string
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontFamily: 'AmiriQuran',
                                  color: isDark ? MyThemeData.Cyellow : MyThemeData.Cblack,
                                ),
                              ),
                            );
                          },
                          itemCount: verses.length, // This is 1
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  String _toArabicNumber(int number) {
    const arabicNumbers = ['٠','١','٢','٣','٤','٥','٦','٧','٨','٩'];
    return number.toString().split('').map((e) => arabicNumbers[int.parse(e)]).join();
  }
}
