import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/concept_image_model.dart';
import 'package:togodo/data/model/event/event_all_users_model.dart';
import 'package:togodo/data/model/event/event_comment_model.dart';
import 'package:togodo/data/model/event/event_details_model.dart';
import 'package:togodo/data/model/event/event_friend_invite_model.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/event/event_request_model.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/data/model/result.dart';
import 'package:togodo/data/remote/api/home_data_source.dart';
import 'package:togodo/data/repository/home_repository.dart';

final homeRepositoryProvider = Provider(HomeRepositoryImpl.new);

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._reader);

  final ProviderRef<dynamic> _reader;

  late final HomeDataSource _dataSource = _reader.read(homeDataSourceProvider);

  @override
  Future<Result<List<EventModel>>> getTimelineEvents({
    int? pagination,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getTimelineEvents(
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<List<EventModel>>> getTimelineEventsDaily({
    int? pagination,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getTimelineEventsDaily(
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<List<EventModel>>> getTimelineEventsGuest({
    int? pagination,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getTimelineEventsGuest(
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<EventDetailsModel>> getEventDetails({
    String? eventId,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getEventDetails(
        eventId: eventId,
      ),
    );
  }

  @override
  Future<Result<EventDetailsModel>> getEventGuest({
    String? eventId,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getEventGuest(
        eventId: eventId,
      ),
    );
  }

  @override
  Future<Result<List<EventCommentModel>>> getEventComments({
    int? pagination,
    String? eventId,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getEventComments(
        pagination: pagination,
        eventId: eventId,
      ),
    );
  }

  @override
  Future<Result<List<EventCommentModel>>> getEventCommentsReplies({
    int? pagination,
    String? commentOrReplyId,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getEventCommentsReplies(
        pagination: pagination,
        commentOrReplyId: commentOrReplyId,
      ),
    );
  }

  @override
  Future<Result<List<ConceptImageModel>>> getTagImages({int? tagId}) {
    return Result.guardFuture(
      () async => _dataSource.getTagImages(
        tagId: tagId,
      ),
    );
  }

  @override
  Future<Result<void>> eventCommentCreate(String eventId, String comment) {
    return Result.guardFuture(
      () async => _dataSource.eventCommentCreate(
        {
          'eventId': eventId,
          'comment': comment,
        },
      ),
    );
  }

  @override
  Future<Result<void>> eventCommentRemove({
    String? commentId,
    String? replyId,
  }) {
    return Result.guardFuture(
      () async => _dataSource.eventCommentRemove(
        {
          'commentId': commentId,
          'replyId': replyId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> eventJoinRequest(
    String eventId, {
    bool openToJoin = false,
  }) {
    return Result.guardFuture(
      () async => _dataSource.eventJoinRequest(
        {
          'eventId': eventId,
          'openToJoin': openToJoin,
        },
      ),
    );
  }

  @override
  Future<Result<void>> eventRemoveJoinRequest(String eventId) {
    return Result.guardFuture(
      () async => _dataSource.eventRemoveJoinRequest(
        {
          'eventId': eventId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> createInviteToFriend(String eventId, String userId) {
    return Result.guardFuture(
      () async => _dataSource.createInviteToFriend(
        {
          'eventId': eventId,
          'userId': userId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> removeInviteToFriend(String eventId, String userId) {
    return Result.guardFuture(
      () async => _dataSource.removeInviteToFriend(
        {
          'eventId': eventId,
          'userId': userId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> acceptRequest(String requestId) {
    return Result.guardFuture(
      () async => _dataSource.acceptRequest(
        {
          'requestId': requestId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> declineRequest(String requestId) {
    return Result.guardFuture(
      () async => _dataSource.declineRequest(
        {
          'requestId': requestId,
        },
      ),
    );
  }

  @override
  Future<Result<List<EventRequestModel>>> getRequestEvent({
    int? pagination,
    String? eventId,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getRequestEvent(
        pagination: pagination,
        eventId: eventId,
      ),
    );
  }

  @override
  Future<Result<EventAllUsersModel>> getUserEvent({
    int? pagination,
    String? eventId,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getUserEvent(
        pagination: pagination,
        eventId: eventId,
      ),
    );
  }

  @override
  Future<Result<List<EventFriendInviteModel>>> getEventUsersInvite({
    int? pagination,
    String? eventId,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getEventUsersInvite(
        pagination: pagination,
        eventId: eventId,
      ),
    );
  }

  @override
  Future<Result<List<UserSearchModel>>> getEventFriendInviteList({
    int? pagination,
    String? eventId,
    String? keyword,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getEventFriendInviteList(
        pagination: pagination,
        eventId: eventId,
      ),
    );
  }

  @override
  Future<Result<void>> eventLike(String eventId) {
    return Result.guardFuture(
      () async => _dataSource.eventLike(
        {
          'eventId': eventId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> eventUnlike(String eventId) {
    return Result.guardFuture(
      () async => _dataSource.eventUnlike(
        {
          'eventId': eventId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> eventCommentCreateReply(
    String? commentId,
    String? replayId,
    String comment,
  ) {
    return Result.guardFuture(
      () async => _dataSource.eventCommentCreateReply(
        commentId != null
            ? {
                'commentId': commentId,
                'comment': comment,
              }
            : {
                'replyId': replayId,
                'comment': comment,
              },
      ),
    );
  }

  @override
  Future<Result<void>> createCommentOrReplyLike({
    String? replyId,
    String? commentId,
  }) {
    return Result.guardFuture(
      () async => _dataSource.createCommentOrReplyLike(
        {
          'replyId': replyId,
          'commentId': commentId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> removeCommentOrReplyLike({
    String? replyId,
    String? commentId,
  }) {
    return Result.guardFuture(
      () async => _dataSource.removeCommentOrReplyLike(
        {
          'replyId': replyId,
          'commentId': commentId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> commentMark(
    String commentId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.commentMark(
        {
          'commentId': commentId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> commentUnMark(
    String commentId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.commentUnMark(
        {
          'commentId': commentId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> updateCommentPrivacy(
    String eventId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.updateCommentPrivacy(
        {
          'eventId': eventId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> updateApplauseCount(int applauseCount) {
    return Result.guardFuture(
      () async => _dataSource.updateApplauseCount(
        {
          'applauseCount': applauseCount,
        },
      ),
    );
  }

  @override
  Future<Result<void>> createEventRating(
    String eventId,
    double rating,
    String description,
  ) {
    return Result.guardFuture(
      () async => _dataSource.createEventRating(
        {
          'eventId': eventId,
          'rating': rating,
          'description': description,
        },
      ),
    );
  }

  @override
  Future<Result<void>> removeEventRating(
    String id,
  ) {
    return Result.guardFuture(
      () async => _dataSource.removeEventRating(
        {
          'id': id,
        },
      ),
    );
  }

  @override
  Future<Result<void>> removeEvent(
    String eventId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.removeEvent(
        {
          'eventId': eventId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> leaveEvent(
    String eventId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.leaveEvent(
        {
          'eventId': eventId,
        },
      ),
    );
  }
}
