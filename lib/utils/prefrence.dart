import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {

  PreferenceManager._();

  static final PreferenceManager instance = PreferenceManager._();

  factory PreferenceManager(){
    return instance;
  }

   late SharedPreferences _preferences;

   Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }


   Future<bool> saveString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  Future<bool> saveInt(String key, int value) async {
    return await _preferences.setInt(key, value);
  }

   Future<String?> getString(String key) async {
    return _preferences.getString(key);
  }

  Future<int?> getInt(String key) async {
    return _preferences.getInt(key);
  }

   Future<bool> saveBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

   Future<bool?> getBool(String key) async {
    return _preferences.getBool(key);
  }

   Future<bool> clear() async {
    return await _preferences.clear();
  }

   Future<bool> remove(String key) async {
    return await _preferences.remove(key);
  }


}

