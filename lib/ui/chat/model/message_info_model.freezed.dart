// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageInfoModel _$MessageInfoModelFromJson(Map<String, dynamic> json) {
  return _MessageInfoModel.fromJson(json);
}

/// @nodoc
mixin _$MessageInfoModel {
  String? get id => throw _privateConstructorUsedError;
  String? get chatRoomId => throw _privateConstructorUsedError;
  bool? get isGroupChat => throw _privateConstructorUsedError;
  String? get messageId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get userFullName => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get userImageUrl => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get messageContentType => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  bool? get isReplied => throw _privateConstructorUsedError;
  String? get repliedMessageId => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  bool? get isOnline => throw _privateConstructorUsedError;
  bool? get isCurrentUser => throw _privateConstructorUsedError;
  bool? get isReacted => throw _privateConstructorUsedError;
  bool? get isWriting => throw _privateConstructorUsedError;
  String? get inviteId => throw _privateConstructorUsedError;
  bool? get isMuted => throw _privateConstructorUsedError;
  bool? get inviteStatus => throw _privateConstructorUsedError;
  bool? get isSeen => throw _privateConstructorUsedError;
  bool? get isForrwarded => throw _privateConstructorUsedError;
  String? get videoThumbnail => throw _privateConstructorUsedError;
  String? get videoResolution => throw _privateConstructorUsedError;
  bool? get isSystemMessage => throw _privateConstructorUsedError;
  String? get systemMessageType => throw _privateConstructorUsedError;
  String? get systemMessageToUser => throw _privateConstructorUsedError;
  List<PostFiles>? get messageFiles => throw _privateConstructorUsedError;
  List<MessageReactionsModel>? get messageReactions =>
      throw _privateConstructorUsedError;
  PostInfo? get eventInfo => throw _privateConstructorUsedError;

  /// Serializes this MessageInfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageInfoModelCopyWith<MessageInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageInfoModelCopyWith<$Res> {
  factory $MessageInfoModelCopyWith(
          MessageInfoModel value, $Res Function(MessageInfoModel) then) =
      _$MessageInfoModelCopyWithImpl<$Res, MessageInfoModel>;
  @useResult
  $Res call(
      {String? id,
      String? chatRoomId,
      bool? isGroupChat,
      String? messageId,
      String? userId,
      String? userFullName,
      String? userName,
      String? userImageUrl,
      String? message,
      String? messageContentType,
      bool? isDeleted,
      bool? isReplied,
      String? repliedMessageId,
      DateTime? createdAt,
      bool? isOnline,
      bool? isCurrentUser,
      bool? isReacted,
      bool? isWriting,
      String? inviteId,
      bool? isMuted,
      bool? inviteStatus,
      bool? isSeen,
      bool? isForrwarded,
      String? videoThumbnail,
      String? videoResolution,
      bool? isSystemMessage,
      String? systemMessageType,
      String? systemMessageToUser,
      List<PostFiles>? messageFiles,
      List<MessageReactionsModel>? messageReactions,
      PostInfo? eventInfo});

  $PostInfoCopyWith<$Res>? get eventInfo;
}

