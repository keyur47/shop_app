import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;

  static Future initMySharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future setInt(int value) async {
    await _prefs.setInt("onbording", value);
  }

  static int? getInt() {
    final int? value = _prefs.getInt("onbording");
    return value;
  }

  static Future setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static String getString(String key) {
    final String? value = _prefs.getString(key);
    return value ?? "";
  }

  static final Future<SharedPreferences> prefsData =
      SharedPreferences.getInstance();

  static Future<void> setNumberList(List<String> numberList) async {
    final SharedPreferences prefs = await prefsData;
    await prefs.setStringList("numberList", numberList);
  }

  static Future<List<String>?> getNumberList() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getStringList("numberList");
  }

  static setPage(int page) async {
    final SharedPreferences prefs = await prefsData;
    return prefs.setInt("page", page);
  }

  static Future<int> getPage() async {
    final SharedPreferences prefs = await prefsData;
    return prefs.getInt("page") ?? 0;
  }

  static Future<void> remove() async {
    final SharedPreferences prefs = await prefsData;
    await prefs.remove("numberList");
  }

  static Future<void> clear() async {
    final SharedPreferences prefs = await prefsData;
    await prefs.clear();
  }
}
