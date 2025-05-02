import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:islami/My_Theme_Data.dart';
import 'package:just_audio/just_audio.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  Future<void> initPlayer() async {
    try {
      await player.setUrl(
        'https://n02.radiojar.com/8s5u5tpdtwzuv?rj-ttl=5&rj-tok=AAABlo_-KrwApvb5vtQ1x1I_dA',
      );
    } catch (e) {
      print("Error loading radio: $e");
    }
  }

  Future<void> handlePlayPause() async {
    if (player.playing) {
      await player.pause();
    } else {
      await player.play();
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Text('إذاعة القرآن الكريم'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageIcon(
                  AssetImage('assets/images/Icon metro-back.png'),
                  color: isDark ? MyThemeData.Cyellow : MyThemeData.Cbage,
                ),
                IconButton(
                  icon: ImageIcon(
                    player.playing
                        ? AssetImage('assets/images/Icon metro-play.png')
                        : AssetImage('assets/images/Icon metro-pause.png'),
                    color: isDark ? MyThemeData.Cyellow : MyThemeData.Cbage,
                  ),
                  onPressed: handlePlayPause,
                ),
                ImageIcon(
                  AssetImage('assets/images/Icon metro-next.png'),
                  color: isDark ? MyThemeData.Cyellow : MyThemeData.Cbage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
