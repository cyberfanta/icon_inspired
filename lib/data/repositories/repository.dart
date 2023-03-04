import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  static late SharedPreferences prefs;

  static Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  //Save data
  static Future<void> saveData(String name, Object value) async {
    if (value is int) {
      await prefs.setInt(name, value);
    }

    if (value is bool) {
      await prefs.setBool(name, value);
    }

    if (value is double) {
      await prefs.setDouble(name, value);
    }

    if (value is String) {
      await prefs.setString(name, value);
    }

    if (value is List<String>) {
      await prefs.setStringList(name, value);
    }

    await prefs.setString(name, value.toString());
  }

  //Get data
  static getData(String name) async {
    int? answer1 = prefs.getInt(name);

    if (answer1 != null) {
      return answer1;
    }

    bool? answer2 = prefs.getBool(name);

    if (answer2 != null) {
      return answer2;
    }

    double? answer3 = prefs.getDouble(name);

    if (answer3 != null) {
      return answer3;
    }

    String? answer4 = prefs.getString(name);

    if (answer4 != null) {
      return answer4;
    }

    List<String>? answer5 = prefs.getStringList(name);

    if (answer5 != null) {
      return answer5;
    }
  }

  //Remove data
  static Future<bool> removeData(String name) async {
    return await prefs.remove('counter');
  }
}
