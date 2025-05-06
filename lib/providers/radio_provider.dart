import 'package:flutter/material.dart';
import 'package:islami/radio_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../radioModule.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioProvider extends ChangeNotifier{
  int _currentIDX = 0;
  bool _isNotPlaying = true;
  String _stationTitle = '';
  final RadioPlayer _radioPlayer = RadioPlayer();
  List<RadioStation> _stations = [];


  RadioProvider(){
    _loadLastStation();
  }

  Future<void> initializeStations(BuildContext context) async {
    _stations = [
      RadioStation(
        title: AppLocalizations.of(context)!.radio0eg,
        url: 'https://n02.radiojar.com/8s5u5tpdtwzuv',
      ),
      RadioStation(
        title: AppLocalizations.of(context)!.radio0ux,
        url: 'https://radio.islom.uz/quranuz',
      ),
      RadioStation(
        title: AppLocalizations.of(context)!.radio0om,
        url: 'https://partrdo.mangomolo.com/quranrdo.mp3',
      ),
      RadioStation(
        title: AppLocalizations.of(context)!.radio0uae,
        url: 'https://l3.itworkscdn.net/smcquranlive/quranradiolive/icecast.audio',
      ),
    ];
    notifyListeners();
  }

  bool get isInitialized => _stations.isNotEmpty;

  int get currentidx => _currentIDX;
  bool get isNotPlaying => _isNotPlaying;
  String get stationTitle => _stationTitle;
  RadioStation get currentStation => _stations[_currentIDX];

  Future<void> _loadLastStation() async {
    final prefs = await SharedPreferences.getInstance();
    _currentIDX = prefs.getInt('lastStationIndex') ?? 0;
    _stationTitle = _stations[_currentIDX].title;
    notifyListeners();
  }

  Future<void> _saveCurrentIndex() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastStationIndex', _currentIDX);
  }

  Future<void> toggleRadio() async {
    if (_isNotPlaying) {
      _isNotPlaying = false;
      await _radioPlayer.play(_stations[_currentIDX].url);
    } else {
      _isNotPlaying = true;
      await _radioPlayer.stop();
    }
    notifyListeners();
  }

  Future<void> nextStation() async {
    await _radioPlayer.stop();
    _currentIDX = (_currentIDX + 1) % _stations.length;
    _stationTitle = _stations[_currentIDX].title;
    _isNotPlaying = false;
    await _radioPlayer.play(_stations[_currentIDX].url);
    await _saveCurrentIndex();
    notifyListeners();
  }

  Future<void> prevStation() async {
    await _radioPlayer.stop();
    _currentIDX = (_currentIDX - 1 + _stations.length) % _stations.length;
    _stationTitle = _stations[_currentIDX].title;
    _isNotPlaying = false;
    await _radioPlayer.play(_stations[_currentIDX].url);
    await _saveCurrentIndex();
    notifyListeners();
  }
}