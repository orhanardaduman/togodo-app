import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum CacheItems {
  uid,
  videoAudio,
  blurCount,
  locationPopup,
  locationPopupShow,
  signType, // authButton ise google, facebook, apple,  twitter  // authOtp ise phone, email
  token;

  static const _storage = FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));
  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  Future<String?> readSecureData() async {
    final readData =
        await _storage.read(key: name, aOptions: _getAndroidOptions());
    return readData;
  }

  Future<void> writeSecureData(String value) async {
    await _storage.write(
      key: name,
      value: value,
    );
  }

  void clear() => _storage.delete(key: name);
  static Future<void> clearAll() => _storage.deleteAll();
}
