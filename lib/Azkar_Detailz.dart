import 'package:flutter/material.dart';
import 'package:islami/Azkar_Module.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'My_Theme_Data.dart';

class AzkarDetailz extends StatefulWidget {
  static const String routeName = 'AzkarDetailz';

  @override
  State<AzkarDetailz> createState() => _AzkarDetailzState();
}

class _AzkarDetailzState extends State<AzkarDetailz> {
  late AzkarModel args;
  int? currentCount;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (currentCount == null) {
      args = ModalRoute.of(context)!.settings.arguments as AzkarModel;
      currentCount = args.count;
    }
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    bool isDark = pro.modeApp == ThemeMode.dark;
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
            title: Text(
              AppLocalizations.of(context)!.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 20,
              bottom: 80,
            ),
            child: Card(
              elevation: 7,
              color: isDark ? MyThemeData.Tcblue : MyThemeData.Tcwhit,
              child: Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${args.title}',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                    Divider(thickness: 1, indent: 70, endIndent: 70),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '${args.text}',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            fontFamily: 'DecoTypeThuluth',
                            fontWeight: FontWeight.w500,
                            height: 1.8,
                            color:
                                isDark
                                    ? MyThemeData.Cyellow
                                    : MyThemeData.Cblack,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '${args.benefits}',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          height: 2,
                          color: isDark ? Color(0xffe76a3c) : Color(0xFF00bc8c),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentCount = currentCount! - 1;
                            if (currentCount! <= 0) {
                              Navigator.pop(context);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: isDark ? Color(0xFFFF7300) : Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          '${AppLocalizations.of(context)!.count}${currentCount!}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
