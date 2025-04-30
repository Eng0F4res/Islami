import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Ahadith_Module.dart';
import 'package:islami/Ahadith_detailz.dart';
import '../My_Theme_Data.dart';

class AhadithTab extends StatefulWidget {
  const AhadithTab({super.key});

  @override
  State<AhadithTab> createState() => _AhadithTabState();
}

class _AhadithTabState extends State<AhadithTab> {
  List<ahadithmodule> allahadith = [];
  @override
  Widget build(BuildContext context) {
    if (allahadith.isEmpty) {
      loadfile();
    }
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset('assets/images/ahadeth_image.png'),
          Divider(color: MyThemeData.Cprime, thickness: 3),
          Text('الأحاديث', style: Theme.of(context).textTheme.bodyMedium),
          Divider(color: MyThemeData.Cprime, thickness: 3),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AhadithDetailz.routeNames,
                      arguments: allahadith[index],
                    );
                  },
                  child: Text(
                    '${allahadith[index].Title}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: MyThemeData.Cprime,
                  thickness: 2,
                  endIndent: 60,
                  indent: 60,
                );
              },
              itemCount: allahadith.length,
            ),
          ),
        ],
      ),
    );
  }

  loadfile() {
    rootBundle.loadString('assets/files/ahadeth.txt').then((ahadith) {
      List<String> ahadeth = ahadith.split('#');
      for (int i = 0; i < ahadeth.length; ++i) {
        List<String> ahadithlines = ahadeth[i].trim().split('\n');
        String title = ahadithlines[0];
        ahadithlines.removeAt(0);
        List<String> content = ahadithlines;
        allahadith.add(ahadithmodule(Title: title, Content: content));
      }
      setState(() {});
    });
  }
}
