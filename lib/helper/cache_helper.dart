import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<bool> putData({key, dynamic value}) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    if (value is String)
      return await sharedPreferences.setString(key, value);
    else if (value is bool)
      return await sharedPreferences.setBool(key, value);
    else if (value is int)
      return await sharedPreferences.setInt(key, value);
    else
      return await sharedPreferences.setDouble(key, value);
  }

  static Future<bool> removeData(String key) async {
    var sharedPreferences = await SharedPreferences.getInstance();

    return await sharedPreferences.remove(key);
  }

  static getData(String key) async {
    var sharedPreferences = await SharedPreferences.getInstance();

    var value = sharedPreferences.get(key);
    return value;
  }
}