/// @nodoc
class _$MessageInfoModelCopyWithImpl<$Res, $Val extends MessageInfoModel>
    implements $MessageInfoModelCopyWith<$Res> {
  _$MessageInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chatRoomId = freezed,
    Object? isGroupChat = freezed,
    Object? messageId = freezed,
    Object? userId = freezed,
    Object? userFullName = freezed,
    Object? userName = freezed,
    Object? userImageUrl = freezed,
    Object? message = freezed,
    Object? messageContentType = freezed,
    Object? isDeleted = freezed,
    Object? isReplied = freezed,
    Object? repliedMessageId = freezed,
    Object? createdAt = freezed,
    Object? isOnline = freezed,
    Object? isCurrentUser = freezed,
    Object? isReacted = freezed,
    Object? isWriting = freezed,
    Object? inviteId = freezed,
    Object? isMuted = freezed,
    Object? inviteStatus = freezed,
    Object? isSeen = freezed,
    Object? isForrwarded = freezed,
    Object? videoThumbnail = freezed,
    Object? videoResolution = freezed,
    Object? isSystemMessage = freezed,
    Object? systemMessageType = freezed,
    Object? systemMessageToUser = freezed,
    Object? messageFiles = freezed,
    Object? messageReactions = freezed,
    Object? eventInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chatRoomId: freezed == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
      isGroupChat: freezed == isGroupChat
          ? _value.isGroupChat
          : isGroupChat // ignore: cast_nullable_to_non_nullable
              as bool?,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userFullName: freezed == userFullName
          ? _value.userFullName
          : userFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userImageUrl: freezed == userImageUrl
          ? _value.userImageUrl
          : userImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      messageContentType: freezed == messageContentType
          ? _value.messageContentType
          : messageContentType // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isReplied: freezed == isReplied
          ? _value.isReplied
          : isReplied // ignore: cast_nullable_to_non_nullable
              as bool?,
      repliedMessageId: freezed == repliedMessageId
          ? _value.repliedMessageId
          : repliedMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      isReacted: freezed == isReacted
          ? _value.isReacted
          : isReacted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isWriting: freezed == isWriting
          ? _value.isWriting
          : isWriting // ignore: cast_nullable_to_non_nullable
              as bool?,
      inviteId: freezed == inviteId
          ? _value.inviteId
          : inviteId // ignore: cast_nullable_to_non_nullable
              as String?,
      isMuted: freezed == isMuted
          ? _value.isMuted
          : isMuted // ignore: cast_nullable_to_non_nullable
              as bool?,
      inviteStatus: freezed == inviteStatus
          ? _value.inviteStatus
          : inviteStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSeen: freezed == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
      isForrwarded: freezed == isForrwarded
          ? _value.isForrwarded
          : isForrwarded // ignore: cast_nullable_to_non_nullable
              as bool?,
      videoThumbnail: freezed == videoThumbnail
          ? _value.videoThumbnail
          : videoThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      videoResolution: freezed == videoResolution
          ? _value.videoResolution
          : videoResolution // ignore: cast_nullable_to_non_nullable
              as String?,
      isSystemMessage: freezed == isSystemMessage
          ? _value.isSystemMessage
          : isSystemMessage // ignore: cast_nullable_to_non_nullable
              as bool?,
      systemMessageType: freezed == systemMessageType
          ? _value.systemMessageType
          : systemMessageType // ignore: cast_nullable_to_non_nullable
              as String?,
      systemMessageToUser: freezed == systemMessageToUser
          ? _value.systemMessageToUser
          : systemMessageToUser // ignore: cast_nullable_to_non_nullable
              as String?,
      messageFiles: freezed == messageFiles
          ? _value.messageFiles
          : messageFiles // ignore: cast_nullable_to_non_nullable
              as List<PostFiles>?,
      messageReactions: freezed == messageReactions
          ? _value.messageReactions
          : messageReactions // ignore: cast_nullable_to_non_nullable
              as List<MessageReactionsModel>?,
      eventInfo: freezed == eventInfo
          ? _value.eventInfo
          : eventInfo // ignore: cast_nullable_to_non_nullable
              as PostInfo?,
    ) as $Val);
  }

  /// Create a copy of MessageInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostInfoCopyWith<$Res>? get eventInfo {
    if (_value.eventInfo == null) {
      return null;
    }

    return $PostInfoCopyWith<$Res>(_value.eventInfo!, (value) {
      return _then(_value.copyWith(eventInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageInfoModelImplCopyWith<$Res>
    implements $MessageInfoModelCopyWith<$Res> {
  factory _$$MessageInfoModelImplCopyWith(_$MessageInfoModelImpl value,
          $Res Function(_$MessageInfoModelImpl) then) =
      __$$MessageInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? chatRoomId,
      bool? isGroupChat,
      String? messageId,
      String? userId,
      String? userFullName,
      String? userName,
      String? userImageUrl,
      String? message,
      String? messageContentType,
      bool? isDeleted,
      bool? isReplied,
      String? repliedMessageId,
      DateTime? createdAt,
      bool? isOnline,
      bool? isCurrentUser,
      bool? isReacted,
      bool? isWriting,
      String? inviteId,
      bool? isMuted,
      bool? inviteStatus,
      bool? isSeen,
      bool? isForrwarded,
      String? videoThumbnail,
      String? videoResolution,
      bool? isSystemMessage,
      String? systemMessageType,
      String? systemMessageToUser,
      List<PostFiles>? messageFiles,
      List<MessageReactionsModel>? messageReactions,
      PostInfo? eventInfo});

  @override
  $PostInfoCopyWith<$Res>? get eventInfo;
}

/// @nodoc
class __$$MessageInfoModelImplCopyWithImpl<$Res>
    extends _$MessageInfoModelCopyWithImpl<$Res, _$MessageInfoModelImpl>
    implements _$$MessageInfoModelImplCopyWith<$Res> {
  __$$MessageInfoModelImplCopyWithImpl(_$MessageInfoModelImpl _value,
      $Res Function(_$MessageInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chatRoomId = freezed,
    Object? isGroupChat = freezed,
    Object? messageId = freezed,
    Object? userId = freezed,
    Object? userFullName = freezed,
    Object? userName = freezed,
    Object? userImageUrl = freezed,
    Object? message = freezed,
    Object? messageContentType = freezed,
    Object? isDeleted = freezed,
    Object? isReplied = freezed,
    Object? repliedMessageId = freezed,
    Object? createdAt = freezed,
    Object? isOnline = freezed,
    Object? isCurrentUser = freezed,
    Object? isReacted = freezed,
    Object? isWriting = freezed,
    Object? inviteId = freezed,
    Object? isMuted = freezed,
    Object? inviteStatus = freezed,
    Object? isSeen = freezed,
    Object? isForrwarded = freezed,
    Object? videoThumbnail = freezed,
    Object? videoResolution = freezed,
    Object? isSystemMessage = freezed,
    Object? systemMessageType = freezed,
    Object? systemMessageToUser = freezed,
    Object? messageFiles = freezed,
    Object? messageReactions = freezed,
    Object? eventInfo = freezed,
  }) {
    return _then(_$MessageInfoModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chatRoomId: freezed == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
      isGroupChat: freezed == isGroupChat
          ? _value.isGroupChat
          : isGroupChat // ignore: cast_nullable_to_non_nullable
              as bool?,
      messageId: freezed == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userFullName: freezed == userFullName
          ? _value.userFullName
          : userFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userImageUrl: freezed == userImageUrl
          ? _value.userImageUrl
          : userImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      messageContentType: freezed == messageContentType
          ? _value.messageContentType
          : messageContentType // ignore: cast_nullable_to_non_nullable
              as String?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isReplied: freezed == isReplied
          ? _value.isReplied
          : isReplied // ignore: cast_nullable_to_non_nullable
              as bool?,
      repliedMessageId: freezed == repliedMessageId
          ? _value.repliedMessageId
          : repliedMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCurrentUser: freezed == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      isReacted: freezed == isReacted
          ? _value.isReacted
          : isReacted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isWriting: freezed == isWriting
          ? _value.isWriting
          : isWriting // ignore: cast_nullable_to_non_nullable
              as bool?,
      inviteId: freezed == inviteId
          ? _value.inviteId
          : inviteId // ignore: cast_nullable_to_non_nullable
              as String?,
      isMuted: freezed == isMuted
          ? _value.isMuted
          : isMuted // ignore: cast_nullable_to_non_nullable
              as bool?,
      inviteStatus: freezed == inviteStatus
          ? _value.inviteStatus
          : inviteStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSeen: freezed == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
      isForrwarded: freezed == isForrwarded
          ? _value.isForrwarded
          : isForrwarded // ignore: cast_nullable_to_non_nullable
              as bool?,
      videoThumbnail: freezed == videoThumbnail
          ? _value.videoThumbnail
          : videoThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      videoResolution: freezed == videoResolution
          ? _value.videoResolution
          : videoResolution // ignore: cast_nullable_to_non_nullable
              as String?,
      isSystemMessage: freezed == isSystemMessage
          ? _value.isSystemMessage
          : isSystemMessage // ignore: cast_nullable_to_non_nullable
              as bool?,
      systemMessageType: freezed == systemMessageType
          ? _value.systemMessageType
          : systemMessageType // ignore: cast_nullable_to_non_nullable
              as String?,
      systemMessageToUser: freezed == systemMessageToUser
          ? _value.systemMessageToUser
          : systemMessageToUser // ignore: cast_nullable_to_non_nullable
              as String?,
      messageFiles: freezed == messageFiles
          ? _value._messageFiles
          : messageFiles // ignore: cast_nullable_to_non_nullable
              as List<PostFiles>?,
      messageReactions: freezed == messageReactions
          ? _value._messageReactions
          : messageReactions // ignore: cast_nullable_to_non_nullable
              as List<MessageReactionsModel>?,
      eventInfo: freezed == eventInfo
          ? _value.eventInfo
          : eventInfo // ignore: cast_nullable_to_non_nullable
              as PostInfo?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageInfoModelImpl implements _MessageInfoModel {
  const _$MessageInfoModelImpl(
      {this.id,
      this.chatRoomId,
      this.isGroupChat,
      this.messageId,
      this.userId,
      this.userFullName,
      this.userName,
      this.userImageUrl,
      this.message,
      this.messageContentType,
      this.isDeleted,
      this.isReplied,
      this.repliedMessageId,
      this.createdAt,
      this.isOnline,
      this.isCurrentUser,
      this.isReacted,
      this.isWriting,
      this.inviteId,
      this.isMuted,
      this.inviteStatus,
      this.isSeen,
      this.isForrwarded,
      this.videoThumbnail,
      this.videoResolution,
      this.isSystemMessage,
      this.systemMessageType,
      this.systemMessageToUser,
      final List<PostFiles>? messageFiles,
      final List<MessageReactionsModel>? messageReactions,
      this.eventInfo})
      : _messageFiles = messageFiles,
        _messageReactions = messageReactions;

  factory _$MessageInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageInfoModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? chatRoomId;
  @override
  final bool? isGroupChat;
  @override
  final String? messageId;
  @override
  final String? userId;
  @override
  final String? userFullName;
  @override
  final String? userName;
  @override
  final String? userImageUrl;
  @override
  final String? message;
  @override
  final String? messageContentType;
  @override
  final bool? isDeleted;
  @override
  final bool? isReplied;
  @override
  final String? repliedMessageId;
  @override
  final DateTime? createdAt;
  @override
  final bool? isOnline;
  @override
  final bool? isCurrentUser;
  @override
  final bool? isReacted;
  @override
  final bool? isWriting;
  @override
  final String? inviteId;
  @override
  final bool? isMuted;
  @override
  final bool? inviteStatus;
  @override
  final bool? isSeen;
  @override
  final bool? isForrwarded;
  @override
  final String? videoThumbnail;
  @override
  final String? videoResolution;
  @override
  final bool? isSystemMessage;
  @override
  final String? systemMessageType;
  @override
  final String? systemMessageToUser;
  final List<PostFiles>? _messageFiles;
  @override
  List<PostFiles>? get messageFiles {
    final value = _messageFiles;
    if (value == null) return null;
    if (_messageFiles is EqualUnmodifiableListView) return _messageFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MessageReactionsModel>? _messageReactions;
  @override
  List<MessageReactionsModel>? get messageReactions {
    final value = _messageReactions;
    if (value == null) return null;
    if (_messageReactions is EqualUnmodifiableListView)
      return _messageReactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PostInfo? eventInfo;

  @override
  String toString() {
    return 'MessageInfoModel(id: $id, chatRoomId: $chatRoomId, isGroupChat: $isGroupChat, messageId: $messageId, userId: $userId, userFullName: $userFullName, userName: $userName, userImageUrl: $userImageUrl, message: $message, messageContentType: $messageContentType, isDeleted: $isDeleted, isReplied: $isReplied, repliedMessageId: $repliedMessageId, createdAt: $createdAt, isOnline: $isOnline, isCurrentUser: $isCurrentUser, isReacted: $isReacted, isWriting: $isWriting, inviteId: $inviteId, isMuted: $isMuted, inviteStatus: $inviteStatus, isSeen: $isSeen, isForrwarded: $isForrwarded, videoThumbnail: $videoThumbnail, videoResolution: $videoResolution, isSystemMessage: $isSystemMessage, systemMessageType: $systemMessageType, systemMessageToUser: $systemMessageToUser, messageFiles: $messageFiles, messageReactions: $messageReactions, eventInfo: $eventInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId) &&
            (identical(other.isGroupChat, isGroupChat) ||
                other.isGroupChat == isGroupChat) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userFullName, userFullName) ||
                other.userFullName == userFullName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userImageUrl, userImageUrl) ||
                other.userImageUrl == userImageUrl) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageContentType, messageContentType) ||
                other.messageContentType == messageContentType) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.isReplied, isReplied) ||
                other.isReplied == isReplied) &&
            (identical(other.repliedMessageId, repliedMessageId) ||
                other.repliedMessageId == repliedMessageId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                other.isCurrentUser == isCurrentUser) &&
            (identical(other.isReacted, isReacted) ||
                other.isReacted == isReacted) &&
            (identical(other.isWriting, isWriting) ||
                other.isWriting == isWriting) &&
            (identical(other.inviteId, inviteId) ||
                other.inviteId == inviteId) &&
            (identical(other.isMuted, isMuted) || other.isMuted == isMuted) &&
            (identical(other.inviteStatus, inviteStatus) ||
                other.inviteStatus == inviteStatus) &&
            (identical(other.isSeen, isSeen) || other.isSeen == isSeen) &&
            (identical(other.isForrwarded, isForrwarded) ||
                other.isForrwarded == isForrwarded) &&
            (identical(other.videoThumbnail, videoThumbnail) ||
                other.videoThumbnail == videoThumbnail) &&
            (identical(other.videoResolution, videoResolution) ||
                other.videoResolution == videoResolution) &&
            (identical(other.isSystemMessage, isSystemMessage) ||
                other.isSystemMessage == isSystemMessage) &&
            (identical(other.systemMessageType, systemMessageType) ||
                other.systemMessageType == systemMessageType) &&
            (identical(other.systemMessageToUser, systemMessageToUser) ||
                other.systemMessageToUser == systemMessageToUser) &&
            const DeepCollectionEquality()
                .equals(other._messageFiles, _messageFiles) &&
            const DeepCollectionEquality()
                .equals(other._messageReactions, _messageReactions) &&
            (identical(other.eventInfo, eventInfo) ||
                other.eventInfo == eventInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        chatRoomId,
        isGroupChat,
        messageId,
        userId,
        userFullName,
        userName,
        userImageUrl,
        message,
        messageContentType,
        isDeleted,
        isReplied,
        repliedMessageId,
        createdAt,
        isOnline,
        isCurrentUser,
        isReacted,
        isWriting,
        inviteId,
        isMuted,
        inviteStatus,
        isSeen,
        isForrwarded,
        videoThumbnail,
        videoResolution,
        isSystemMessage,
        systemMessageType,
        systemMessageToUser,
        const DeepCollectionEquality().hash(_messageFiles),
        const DeepCollectionEquality().hash(_messageReactions),
        eventInfo
      ]);

  /// Create a copy of MessageInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageInfoModelImplCopyWith<_$MessageInfoModelImpl> get copyWith =>
      __$$MessageInfoModelImplCopyWithImpl<_$MessageInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageInfoModelImplToJson(
      this,
    );
  }
}

