import 'package:shared_preferences/shared_preferences.dart';

import '../../tools/stamp.dart';

class Repository {
  static const String _tag = "Repository";
  static late SharedPreferences prefs;

  static Future<void> initialize() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  }

  //Save data
  static Future<void> saveData(String name, Object value) async {
    if (value is int) {
      await prefs.setInt(name, value);
      stamp(_tag, "saveInt ($name): $value");
      return;
    }

    if (value is bool) {
      await prefs.setBool(name, value);
      stamp(_tag, "saveBool ($name): $value");
      return;
    }

    if (value is double) {
      await prefs.setDouble(name, value);
      stamp(_tag, "saveDouble ($name): $value");
      return;
    }

    if (value is String) {
      await prefs.setString(name, value);
      stamp(_tag, "saveString ($name): $value");
      return;
    }

    if (value is List<String>) {
      await prefs.setStringList(name, value);
      stamp(_tag, "saveList<String> ($name): $value");
      return;
    }

    await prefs.setString(name, value.toString());
    stamp(_tag, "saveString ($name): $value");
  }

  //Get data
  static dynamic getData(String name) {
    int? answer1 = prefs.getInt(name);

    if (answer1 != null) {
      stamp(_tag, "getInt ($name): $answer1");
      return answer1;
    }

    bool? answer2 = prefs.getBool(name);

    if (answer2 != null) {
      stamp(_tag, "getBool ($name): $answer2");
      return answer2;
    }

    double? answer3 = prefs.getDouble(name);

    if (answer3 != null) {
      stamp(_tag, "getDouble ($name): $answer3");
      return answer3;
    }

    String? answer4 = prefs.getString(name);

    if (answer4 != null) {
      stamp(_tag, "getString ($name): $answer4");
      return answer4;
    }

    List<String>? answer5 = prefs.getStringList(name);

    if (answer5 != null) {
      stamp(_tag, "getStringList ($name): $answer5");
      return answer5;
    }
  }

  //Remove data
  static Future<bool> removeData(String name) async {
    stamp(_tag, "removeData ($name)");
    return await prefs.remove(name);
  }
}
