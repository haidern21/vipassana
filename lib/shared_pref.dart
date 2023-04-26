import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  void saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('ShowLogin', false);
  }

  Future<bool?> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('ShowLogin');
  }

  void saveSessionSoundClipIndex(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('saveSessionSoundClipIndex', value);
  }

  Future<int?> getSaveSessionSoundClipIndex() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt('saveSessionSoundClipIndex');
  }

  void saveInterValueValue(int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('saveInterValueValue', value);
  }

  Future<int?> getIntervalValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt('saveInterValueValue');
  }

  void saveIntervalDuration(double value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setDouble('intervalDuration', value);
  }

  Future<double?> getIntervalDuration() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble('intervalDuration');
  }

  void saveLeadingDuration(double value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setDouble('leadingDuration', value);
  }

  Future<double?> getLeadingDuration() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble('leadingDuration');
  }

  void saveSessionLoop(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('sessionLoop', value);
  }

  Future<bool?> getSessionLoop() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('sessionLoop');
  }
}