abstract class _MessageInfoModel implements MessageInfoModel {
  const factory _MessageInfoModel(
      {final String? id,
      final String? chatRoomId,
      final bool? isGroupChat,
      final String? messageId,
      final String? userId,
      final String? userFullName,
      final String? userName,
      final String? userImageUrl,
      final String? message,
      final String? messageContentType,
      final bool? isDeleted,
      final bool? isReplied,
      final String? repliedMessageId,
      final DateTime? createdAt,
      final bool? isOnline,
      final bool? isCurrentUser,
      final bool? isReacted,
      final bool? isWriting,
      final String? inviteId,
      final bool? isMuted,
      final bool? inviteStatus,
      final bool? isSeen,
      final bool? isForrwarded,
      final String? videoThumbnail,
      final String? videoResolution,
      final bool? isSystemMessage,
      final String? systemMessageType,
      final String? systemMessageToUser,
      final List<PostFiles>? messageFiles,
      final List<MessageReactionsModel>? messageReactions,
      final PostInfo? eventInfo}) = _$MessageInfoModelImpl;

  factory _MessageInfoModel.fromJson(Map<String, dynamic> json) =
      _$MessageInfoModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get chatRoomId;
  @override
  bool? get isGroupChat;
  @override
  String? get messageId;
  @override
  String? get userId;
  @override
  String? get userFullName;
  @override
  String? get userName;
  @override
  String? get userImageUrl;
  @override
  String? get message;
  @override
  String? get messageContentType;
  @override
  bool? get isDeleted;
  @override
  bool? get isReplied;
  @override
  String? get repliedMessageId;
  @override
  DateTime? get createdAt;
  @override
  bool? get isOnline;
  @override
  bool? get isCurrentUser;
  @override
  bool? get isReacted;
  @override
  bool? get isWriting;
  @override
  String? get inviteId;
  @override
  bool? get isMuted;
  @override
  bool? get inviteStatus;
  @override
  bool? get isSeen;
  @override
  bool? get isForrwarded;
  @override
  String? get videoThumbnail;
  @override
  String? get videoResolution;
  @override
  bool? get isSystemMessage;
  @override
  String? get systemMessageType;
  @override
  String? get systemMessageToUser;
  @override
  List<PostFiles>? get messageFiles;
  @override
  List<MessageReactionsModel>? get messageReactions;
  @override
  PostInfo? get eventInfo;

