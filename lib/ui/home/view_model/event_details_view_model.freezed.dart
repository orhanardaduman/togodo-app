// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_details_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventDetailsState {
  EventDetailsModel? get events => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  int get pagination => throw _privateConstructorUsedError;
  EventCommentModel? get replyModel =>
      throw _privateConstructorUsedError; // Eğer yoruma cevap veriliyorsa dolu  olacak
  bool get isReplyComment => throw _privateConstructorUsedError;

  /// Create a copy of EventDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventDetailsStateCopyWith<EventDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDetailsStateCopyWith<$Res> {
  factory $EventDetailsStateCopyWith(
          EventDetailsState value, $Res Function(EventDetailsState) then) =
      _$EventDetailsStateCopyWithImpl<$Res, EventDetailsState>;
  @useResult
  $Res call(
      {EventDetailsModel? events,
      bool loading,
      int pagination,
      EventCommentModel? replyModel,
      bool isReplyComment});

  $EventDetailsModelCopyWith<$Res>? get events;
  $EventCommentModelCopyWith<$Res>? get replyModel;
}

/// @nodoc
class _$EventDetailsStateCopyWithImpl<$Res, $Val extends EventDetailsState>
    implements $EventDetailsStateCopyWith<$Res> {
  _$EventDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = freezed,
    Object? loading = null,
    Object? pagination = null,
    Object? replyModel = freezed,
    Object? isReplyComment = null,
  }) {
    return _then(_value.copyWith(
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as EventDetailsModel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
      replyModel: freezed == replyModel
          ? _value.replyModel
          : replyModel // ignore: cast_nullable_to_non_nullable
              as EventCommentModel?,
      isReplyComment: null == isReplyComment
          ? _value.isReplyComment
          : isReplyComment // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of EventDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventDetailsModelCopyWith<$Res>? get events {
    if (_value.events == null) {
      return null;
    }

    return $EventDetailsModelCopyWith<$Res>(_value.events!, (value) {
      return _then(_value.copyWith(events: value) as $Val);
    });
  }

  /// Create a copy of EventDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventCommentModelCopyWith<$Res>? get replyModel {
    if (_value.replyModel == null) {
      return null;
    }

    return $EventCommentModelCopyWith<$Res>(_value.replyModel!, (value) {
      return _then(_value.copyWith(replyModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventDetailsStateImplCopyWith<$Res>
    implements $EventDetailsStateCopyWith<$Res> {
  factory _$$EventDetailsStateImplCopyWith(_$EventDetailsStateImpl value,
          $Res Function(_$EventDetailsStateImpl) then) =
      __$$EventDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EventDetailsModel? events,
      bool loading,
      int pagination,
      EventCommentModel? replyModel,
      bool isReplyComment});

  @override
  $EventDetailsModelCopyWith<$Res>? get events;
  @override
  $EventCommentModelCopyWith<$Res>? get replyModel;
}

/// @nodoc
class __$$EventDetailsStateImplCopyWithImpl<$Res>
    extends _$EventDetailsStateCopyWithImpl<$Res, _$EventDetailsStateImpl>
    implements _$$EventDetailsStateImplCopyWith<$Res> {
  __$$EventDetailsStateImplCopyWithImpl(_$EventDetailsStateImpl _value,
      $Res Function(_$EventDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = freezed,
    Object? loading = null,
    Object? pagination = null,
    Object? replyModel = freezed,
    Object? isReplyComment = null,
  }) {
    return _then(_$EventDetailsStateImpl(
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as EventDetailsModel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as int,
      replyModel: freezed == replyModel
          ? _value.replyModel
          : replyModel // ignore: cast_nullable_to_non_nullable
              as EventCommentModel?,
      isReplyComment: null == isReplyComment
          ? _value.isReplyComment
          : isReplyComment // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EventDetailsStateImpl implements _EventDetailsState {
  const _$EventDetailsStateImpl(
      {this.events = null,
      this.loading = false,
      this.pagination = 0,
      this.replyModel = null,
      this.isReplyComment = false});

  @override
  @JsonKey()
  final EventDetailsModel? events;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final int pagination;
  @override
  @JsonKey()
  final EventCommentModel? replyModel;
// Eğer yoruma cevap veriliyorsa dolu  olacak
  @override
  @JsonKey()
  final bool isReplyComment;

  @override
  String toString() {
    return 'EventDetailsState(events: $events, loading: $loading, pagination: $pagination, replyModel: $replyModel, isReplyComment: $isReplyComment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDetailsStateImpl &&
            (identical(other.events, events) || other.events == events) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.replyModel, replyModel) ||
                other.replyModel == replyModel) &&
            (identical(other.isReplyComment, isReplyComment) ||
                other.isReplyComment == isReplyComment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, events, loading, pagination, replyModel, isReplyComment);

  /// Create a copy of EventDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDetailsStateImplCopyWith<_$EventDetailsStateImpl> get copyWith =>
      __$$EventDetailsStateImplCopyWithImpl<_$EventDetailsStateImpl>(
          this, _$identity);
}

abstract class _EventDetailsState implements EventDetailsState {
  const factory _EventDetailsState(
      {final EventDetailsModel? events,
      final bool loading,
      final int pagination,
      final EventCommentModel? replyModel,
      final bool isReplyComment}) = _$EventDetailsStateImpl;

  @override
  EventDetailsModel? get events;
  @override
  bool get loading;
  @override
  int get pagination;
  @override
  EventCommentModel?
      get replyModel; // Eğer yoruma cevap veriliyorsa dolu  olacak
  @override
  bool get isReplyComment;

  /// Create a copy of EventDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventDetailsStateImplCopyWith<_$EventDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
