import 'package:just_audio/just_audio.dart';

class RadioPlayer {
  static final RadioPlayer _instance = RadioPlayer._internal();
  factory RadioPlayer() => _instance;

  final AudioPlayer _player = AudioPlayer(); // Shared instance

  RadioPlayer._internal();

  play(String url) async {
    try {
      if (_player.playing) return; // Avoid reloading if already playing
      await _player.setUrl(url);
      await _player.play();
    } catch (e) {
      print('Play error: $e');
    }
  }

  stop() async {
    try {
      await _player.stop();
    } catch (e) {
      print('Stop error: $e');
    }
  }

  Future<bool> isActuallyPlaying() async {
    return _player.playing;
  }
}