  /// Create a copy of MessageInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageInfoModelImplCopyWith<_$MessageInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageReactionsModel _$MessageReactionsModelFromJson(
    Map<String, dynamic> json) {
  return _MessageReactionsModel.fromJson(json);
}

/// @nodoc
mixin _$MessageReactionsModel {
  String? get userId => throw _privateConstructorUsedError;
  String? get reaction => throw _privateConstructorUsedError;

  /// Serializes this MessageReactionsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageReactionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageReactionsModelCopyWith<MessageReactionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageReactionsModelCopyWith<$Res> {
  factory $MessageReactionsModelCopyWith(MessageReactionsModel value,
          $Res Function(MessageReactionsModel) then) =
      _$MessageReactionsModelCopyWithImpl<$Res, MessageReactionsModel>;
  @useResult
  $Res call({String? userId, String? reaction});
}

/// @nodoc
class _$MessageReactionsModelCopyWithImpl<$Res,
        $Val extends MessageReactionsModel>
    implements $MessageReactionsModelCopyWith<$Res> {
  _$MessageReactionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageReactionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? reaction = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      reaction: freezed == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageReactionsModelImplCopyWith<$Res>
    implements $MessageReactionsModelCopyWith<$Res> {
  factory _$$MessageReactionsModelImplCopyWith(
          _$MessageReactionsModelImpl value,
          $Res Function(_$MessageReactionsModelImpl) then) =
      __$$MessageReactionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, String? reaction});
}

