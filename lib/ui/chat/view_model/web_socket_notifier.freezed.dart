// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_socket_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WebSocketState {
  List<MessageTimelineModel> get chatData => throw _privateConstructorUsedError;
  List<MessageTimelineModel> get groupChatData =>
      throw _privateConstructorUsedError;
  List<MessageTimelineModel> get initData => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get connectionStatus => throw _privateConstructorUsedError;

  /// Create a copy of WebSocketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WebSocketStateCopyWith<WebSocketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSocketStateCopyWith<$Res> {
  factory $WebSocketStateCopyWith(
          WebSocketState value, $Res Function(WebSocketState) then) =
      _$WebSocketStateCopyWithImpl<$Res, WebSocketState>;
  @useResult
  $Res call(
      {List<MessageTimelineModel> chatData,
      List<MessageTimelineModel> groupChatData,
      List<MessageTimelineModel> initData,
      bool loading,
      bool connectionStatus});
}

/// @nodoc
class _$WebSocketStateCopyWithImpl<$Res, $Val extends WebSocketState>
    implements $WebSocketStateCopyWith<$Res> {
  _$WebSocketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WebSocketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatData = null,
    Object? groupChatData = null,
    Object? initData = null,
    Object? loading = null,
    Object? connectionStatus = null,
  }) {
    return _then(_value.copyWith(
      chatData: null == chatData
          ? _value.chatData
          : chatData // ignore: cast_nullable_to_non_nullable
              as List<MessageTimelineModel>,
      groupChatData: null == groupChatData
          ? _value.groupChatData
          : groupChatData // ignore: cast_nullable_to_non_nullable
              as List<MessageTimelineModel>,
      initData: null == initData
          ? _value.initData
          : initData // ignore: cast_nullable_to_non_nullable
              as List<MessageTimelineModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      connectionStatus: null == connectionStatus
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebSocketStateImplCopyWith<$Res>
    implements $WebSocketStateCopyWith<$Res> {
  factory _$$WebSocketStateImplCopyWith(_$WebSocketStateImpl value,
          $Res Function(_$WebSocketStateImpl) then) =
      __$$WebSocketStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MessageTimelineModel> chatData,
      List<MessageTimelineModel> groupChatData,
      List<MessageTimelineModel> initData,
      bool loading,
      bool connectionStatus});
}

/// @nodoc
class __$$WebSocketStateImplCopyWithImpl<$Res>
    extends _$WebSocketStateCopyWithImpl<$Res, _$WebSocketStateImpl>
    implements _$$WebSocketStateImplCopyWith<$Res> {
  __$$WebSocketStateImplCopyWithImpl(
      _$WebSocketStateImpl _value, $Res Function(_$WebSocketStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WebSocketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatData = null,
    Object? groupChatData = null,
    Object? initData = null,
    Object? loading = null,
    Object? connectionStatus = null,
  }) {
    return _then(_$WebSocketStateImpl(
      chatData: null == chatData
          ? _value._chatData
          : chatData // ignore: cast_nullable_to_non_nullable
              as List<MessageTimelineModel>,
      groupChatData: null == groupChatData
          ? _value._groupChatData
          : groupChatData // ignore: cast_nullable_to_non_nullable
              as List<MessageTimelineModel>,
      initData: null == initData
          ? _value._initData
          : initData // ignore: cast_nullable_to_non_nullable
              as List<MessageTimelineModel>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      connectionStatus: null == connectionStatus
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$WebSocketStateImpl implements _WebSocketState {
  const _$WebSocketStateImpl(
      {final List<MessageTimelineModel> chatData = const [],
      final List<MessageTimelineModel> groupChatData = const [],
      final List<MessageTimelineModel> initData = const [],
      this.loading = false,
      this.connectionStatus = false})
      : _chatData = chatData,
        _groupChatData = groupChatData,
        _initData = initData;

  final List<MessageTimelineModel> _chatData;
  @override
  @JsonKey()
  List<MessageTimelineModel> get chatData {
    if (_chatData is EqualUnmodifiableListView) return _chatData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatData);
  }

  final List<MessageTimelineModel> _groupChatData;
  @override
  @JsonKey()
  List<MessageTimelineModel> get groupChatData {
    if (_groupChatData is EqualUnmodifiableListView) return _groupChatData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupChatData);
  }

  final List<MessageTimelineModel> _initData;
  @override
  @JsonKey()
  List<MessageTimelineModel> get initData {
    if (_initData is EqualUnmodifiableListView) return _initData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_initData);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool connectionStatus;

  @override
  String toString() {
    return 'WebSocketState(chatData: $chatData, groupChatData: $groupChatData, initData: $initData, loading: $loading, connectionStatus: $connectionStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebSocketStateImpl &&
            const DeepCollectionEquality().equals(other._chatData, _chatData) &&
            const DeepCollectionEquality()
                .equals(other._groupChatData, _groupChatData) &&
            const DeepCollectionEquality().equals(other._initData, _initData) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.connectionStatus, connectionStatus) ||
                other.connectionStatus == connectionStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chatData),
      const DeepCollectionEquality().hash(_groupChatData),
      const DeepCollectionEquality().hash(_initData),
      loading,
      connectionStatus);

  /// Create a copy of WebSocketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebSocketStateImplCopyWith<_$WebSocketStateImpl> get copyWith =>
      __$$WebSocketStateImplCopyWithImpl<_$WebSocketStateImpl>(
          this, _$identity);
}

abstract class _WebSocketState implements WebSocketState {
  const factory _WebSocketState(
      {final List<MessageTimelineModel> chatData,
      final List<MessageTimelineModel> groupChatData,
      final List<MessageTimelineModel> initData,
      final bool loading,
      final bool connectionStatus}) = _$WebSocketStateImpl;

  @override
  List<MessageTimelineModel> get chatData;
  @override
  List<MessageTimelineModel> get groupChatData;
  @override
  List<MessageTimelineModel> get initData;
  @override
  bool get loading;
  @override
  bool get connectionStatus;

  /// Create a copy of WebSocketState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebSocketStateImplCopyWith<_$WebSocketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
