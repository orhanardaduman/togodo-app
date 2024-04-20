// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_dashboard_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdminDashboardViewState {
  bool get loading => throw _privateConstructorUsedError;
  List<FirebaseNotificationModel>? get data =>
      throw _privateConstructorUsedError;
  List<ReportsModel>? get reports => throw _privateConstructorUsedError;
  DailyReportsModel? get dailyReportsModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdminDashboardViewStateCopyWith<AdminDashboardViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminDashboardViewStateCopyWith<$Res> {
  factory $AdminDashboardViewStateCopyWith(AdminDashboardViewState value,
          $Res Function(AdminDashboardViewState) then) =
      _$AdminDashboardViewStateCopyWithImpl<$Res, AdminDashboardViewState>;
  @useResult
  $Res call(
      {bool loading,
      List<FirebaseNotificationModel>? data,
      List<ReportsModel>? reports,
      DailyReportsModel? dailyReportsModel});

  $DailyReportsModelCopyWith<$Res>? get dailyReportsModel;
}

/// @nodoc
class _$AdminDashboardViewStateCopyWithImpl<$Res,
        $Val extends AdminDashboardViewState>
    implements $AdminDashboardViewStateCopyWith<$Res> {
  _$AdminDashboardViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? data = freezed,
    Object? reports = freezed,
    Object? dailyReportsModel = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FirebaseNotificationModel>?,
      reports: freezed == reports
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportsModel>?,
      dailyReportsModel: freezed == dailyReportsModel
          ? _value.dailyReportsModel
          : dailyReportsModel // ignore: cast_nullable_to_non_nullable
              as DailyReportsModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DailyReportsModelCopyWith<$Res>? get dailyReportsModel {
    if (_value.dailyReportsModel == null) {
      return null;
    }

    return $DailyReportsModelCopyWith<$Res>(_value.dailyReportsModel!, (value) {
      return _then(_value.copyWith(dailyReportsModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdminDashboardViewStateImplCopyWith<$Res>
    implements $AdminDashboardViewStateCopyWith<$Res> {
  factory _$$AdminDashboardViewStateImplCopyWith(
          _$AdminDashboardViewStateImpl value,
          $Res Function(_$AdminDashboardViewStateImpl) then) =
      __$$AdminDashboardViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      List<FirebaseNotificationModel>? data,
      List<ReportsModel>? reports,
      DailyReportsModel? dailyReportsModel});

  @override
  $DailyReportsModelCopyWith<$Res>? get dailyReportsModel;
}

/// @nodoc
class __$$AdminDashboardViewStateImplCopyWithImpl<$Res>
    extends _$AdminDashboardViewStateCopyWithImpl<$Res,
        _$AdminDashboardViewStateImpl>
    implements _$$AdminDashboardViewStateImplCopyWith<$Res> {
  __$$AdminDashboardViewStateImplCopyWithImpl(
      _$AdminDashboardViewStateImpl _value,
      $Res Function(_$AdminDashboardViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? data = freezed,
    Object? reports = freezed,
    Object? dailyReportsModel = freezed,
  }) {
    return _then(_$AdminDashboardViewStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FirebaseNotificationModel>?,
      reports: freezed == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<ReportsModel>?,
      dailyReportsModel: freezed == dailyReportsModel
          ? _value.dailyReportsModel
          : dailyReportsModel // ignore: cast_nullable_to_non_nullable
              as DailyReportsModel?,
    ));
  }
}

/// @nodoc

class _$AdminDashboardViewStateImpl
    with DiagnosticableTreeMixin
    implements _AdminDashboardViewState {
  const _$AdminDashboardViewStateImpl(
      {this.loading = false,
      final List<FirebaseNotificationModel>? data = const [],
      final List<ReportsModel>? reports = const [],
      this.dailyReportsModel = null})
      : _data = data,
        _reports = reports;

  @override
  @JsonKey()
  final bool loading;
  final List<FirebaseNotificationModel>? _data;
  @override
  @JsonKey()
  List<FirebaseNotificationModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ReportsModel>? _reports;
  @override
  @JsonKey()
  List<ReportsModel>? get reports {
    final value = _reports;
    if (value == null) return null;
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final DailyReportsModel? dailyReportsModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AdminDashboardViewState(loading: $loading, data: $data, reports: $reports, dailyReportsModel: $dailyReportsModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AdminDashboardViewState'))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('reports', reports))
      ..add(DiagnosticsProperty('dailyReportsModel', dailyReportsModel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminDashboardViewStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._reports, _reports) &&
            (identical(other.dailyReportsModel, dailyReportsModel) ||
                other.dailyReportsModel == dailyReportsModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_reports),
      dailyReportsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminDashboardViewStateImplCopyWith<_$AdminDashboardViewStateImpl>
      get copyWith => __$$AdminDashboardViewStateImplCopyWithImpl<
          _$AdminDashboardViewStateImpl>(this, _$identity);
}

abstract class _AdminDashboardViewState implements AdminDashboardViewState {
  const factory _AdminDashboardViewState(
          {final bool loading,
          final List<FirebaseNotificationModel>? data,
          final List<ReportsModel>? reports,
          final DailyReportsModel? dailyReportsModel}) =
      _$AdminDashboardViewStateImpl;

  @override
  bool get loading;
  @override
  List<FirebaseNotificationModel>? get data;
  @override
  List<ReportsModel>? get reports;
  @override
  DailyReportsModel? get dailyReportsModel;
  @override
  @JsonKey(ignore: true)
  _$$AdminDashboardViewStateImplCopyWith<_$AdminDashboardViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
