import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum CacheItems {
  uid,
  videoAudio,
  blurCount,
  locationPopup,
  locationPopupShow,
  signType, // authButton ise google, facebook, apple,  twitter  // authOtp ise phone, email
  token;

  static const _storage = FlutterSecureStorage();
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
      aOptions: _getAndroidOptions(),
    );
  }

  void clear() => _storage.delete(key: name, aOptions: _getAndroidOptions());
  static void clearAll() => _storage.deleteAll(aOptions: _getAndroidOptions());
}
