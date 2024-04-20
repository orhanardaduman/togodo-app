import 'package:togodo/data/remote/api/auth_data_source_impl.dart';

class VersionManager {
  VersionManager({required this.deviceValue, required this.databaseValue});

  final String deviceValue;
  final String databaseValue;

  bool isNeedUpdate() {
    final deviceNumberParse =
        deviceValue.replaceAll('-Dev', '').split('.').join();
    final databaseNumberParse = databaseValue.split('.').join();

    final deviceNumber = int.tryParse(deviceNumberParse);
    final databaseNumber = int.tryParse(databaseNumberParse);

    if (deviceNumber == null || databaseNumber == null) {
      throw CustomException(
        '$deviceValue or $databaseValue is not valid for parse',
      );
    }
    return deviceNumber < databaseNumber;
  }
}
