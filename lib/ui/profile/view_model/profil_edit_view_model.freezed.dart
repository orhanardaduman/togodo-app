// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profil_edit_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfilEditState {
  List<MediaModel?> get mediaList => throw _privateConstructorUsedError;
  List<SocialMedias> get socialMediasData => throw _privateConstructorUsedError;
  Result<ProfilModel?>? get news => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get putLoading => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  DropDownModel? get gender => throw _privateConstructorUsedError;

  /// Create a copy of ProfilEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfilEditStateCopyWith<ProfilEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilEditStateCopyWith<$Res> {
  factory $ProfilEditStateCopyWith(
          ProfilEditState value, $Res Function(ProfilEditState) then) =
      _$ProfilEditStateCopyWithImpl<$Res, ProfilEditState>;
  @useResult
  $Res call(
      {List<MediaModel?> mediaList,
      List<SocialMedias> socialMediasData,
      Result<ProfilModel?>? news,
      bool loading,
      bool putLoading,
      int type,
      DropDownModel? gender});

  $ResultCopyWith<ProfilModel?, $Res>? get news;
}

/// @nodoc
class _$ProfilEditStateCopyWithImpl<$Res, $Val extends ProfilEditState>
    implements $ProfilEditStateCopyWith<$Res> {
  _$ProfilEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfilEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaList = null,
    Object? socialMediasData = null,
    Object? news = freezed,
    Object? loading = null,
    Object? putLoading = null,
    Object? type = null,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      mediaList: null == mediaList
          ? _value.mediaList
          : mediaList // ignore: cast_nullable_to_non_nullable
              as List<MediaModel?>,
      socialMediasData: null == socialMediasData
          ? _value.socialMediasData
          : socialMediasData // ignore: cast_nullable_to_non_nullable
              as List<SocialMedias>,
      news: freezed == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as Result<ProfilModel?>?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      putLoading: null == putLoading
          ? _value.putLoading
          : putLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as DropDownModel?,
    ) as $Val);
  }

  /// Create a copy of ProfilEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<ProfilModel?, $Res>? get news {
    if (_value.news == null) {
      return null;
    }

    return $ResultCopyWith<ProfilModel?, $Res>(_value.news!, (value) {
      return _then(_value.copyWith(news: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfilEditStateImplCopyWith<$Res>
    implements $ProfilEditStateCopyWith<$Res> {
  factory _$$ProfilEditStateImplCopyWith(_$ProfilEditStateImpl value,
          $Res Function(_$ProfilEditStateImpl) then) =
      __$$ProfilEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MediaModel?> mediaList,
      List<SocialMedias> socialMediasData,
      Result<ProfilModel?>? news,
      bool loading,
      bool putLoading,
      int type,
      DropDownModel? gender});

  @override
  $ResultCopyWith<ProfilModel?, $Res>? get news;
}

/// @nodoc
class __$$ProfilEditStateImplCopyWithImpl<$Res>
    extends _$ProfilEditStateCopyWithImpl<$Res, _$ProfilEditStateImpl>
    implements _$$ProfilEditStateImplCopyWith<$Res> {
  __$$ProfilEditStateImplCopyWithImpl(
      _$ProfilEditStateImpl _value, $Res Function(_$ProfilEditStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfilEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaList = null,
    Object? socialMediasData = null,
    Object? news = freezed,
    Object? loading = null,
    Object? putLoading = null,
    Object? type = null,
    Object? gender = freezed,
  }) {
    return _then(_$ProfilEditStateImpl(
      mediaList: null == mediaList
          ? _value._mediaList
          : mediaList // ignore: cast_nullable_to_non_nullable
              as List<MediaModel?>,
      socialMediasData: null == socialMediasData
          ? _value._socialMediasData
          : socialMediasData // ignore: cast_nullable_to_non_nullable
              as List<SocialMedias>,
      news: freezed == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as Result<ProfilModel?>?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      putLoading: null == putLoading
          ? _value.putLoading
          : putLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as DropDownModel?,
    ));
  }
}

/// @nodoc

class _$ProfilEditStateImpl
    with DiagnosticableTreeMixin
    implements _ProfilEditState {
  const _$ProfilEditStateImpl(
      {final List<MediaModel?> mediaList = const [],
      final List<SocialMedias> socialMediasData = const [],
      this.news = const Result.success(data: null),
      this.loading = false,
      this.putLoading = false,
      this.type = 0,
      this.gender = null})
      : _mediaList = mediaList,
        _socialMediasData = socialMediasData;

  final List<MediaModel?> _mediaList;
  @override
  @JsonKey()
  List<MediaModel?> get mediaList {
    if (_mediaList is EqualUnmodifiableListView) return _mediaList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaList);
  }

  final List<SocialMedias> _socialMediasData;
  @override
  @JsonKey()
  List<SocialMedias> get socialMediasData {
    if (_socialMediasData is EqualUnmodifiableListView)
      return _socialMediasData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_socialMediasData);
  }

  @override
  @JsonKey()
  final Result<ProfilModel?>? news;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool putLoading;
  @override
  @JsonKey()
  final int type;
  @override
  @JsonKey()
  final DropDownModel? gender;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfilEditState(mediaList: $mediaList, socialMediasData: $socialMediasData, news: $news, loading: $loading, putLoading: $putLoading, type: $type, gender: $gender)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfilEditState'))
      ..add(DiagnosticsProperty('mediaList', mediaList))
      ..add(DiagnosticsProperty('socialMediasData', socialMediasData))
      ..add(DiagnosticsProperty('news', news))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('putLoading', putLoading))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('gender', gender));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilEditStateImpl &&
            const DeepCollectionEquality()
                .equals(other._mediaList, _mediaList) &&
            const DeepCollectionEquality()
                .equals(other._socialMediasData, _socialMediasData) &&
            (identical(other.news, news) || other.news == news) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.putLoading, putLoading) ||
                other.putLoading == putLoading) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_mediaList),
      const DeepCollectionEquality().hash(_socialMediasData),
      news,
      loading,
      putLoading,
      type,
      gender);

  /// Create a copy of ProfilEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilEditStateImplCopyWith<_$ProfilEditStateImpl> get copyWith =>
      __$$ProfilEditStateImplCopyWithImpl<_$ProfilEditStateImpl>(
          this, _$identity);
}

abstract class _ProfilEditState implements ProfilEditState {
  const factory _ProfilEditState(
      {final List<MediaModel?> mediaList,
      final List<SocialMedias> socialMediasData,
      final Result<ProfilModel?>? news,
      final bool loading,
      final bool putLoading,
      final int type,
      final DropDownModel? gender}) = _$ProfilEditStateImpl;

  @override
  List<MediaModel?> get mediaList;
  @override
  List<SocialMedias> get socialMediasData;
  @override
  Result<ProfilModel?>? get news;
  @override
  bool get loading;
  @override
  bool get putLoading;
  @override
  int get type;
  @override
  DropDownModel? get gender;

  /// Create a copy of ProfilEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilEditStateImplCopyWith<_$ProfilEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
