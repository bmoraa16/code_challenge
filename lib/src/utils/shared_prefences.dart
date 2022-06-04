import 'package:shared_preferences/shared_preferences.dart';

class MyAppPreferences {
  static final MyAppPreferences _instance = MyAppPreferences._internal();

  factory MyAppPreferences() {
    return _instance;
  }

  MyAppPreferences._internal() {
    SharedPreferences.getInstance().then((value) => preferences = value);
  }

  late SharedPreferences preferences;

  static Future<String> getEntityName() async {
    return _instance.preferences.getString("entityName") ?? "";
  }

  static void setEntityName(String token) async {
    _instance.preferences.setString("entityName", token);
  }
}
