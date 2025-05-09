import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Azkar_Detailz.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Azkar_Module.dart';

class AzkarTab extends StatefulWidget {
  const AzkarTab({super.key});

  @override
  State<AzkarTab> createState() => _AzkarTabState();
}

class _AzkarTabState extends State<AzkarTab> {
  List<AzkarModel> allAzkar = [];
  @override
  Widget build(BuildContext context) {
    if (allAzkar.isEmpty) {
      loadAzkarFile();
    }
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/azkar.png'),
          Divider(thickness: 3),
          Text(AppLocalizations.of(context)!.azkar, style: Theme.of(context).textTheme.bodyMedium),
          Divider(thickness: 3),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final azkar = allAzkar[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AzkarDetailz.routeName,
                      arguments: AzkarModel(
                        title: '${azkar.title}',
                        count: azkar.count,
                        benefits: '${azkar.benefits}',
                        text: '${azkar.text}',
                      ),
                    );
                  },
                  child: Text(
                    '${azkar.title}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(thickness: 2, endIndent: 133, indent: 133);
              },
              itemCount: allAzkar.length,
            ),
          ),
        ],
      ),
    );
  }

  loadAzkarFile() {
    rootBundle.loadString('assets/files/azkar.txt').then((data) {
      List<String> rawAzkar = data.split('#');
      for (int i = 0; i < rawAzkar.length; ++i) {
        List<String> lines = rawAzkar[i].trim().split('\n');
        if (lines.length < 4) continue;

        String title = lines[0].trim();
        String countLine = lines.firstWhere(
          (line) => line.startsWith('count:'),
          orElse: () => 'count:1',
        );
        String benefitsLine = lines.firstWhere(
          (line) => line.startsWith('benefits:'),
          orElse: () => 'benefits:',
        );

        int count =
            int.tryParse(countLine.replaceFirst('count:', '').trim()) ?? 1;
        String benefits = benefitsLine.replaceFirst('benefits:', '').trim();

        int textStartIndex =
            lines.indexWhere((line) => line.startsWith('text:')) + 1;
        List<String> textLines = lines.sublist(textStartIndex);

        allAzkar.add(
          AzkarModel(
            title: title,
            count: count,
            benefits: benefits,
            text: textLines.join('\n'),
          ),
        );
      }
      setState(() {});
    });
  }
}
