import 'package:flutter/material.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:islami/My_Theme_Data.dart';


import '../providers/radio_provider.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final provider = Provider.of<RadioProvider>(context, listen: false);
    if (!provider.isInitialized) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        provider.initializeStations(context);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var radio = Provider.of<RadioProvider>(context);
    var pro = Provider.of<MyProvider>(context);
    bool isDark = pro.modeApp == ThemeMode.dark;
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/radio_image.png'),
            Text(radio.stationTitle),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/images/Icon metro-back.png'),
                      color:
                          isDark ? MyThemeData.Cyellow : MyThemeData.Cbage,
                    ),
                    onPressed: radio.prevStation,
                  ),
                  IconButton(
                    icon: ImageIcon(
                      radio.isNotPlaying
                          ? AssetImage('assets/images/Icon metro-play.png')
                          : AssetImage(
                            'assets/images/Icon metro-pause.png',
                          ),
                      color:
                          isDark ? MyThemeData.Cyellow : MyThemeData.Cbage,
                    ),
                    onPressed: radio.toggleRadio,
                  ),
                  IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/images/Icon metro-next.png'),
                      color:
                          isDark ? MyThemeData.Cyellow : MyThemeData.Cbage,
                    ),
                    onPressed: radio.nextStation,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
