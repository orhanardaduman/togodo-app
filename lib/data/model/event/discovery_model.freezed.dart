// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discovery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiscoveryModel _$DiscoveryModelFromJson(Map<String, dynamic> json) {
  return _DiscoveryModel.fromJson(json);
}

/// @nodoc
mixin _$DiscoveryModel {
  List<EventModel>? get popular => throw _privateConstructorUsedError;
  List<EventModel>? get near => throw _privateConstructorUsedError;
  List<EventModel>? get soon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscoveryModelCopyWith<DiscoveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoveryModelCopyWith<$Res> {
  factory $DiscoveryModelCopyWith(
          DiscoveryModel value, $Res Function(DiscoveryModel) then) =
      _$DiscoveryModelCopyWithImpl<$Res, DiscoveryModel>;
  @useResult
  $Res call(
      {List<EventModel>? popular,
      List<EventModel>? near,
      List<EventModel>? soon});
}

/// @nodoc
class _$DiscoveryModelCopyWithImpl<$Res, $Val extends DiscoveryModel>
    implements $DiscoveryModelCopyWith<$Res> {
  _$DiscoveryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? popular = freezed,
    Object? near = freezed,
    Object? soon = freezed,
  }) {
    return _then(_value.copyWith(
      popular: freezed == popular
          ? _value.popular
          : popular // ignore: cast_nullable_to_non_nullable
              as List<EventModel>?,
      near: freezed == near
          ? _value.near
          : near // ignore: cast_nullable_to_non_nullable
              as List<EventModel>?,
      soon: freezed == soon
          ? _value.soon
          : soon // ignore: cast_nullable_to_non_nullable
              as List<EventModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscoveryModelImplCopyWith<$Res>
    implements $DiscoveryModelCopyWith<$Res> {
  factory _$$DiscoveryModelImplCopyWith(_$DiscoveryModelImpl value,
          $Res Function(_$DiscoveryModelImpl) then) =
      __$$DiscoveryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EventModel>? popular,
      List<EventModel>? near,
      List<EventModel>? soon});
}

/// @nodoc
class __$$DiscoveryModelImplCopyWithImpl<$Res>
    extends _$DiscoveryModelCopyWithImpl<$Res, _$DiscoveryModelImpl>
    implements _$$DiscoveryModelImplCopyWith<$Res> {
  __$$DiscoveryModelImplCopyWithImpl(
      _$DiscoveryModelImpl _value, $Res Function(_$DiscoveryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? popular = freezed,
    Object? near = freezed,
    Object? soon = freezed,
  }) {
    return _then(_$DiscoveryModelImpl(
      popular: freezed == popular
          ? _value._popular
          : popular // ignore: cast_nullable_to_non_nullable
              as List<EventModel>?,
      near: freezed == near
          ? _value._near
          : near // ignore: cast_nullable_to_non_nullable
              as List<EventModel>?,
      soon: freezed == soon
          ? _value._soon
          : soon // ignore: cast_nullable_to_non_nullable
              as List<EventModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DiscoveryModelImpl implements _DiscoveryModel {
  const _$DiscoveryModelImpl(
      {final List<EventModel>? popular,
      final List<EventModel>? near,
      final List<EventModel>? soon})
      : _popular = popular,
        _near = near,
        _soon = soon;

  factory _$DiscoveryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiscoveryModelImplFromJson(json);

  final List<EventModel>? _popular;
  @override
  List<EventModel>? get popular {
    final value = _popular;
    if (value == null) return null;
    if (_popular is EqualUnmodifiableListView) return _popular;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EventModel>? _near;
  @override
  List<EventModel>? get near {
    final value = _near;
    if (value == null) return null;
    if (_near is EqualUnmodifiableListView) return _near;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EventModel>? _soon;
  @override
  List<EventModel>? get soon {
    final value = _soon;
    if (value == null) return null;
    if (_soon is EqualUnmodifiableListView) return _soon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DiscoveryModel(popular: $popular, near: $near, soon: $soon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoveryModelImpl &&
            const DeepCollectionEquality().equals(other._popular, _popular) &&
            const DeepCollectionEquality().equals(other._near, _near) &&
            const DeepCollectionEquality().equals(other._soon, _soon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_popular),
      const DeepCollectionEquality().hash(_near),
      const DeepCollectionEquality().hash(_soon));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoveryModelImplCopyWith<_$DiscoveryModelImpl> get copyWith =>
      __$$DiscoveryModelImplCopyWithImpl<_$DiscoveryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiscoveryModelImplToJson(
      this,
    );
  }
}

abstract class _DiscoveryModel implements DiscoveryModel {
  const factory _DiscoveryModel(
      {final List<EventModel>? popular,
      final List<EventModel>? near,
      final List<EventModel>? soon}) = _$DiscoveryModelImpl;

  factory _DiscoveryModel.fromJson(Map<String, dynamic> json) =
      _$DiscoveryModelImpl.fromJson;

  @override
  List<EventModel>? get popular;
  @override
  List<EventModel>? get near;
  @override
  List<EventModel>? get soon;
  @override
  @JsonKey(ignore: true)
  _$$DiscoveryModelImplCopyWith<_$DiscoveryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
