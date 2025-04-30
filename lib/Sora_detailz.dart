import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:islami/Sora_Module.dart';

class SoraDetailz extends StatefulWidget {
  static const String routeName = "SoraDetailz";

  @override
  State<SoraDetailz> createState() => _SoraDetailzState();
}

class _SoraDetailzState extends State<SoraDetailz> {
  List<String> verses = [];

  loadfile(int index) async {
    String file = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = file.split('\n');
    verses = lines;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SoraModule args = ModalRoute.of(context)?.settings.arguments as SoraModule;
    if (verses.isEmpty) {
      loadfile(args.index);
    }
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
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
                color: Color(0xCCFFFFFF),
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
                        color: MyThemeData.Cprime,
                        thickness: 1,
                        indent: 70,
                        endIndent: 70,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Text(
                              '${verses[index]} (${index + 1})',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(fontFamily: 'DecoTypeThuluth'),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: MyThemeData.Cprime,
                              thickness: 2,
                              endIndent: 70,
                              indent: 70,
                            );
                          },
                          itemCount: verses.length,
                        ),
                      ),
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
}