/// @nodoc
class __$$MessageReactionsModelImplCopyWithImpl<$Res>
    extends _$MessageReactionsModelCopyWithImpl<$Res,
        _$MessageReactionsModelImpl>
    implements _$$MessageReactionsModelImplCopyWith<$Res> {
  __$$MessageReactionsModelImplCopyWithImpl(_$MessageReactionsModelImpl _value,
      $Res Function(_$MessageReactionsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageReactionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? reaction = freezed,
  }) {
    return _then(_$MessageReactionsModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      reaction: freezed == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageReactionsModelImpl implements _MessageReactionsModel {
  const _$MessageReactionsModelImpl({this.userId, this.reaction});

  factory _$MessageReactionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageReactionsModelImplFromJson(json);

  @override
  final String? userId;
  @override
  final String? reaction;

  @override
  String toString() {
    return 'MessageReactionsModel(userId: $userId, reaction: $reaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageReactionsModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.reaction, reaction) ||
                other.reaction == reaction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, reaction);

  /// Create a copy of MessageReactionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageReactionsModelImplCopyWith<_$MessageReactionsModelImpl>
      get copyWith => __$$MessageReactionsModelImplCopyWithImpl<
          _$MessageReactionsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageReactionsModelImplToJson(
      this,
    );
  }
}

abstract class _MessageReactionsModel implements MessageReactionsModel {
  const factory _MessageReactionsModel(
      {final String? userId,
      final String? reaction}) = _$MessageReactionsModelImpl;

  factory _MessageReactionsModel.fromJson(Map<String, dynamic> json) =
      _$MessageReactionsModelImpl.fromJson;

  @override
  String? get userId;
  @override
  String? get reaction;

  /// Create a copy of MessageReactionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageReactionsModelImplCopyWith<_$MessageReactionsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
