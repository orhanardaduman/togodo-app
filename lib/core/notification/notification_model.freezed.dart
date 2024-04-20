// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirebaseNotificationModel _$FirebaseNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _FirebaseNotificationModel.fromJson(json);
}

/// @nodoc
mixin _$FirebaseNotificationModel {
  String? get id => throw _privateConstructorUsedError;
  String? get descEn => throw _privateConstructorUsedError;
  String? get descTr => throw _privateConstructorUsedError;
  String? get titleEn => throw _privateConstructorUsedError;
  String? get titleTr => throw _privateConstructorUsedError;
  int? get day => throw _privateConstructorUsedError;
  int? get hours => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirebaseNotificationModelCopyWith<FirebaseNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseNotificationModelCopyWith<$Res> {
  factory $FirebaseNotificationModelCopyWith(FirebaseNotificationModel value,
          $Res Function(FirebaseNotificationModel) then) =
      _$FirebaseNotificationModelCopyWithImpl<$Res, FirebaseNotificationModel>;
  @useResult
  $Res call(
      {String? id,
      String? descEn,
      String? descTr,
      String? titleEn,
      String? titleTr,
      int? day,
      int? hours,
      DateTime? createdAt});
}

/// @nodoc
class _$FirebaseNotificationModelCopyWithImpl<$Res,
        $Val extends FirebaseNotificationModel>
    implements $FirebaseNotificationModelCopyWith<$Res> {
  _$FirebaseNotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? descEn = freezed,
    Object? descTr = freezed,
    Object? titleEn = freezed,
    Object? titleTr = freezed,
    Object? day = freezed,
    Object? hours = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      descEn: freezed == descEn
          ? _value.descEn
          : descEn // ignore: cast_nullable_to_non_nullable
              as String?,
      descTr: freezed == descTr
          ? _value.descTr
          : descTr // ignore: cast_nullable_to_non_nullable
              as String?,
      titleEn: freezed == titleEn
          ? _value.titleEn
          : titleEn // ignore: cast_nullable_to_non_nullable
              as String?,
      titleTr: freezed == titleTr
          ? _value.titleTr
          : titleTr // ignore: cast_nullable_to_non_nullable
              as String?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      hours: freezed == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirebaseNotificationModelImplCopyWith<$Res>
    implements $FirebaseNotificationModelCopyWith<$Res> {
  factory _$$FirebaseNotificationModelImplCopyWith(
          _$FirebaseNotificationModelImpl value,
          $Res Function(_$FirebaseNotificationModelImpl) then) =
      __$$FirebaseNotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? descEn,
      String? descTr,
      String? titleEn,
      String? titleTr,
      int? day,
      int? hours,
      DateTime? createdAt});
}

/// @nodoc
class __$$FirebaseNotificationModelImplCopyWithImpl<$Res>
    extends _$FirebaseNotificationModelCopyWithImpl<$Res,
        _$FirebaseNotificationModelImpl>
    implements _$$FirebaseNotificationModelImplCopyWith<$Res> {
  __$$FirebaseNotificationModelImplCopyWithImpl(
      _$FirebaseNotificationModelImpl _value,
      $Res Function(_$FirebaseNotificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? descEn = freezed,
    Object? descTr = freezed,
    Object? titleEn = freezed,
    Object? titleTr = freezed,
    Object? day = freezed,
    Object? hours = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$FirebaseNotificationModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      descEn: freezed == descEn
          ? _value.descEn
          : descEn // ignore: cast_nullable_to_non_nullable
              as String?,
      descTr: freezed == descTr
          ? _value.descTr
          : descTr // ignore: cast_nullable_to_non_nullable
              as String?,
      titleEn: freezed == titleEn
          ? _value.titleEn
          : titleEn // ignore: cast_nullable_to_non_nullable
              as String?,
      titleTr: freezed == titleTr
          ? _value.titleTr
          : titleTr // ignore: cast_nullable_to_non_nullable
              as String?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      hours: freezed == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirebaseNotificationModelImpl implements _FirebaseNotificationModel {
  const _$FirebaseNotificationModelImpl(
      {this.id,
      this.descEn,
      this.descTr,
      this.titleEn,
      this.titleTr,
      this.day,
      this.hours,
      this.createdAt});

  factory _$FirebaseNotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirebaseNotificationModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? descEn;
  @override
  final String? descTr;
  @override
  final String? titleEn;
  @override
  final String? titleTr;
  @override
  final int? day;
  @override
  final int? hours;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'FirebaseNotificationModel(id: $id, descEn: $descEn, descTr: $descTr, titleEn: $titleEn, titleTr: $titleTr, day: $day, hours: $hours, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseNotificationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.descEn, descEn) || other.descEn == descEn) &&
            (identical(other.descTr, descTr) || other.descTr == descTr) &&
            (identical(other.titleEn, titleEn) || other.titleEn == titleEn) &&
            (identical(other.titleTr, titleTr) || other.titleTr == titleTr) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.hours, hours) || other.hours == hours) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, descEn, descTr, titleEn, titleTr, day, hours, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseNotificationModelImplCopyWith<_$FirebaseNotificationModelImpl>
      get copyWith => __$$FirebaseNotificationModelImplCopyWithImpl<
          _$FirebaseNotificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirebaseNotificationModelImplToJson(
      this,
    );
  }
}

abstract class _FirebaseNotificationModel implements FirebaseNotificationModel {
  const factory _FirebaseNotificationModel(
      {final String? id,
      final String? descEn,
      final String? descTr,
      final String? titleEn,
      final String? titleTr,
      final int? day,
      final int? hours,
      final DateTime? createdAt}) = _$FirebaseNotificationModelImpl;

  factory _FirebaseNotificationModel.fromJson(Map<String, dynamic> json) =
      _$FirebaseNotificationModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get descEn;
  @override
  String? get descTr;
  @override
  String? get titleEn;
  @override
  String? get titleTr;
  @override
  int? get day;
  @override
  int? get hours;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$FirebaseNotificationModelImplCopyWith<_$FirebaseNotificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
