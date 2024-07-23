import 'package:shared_preferences/shared_preferences.dart';

enum CacheItems {
  uid,
  videoAudio,
  blurCount,
  locationPopup,
  locationPopupShow,
  users,
  signType, // authButton ise google, facebook, apple,  twitter  // authOtp ise phone, email
  token;

  Future<String?> readSecureData() async {
    final preferences = await SharedPreferences.getInstance();
    final readData = preferences.getString(name);
    return readData;
  }

  Future<List<String>?> readSecureDataList() async {
    final preferences = await SharedPreferences.getInstance();
    final readData = preferences.getStringList(name);
    return readData;
  }

  Future<void> writeSecureData(String value) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(name, value);
  }

  Future<void> writeSecureDataList(String value) async {
    final preferences = await SharedPreferences.getInstance();
    final readData = preferences.getStringList(name) ?? [];
    readData.add(value);
    await preferences.setStringList(name, readData);
  }

  void clear() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(name);
  }

  static Future<void> clearAll() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
