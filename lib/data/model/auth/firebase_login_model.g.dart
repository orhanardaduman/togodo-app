// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirebaseLoginModelImpl _$$FirebaseLoginModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FirebaseLoginModelImpl(
      idToken: json['idToken'] as String?,
      deviceId: json['deviceId'] as String?,
      location: json['location'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      surname: json['surname'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$$FirebaseLoginModelImplToJson(
        _$FirebaseLoginModelImpl instance) =>
    <String, dynamic>{
      'idToken': instance.idToken,
      'deviceId': instance.deviceId,
      'location': instance.location,
      'name': instance.name,
      'email': instance.email,
      'surname': instance.surname,
      'phoneNumber': instance.phoneNumber,
      'imagePath': instance.imagePath,
    };
