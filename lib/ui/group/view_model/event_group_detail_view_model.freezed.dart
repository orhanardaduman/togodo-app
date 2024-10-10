// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_group_detail_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventGroupDetailState {
  List<MessageInfoModel> get chatData => throw _privateConstructorUsedError;
  List<File> get mediaList => throw _privateConstructorUsedError;
  MessageInfoModel? get replyModel => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get isSubmit => throw _privateConstructorUsedError;
  bool get isReply => throw _privateConstructorUsedError;
  bool get isWriting => throw _privateConstructorUsedError;
  bool get isVoiceRecord => throw _privateConstructorUsedError;
  bool get connectionStatus => throw _privateConstructorUsedError;
  bool get isGrupChat => throw _privateConstructorUsedError;
  int get messageType => throw _privateConstructorUsedError;

  /// Create a copy of EventGroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventGroupDetailStateCopyWith<EventGroupDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventGroupDetailStateCopyWith<$Res> {
  factory $EventGroupDetailStateCopyWith(EventGroupDetailState value,
          $Res Function(EventGroupDetailState) then) =
      _$EventGroupDetailStateCopyWithImpl<$Res, EventGroupDetailState>;
  @useResult
  $Res call(
      {List<MessageInfoModel> chatData,
      List<File> mediaList,
      MessageInfoModel? replyModel,
      bool loading,
      bool isSubmit,
      bool isReply,
      bool isWriting,
      bool isVoiceRecord,
      bool connectionStatus,
      bool isGrupChat,
      int messageType});

  $MessageInfoModelCopyWith<$Res>? get replyModel;
}

