import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  void saveData()async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setBool('ShowLogin', false);
  }

  Future<bool?> getData()async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    return sharedPreferences.getBool('ShowLogin');
  }
}