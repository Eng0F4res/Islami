import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:islami/radio_player.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int currentStationIndex = 0;
  List<Map<String, String>> getRadioStations() {
    return [
      {
        'title': AppLocalizations.of(context)!.radio0eg,
        'url': 'https://n02.radiojar.com/8s5u5tpdtwzuv',
      },
      {
        'title': AppLocalizations.of(context)!.radio0ux,
        'url': 'https://radio.islom.uz/quranuz',
      },
      {
        'title': AppLocalizations.of(context)!.radio0om,
        'url': 'https://partrdo.mangomolo.com/quranrdo.mp3',
      },
      {
        'title': AppLocalizations.of(context)!.radio0uae,
        'url': 'https://l3.itworkscdn.net/smcquranlive/quranradiolive/icecast.audio',
      },
    ];
  }
  String stationTitle = '';
  bool isPlaying = false;
  final radio = RadioPlayer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final radioStations = getRadioStations();
      setState(() {
        stationTitle = radioStations[currentStationIndex]['title']!;
      });
      checkIfRadioIsPlaying();
    });
  }

  void checkIfRadioIsPlaying() async {
    bool playing = await radio.isActuallyPlaying();
    if (!mounted) return;
    setState(() {
      isPlaying = !playing;
    });
  }

  void toggleRadio() {
    final radioStations = getRadioStations();
    if (isPlaying) {
      isPlaying = false;
      radio.play(radioStations[currentStationIndex]['url']!);
    } else {
      isPlaying = true;
      radio.stop();
    }
    stationTitle = radioStations[currentStationIndex]['title']!;
    setState(() {});
    }

  void nextRadio() async {
    final radioStations = getRadioStations();
    await radio.stop();
    currentStationIndex = (currentStationIndex + 1) % radioStations.length;
    stationTitle = radioStations[currentStationIndex]['title']!;
    setState(() {});
    await radio.play(radioStations[currentStationIndex]['url']!);
  }

  void prevRadio() async {
    final radioStations = getRadioStations();
    await radio.stop();
    currentStationIndex = (currentStationIndex - 1 + radioStations.length) % radioStations.length;
    stationTitle = radioStations[currentStationIndex]['title']!;
    setState(() {});
    await radio.play(radioStations[currentStationIndex]['url']!);
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    bool isDark = pro.modeApp == ThemeMode.dark;
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/radio_image.png'),
                Text(stationTitle),
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
                        onPressed: prevRadio,
                      ),
                      IconButton(
                        icon: ImageIcon(
                          isPlaying
                              ? AssetImage('assets/images/Icon metro-play.png')
                              : AssetImage(
                                'assets/images/Icon metro-pause.png',
                              ),
                          color:
                              isDark ? MyThemeData.Cyellow : MyThemeData.Cbage,
                        ),
                        onPressed: toggleRadio,
                      ),
                      IconButton(
                        icon: ImageIcon(
                          AssetImage('assets/images/Icon metro-next.png'),
                          color:
                              isDark ? MyThemeData.Cyellow : MyThemeData.Cbage,
                        ),
                        onPressed: nextRadio,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
