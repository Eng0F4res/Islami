import 'package:flutter/material.dart';
import 'package:islami/Ahadith_Module.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AhadithDetailz extends StatelessWidget {
  static const String routeNames = 'AhadithDetailz';

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    ahadithmodule args =
        ModalRoute.of(context)?.settings.arguments as ahadithmodule;
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
            title: Text(AppLocalizations.of(context)!.title, style: Theme.of(context).textTheme.bodyLarge),
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
              color: Color(0xCCFFFFFF),
              child: Padding(
                padding: const EdgeInsets.only(top: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${args.Title}',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      color: MyThemeData.Cbage,
                      thickness: 1,
                      indent: 70,
                      endIndent: 70,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              '${args.Content[index]}',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(fontFamily: 'DecoTypeThuluth'),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Text(' ');
                        },
                        itemCount: args.Content.length,
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
