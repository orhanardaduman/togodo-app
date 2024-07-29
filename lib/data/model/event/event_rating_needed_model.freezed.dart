// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_rating_needed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EventRatingNeededModel _$EventRatingNeededModelFromJson(
    Map<String, dynamic> json) {
  return _EventRatingNeededModell.fromJson(json);
}

/// @nodoc
mixin _$EventRatingNeededModel {
  String? get id => throw _privateConstructorUsedError;
  String? get eventId => throw _privateConstructorUsedError;
  String? get eventName => throw _privateConstructorUsedError;
  String? get eventDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventRatingNeededModelCopyWith<EventRatingNeededModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventRatingNeededModelCopyWith<$Res> {
  factory $EventRatingNeededModelCopyWith(EventRatingNeededModel value,
          $Res Function(EventRatingNeededModel) then) =
      _$EventRatingNeededModelCopyWithImpl<$Res, EventRatingNeededModel>;
  @useResult
  $Res call(
      {String? id, String? eventId, String? eventName, String? eventDate});
}

/// @nodoc
class _$EventRatingNeededModelCopyWithImpl<$Res,
        $Val extends EventRatingNeededModel>
    implements $EventRatingNeededModelCopyWith<$Res> {
  _$EventRatingNeededModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? eventId = freezed,
    Object? eventName = freezed,
    Object? eventDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDate: freezed == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventRatingNeededModellImplCopyWith<$Res>
    implements $EventRatingNeededModelCopyWith<$Res> {
  factory _$$EventRatingNeededModellImplCopyWith(
          _$EventRatingNeededModellImpl value,
          $Res Function(_$EventRatingNeededModellImpl) then) =
      __$$EventRatingNeededModellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id, String? eventId, String? eventName, String? eventDate});
}

/// @nodoc
class __$$EventRatingNeededModellImplCopyWithImpl<$Res>
    extends _$EventRatingNeededModelCopyWithImpl<$Res,
        _$EventRatingNeededModellImpl>
    implements _$$EventRatingNeededModellImplCopyWith<$Res> {
  __$$EventRatingNeededModellImplCopyWithImpl(
      _$EventRatingNeededModellImpl _value,
      $Res Function(_$EventRatingNeededModellImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? eventId = freezed,
    Object? eventName = freezed,
    Object? eventDate = freezed,
  }) {
    return _then(_$EventRatingNeededModellImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDate: freezed == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventRatingNeededModellImpl implements _EventRatingNeededModell {
  const _$EventRatingNeededModellImpl(
      {this.id, this.eventId, this.eventName, this.eventDate});

  factory _$EventRatingNeededModellImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventRatingNeededModellImplFromJson(json);

  @override
  final String? id;
  @override
  final String? eventId;
  @override
  final String? eventName;
  @override
  final String? eventDate;

  @override
  String toString() {
    return 'EventRatingNeededModel(id: $id, eventId: $eventId, eventName: $eventName, eventDate: $eventDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventRatingNeededModellImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, eventId, eventName, eventDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventRatingNeededModellImplCopyWith<_$EventRatingNeededModellImpl>
      get copyWith => __$$EventRatingNeededModellImplCopyWithImpl<
          _$EventRatingNeededModellImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventRatingNeededModellImplToJson(
      this,
    );
  }
}

abstract class _EventRatingNeededModell implements EventRatingNeededModel {
  const factory _EventRatingNeededModell(
      {final String? id,
      final String? eventId,
      final String? eventName,
      final String? eventDate}) = _$EventRatingNeededModellImpl;

  factory _EventRatingNeededModell.fromJson(Map<String, dynamic> json) =
      _$EventRatingNeededModellImpl.fromJson;

  @override
  String? get id;
  @override
  String? get eventId;
  @override
  String? get eventName;
  @override
  String? get eventDate;
  @override
  @JsonKey(ignore: true)
  _$$EventRatingNeededModellImplCopyWith<_$EventRatingNeededModellImpl>
      get copyWith => throw _privateConstructorUsedError;
}
