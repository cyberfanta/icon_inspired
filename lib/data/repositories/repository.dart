import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  static late SharedPreferences prefs;

  static Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  //Save data
  static Future<void> saveInt(String name, int value) async {
    await prefs.setInt(name, value);
  }

  static Future<void> saveBool(String name, bool value) async {
    await prefs.setBool(name, value);
  }

  static Future<void> saveDouble(String name, double value) async {
    await prefs.setDouble(name, value);
  }

  static Future<void> saveString(String name, String value) async {
    await prefs.setString(name, value);
  }

  static Future<void> saveStringList(String name, List<String> value) async {
    await prefs.setStringList(name, value);
  }

  //Get data
  static int? getInt(String name) {
    return prefs.getInt(name);
  }

  static bool? getBool(String name) {
    return prefs.getBool(name);
  }

  static double? getDouble(String name) {
    return prefs.getDouble(name);
  }

  static String? getString(String name) {
    return prefs.getString(name);
  }

  static List<String>? getStringList(String name) {
    return prefs.getStringList(name);
  }

  //Remove data
  static Future<bool> removeData(String name) async {
    return await prefs.remove('counter');
  }
}
