import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../res/screens/splash/splash_screen.dart';
import 'appcons.dart';

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

  Future<void> setLastLoginDate(String date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(LASTLOGINDATE, date);
  }

  Future<String?> getLastLoginDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(LASTLOGINDATE);
  }

  Future<void> checkForDailyLogout() async {
    String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String? lastLoginDate = await getLastLoginDate();

    if (lastLoginDate == null || lastLoginDate != todayDate) {
      // Log out the user
      await PreferenceManager.instance.clear();
      // Update the last login date to today's date
      await setLastLoginDate(todayDate);
      Get.offAll(const SplashScreen());
    }
  }

}

