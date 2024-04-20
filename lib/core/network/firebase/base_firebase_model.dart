import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:togodo/data/remote/api/auth_data_source_impl.dart';

abstract class IdModel {
  String? get id;
}

abstract class BaseFirebaseModel<T extends IdModel> {
  T fromJson(Map<String, dynamic> json);
  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw CustomException('$snapshot data is null');
    }
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }
}