/// @nodoc
class _$EventGroupDetailStateCopyWithImpl<$Res,
        $Val extends EventGroupDetailState>
    implements $EventGroupDetailStateCopyWith<$Res> {
  _$EventGroupDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventGroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatData = null,
    Object? mediaList = null,
    Object? replyModel = freezed,
    Object? loading = null,
    Object? isSubmit = null,
    Object? isReply = null,
    Object? isWriting = null,
    Object? isVoiceRecord = null,
    Object? connectionStatus = null,
    Object? isGrupChat = null,
    Object? messageType = null,
  }) {
    return _then(_value.copyWith(
      chatData: null == chatData
          ? _value.chatData
          : chatData // ignore: cast_nullable_to_non_nullable
              as List<MessageInfoModel>,
      mediaList: null == mediaList
          ? _value.mediaList
          : mediaList // ignore: cast_nullable_to_non_nullable
              as List<File>,
      replyModel: freezed == replyModel
          ? _value.replyModel
          : replyModel // ignore: cast_nullable_to_non_nullable
              as MessageInfoModel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmit: null == isSubmit
          ? _value.isSubmit
          : isSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isReply: null == isReply
          ? _value.isReply
          : isReply // ignore: cast_nullable_to_non_nullable
              as bool,
      isWriting: null == isWriting
          ? _value.isWriting
          : isWriting // ignore: cast_nullable_to_non_nullable
              as bool,
      isVoiceRecord: null == isVoiceRecord
          ? _value.isVoiceRecord
          : isVoiceRecord // ignore: cast_nullable_to_non_nullable
              as bool,
      connectionStatus: null == connectionStatus
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isGrupChat: null == isGrupChat
          ? _value.isGrupChat
          : isGrupChat // ignore: cast_nullable_to_non_nullable
              as bool,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of EventGroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageInfoModelCopyWith<$Res>? get replyModel {
    if (_value.replyModel == null) {
      return null;
    }

    return $MessageInfoModelCopyWith<$Res>(_value.replyModel!, (value) {
      return _then(_value.copyWith(replyModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventGroupDetailStateImplCopyWith<$Res>
    implements $EventGroupDetailStateCopyWith<$Res> {
  factory _$$EventGroupDetailStateImplCopyWith(
          _$EventGroupDetailStateImpl value,
          $Res Function(_$EventGroupDetailStateImpl) then) =
      __$$EventGroupDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MessageInfoModel> chatData,
      List<File> mediaList,
      MessageInfoModel? replyModel,
      bool loading,
      bool isSubmit,
      bool isReply,
      bool isWriting,
      bool isVoiceRecord,
      bool connectionStatus,
      bool isGrupChat,
      int messageType});

  @override
  $MessageInfoModelCopyWith<$Res>? get replyModel;
}

/// @nodoc
class __$$EventGroupDetailStateImplCopyWithImpl<$Res>
    extends _$EventGroupDetailStateCopyWithImpl<$Res,
        _$EventGroupDetailStateImpl>
    implements _$$EventGroupDetailStateImplCopyWith<$Res> {
  __$$EventGroupDetailStateImplCopyWithImpl(_$EventGroupDetailStateImpl _value,
      $Res Function(_$EventGroupDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventGroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatData = null,
    Object? mediaList = null,
    Object? replyModel = freezed,
    Object? loading = null,
    Object? isSubmit = null,
    Object? isReply = null,
    Object? isWriting = null,
    Object? isVoiceRecord = null,
    Object? connectionStatus = null,
    Object? isGrupChat = null,
    Object? messageType = null,
  }) {
    return _then(_$EventGroupDetailStateImpl(
      chatData: null == chatData
          ? _value._chatData
          : chatData // ignore: cast_nullable_to_non_nullable
              as List<MessageInfoModel>,
      mediaList: null == mediaList
          ? _value._mediaList
          : mediaList // ignore: cast_nullable_to_non_nullable
              as List<File>,
      replyModel: freezed == replyModel
          ? _value.replyModel
          : replyModel // ignore: cast_nullable_to_non_nullable
              as MessageInfoModel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmit: null == isSubmit
          ? _value.isSubmit
          : isSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isReply: null == isReply
          ? _value.isReply
          : isReply // ignore: cast_nullable_to_non_nullable
              as bool,
      isWriting: null == isWriting
          ? _value.isWriting
          : isWriting // ignore: cast_nullable_to_non_nullable
              as bool,
      isVoiceRecord: null == isVoiceRecord
          ? _value.isVoiceRecord
          : isVoiceRecord // ignore: cast_nullable_to_non_nullable
              as bool,
      connectionStatus: null == connectionStatus
          ? _value.connectionStatus
          : connectionStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isGrupChat: null == isGrupChat
          ? _value.isGrupChat
          : isGrupChat // ignore: cast_nullable_to_non_nullable
              as bool,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EventGroupDetailStateImpl implements _EventGroupDetailState {
  const _$EventGroupDetailStateImpl(
      {final List<MessageInfoModel> chatData = const [],
      final List<File> mediaList = const [],
      this.replyModel = null,
      this.loading = false,
      this.isSubmit = false,
      this.isReply = false,
      this.isWriting = false,
      this.isVoiceRecord = false,
      this.connectionStatus = false,
      this.isGrupChat = false,
      this.messageType = 0})
      : _chatData = chatData,
        _mediaList = mediaList;

  final List<MessageInfoModel> _chatData;
  @override
  @JsonKey()
  List<MessageInfoModel> get chatData {
    if (_chatData is EqualUnmodifiableListView) return _chatData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatData);
  }

  final List<File> _mediaList;
  @override
  @JsonKey()
  List<File> get mediaList {
    if (_mediaList is EqualUnmodifiableListView) return _mediaList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaList);
  }

  @override
  @JsonKey()
  final MessageInfoModel? replyModel;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isSubmit;
  @override
  @JsonKey()
  final bool isReply;
  @override
  @JsonKey()
  final bool isWriting;
  @override
  @JsonKey()
  final bool isVoiceRecord;
  @override
  @JsonKey()
  final bool connectionStatus;
  @override
  @JsonKey()
  final bool isGrupChat;
  @override
  @JsonKey()
  final int messageType;

  @override
  String toString() {
    return 'EventGroupDetailState(chatData: $chatData, mediaList: $mediaList, replyModel: $replyModel, loading: $loading, isSubmit: $isSubmit, isReply: $isReply, isWriting: $isWriting, isVoiceRecord: $isVoiceRecord, connectionStatus: $connectionStatus, isGrupChat: $isGrupChat, messageType: $messageType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventGroupDetailStateImpl &&
            const DeepCollectionEquality().equals(other._chatData, _chatData) &&
            const DeepCollectionEquality()
                .equals(other._mediaList, _mediaList) &&
            (identical(other.replyModel, replyModel) ||
                other.replyModel == replyModel) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isSubmit, isSubmit) ||
                other.isSubmit == isSubmit) &&
            (identical(other.isReply, isReply) || other.isReply == isReply) &&
            (identical(other.isWriting, isWriting) ||
                other.isWriting == isWriting) &&
            (identical(other.isVoiceRecord, isVoiceRecord) ||
                other.isVoiceRecord == isVoiceRecord) &&
            (identical(other.connectionStatus, connectionStatus) ||
                other.connectionStatus == connectionStatus) &&
            (identical(other.isGrupChat, isGrupChat) ||
                other.isGrupChat == isGrupChat) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chatData),
      const DeepCollectionEquality().hash(_mediaList),
      replyModel,
      loading,
      isSubmit,
      isReply,
      isWriting,
      isVoiceRecord,
      connectionStatus,
      isGrupChat,
      messageType);

  /// Create a copy of EventGroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventGroupDetailStateImplCopyWith<_$EventGroupDetailStateImpl>
      get copyWith => __$$EventGroupDetailStateImplCopyWithImpl<
          _$EventGroupDetailStateImpl>(this, _$identity);
}

abstract class _EventGroupDetailState implements EventGroupDetailState {
  const factory _EventGroupDetailState(
      {final List<MessageInfoModel> chatData,
      final List<File> mediaList,
      final MessageInfoModel? replyModel,
      final bool loading,
      final bool isSubmit,
      final bool isReply,
      final bool isWriting,
      final bool isVoiceRecord,
      final bool connectionStatus,
      final bool isGrupChat,
      final int messageType}) = _$EventGroupDetailStateImpl;

  @override
  List<MessageInfoModel> get chatData;
  @override
  List<File> get mediaList;
  @override
  MessageInfoModel? get replyModel;
  @override
  bool get loading;
  @override
  bool get isSubmit;
  @override
  bool get isReply;
  @override
  bool get isWriting;
  @override
  bool get isVoiceRecord;
  @override
  bool get connectionStatus;
  @override
  bool get isGrupChat;
  @override
  int get messageType;

  /// Create a copy of EventGroupDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventGroupDetailStateImplCopyWith<_$EventGroupDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
