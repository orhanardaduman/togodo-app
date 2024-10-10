import 'package:togodo/data/model/event/concept_image_model.dart';
import 'package:togodo/data/model/event/event_comment_model.dart';
import 'package:togodo/data/model/event/event_details_model.dart';
import 'package:togodo/data/model/event/event_friend_invite_model.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/event/event_request_model.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/data/model/result.dart';

import '../../ui/chat/model/message_info_model.dart';
import '../model/event/event_all_users_model.dart';

abstract class HomeRepository {
  Future<Result<List<EventModel>>> getTimelineEvents({
    int? pagination,
  });
  Future<Result<List<EventModel>>> getTimelineEventsDaily({
    int? pagination,
  });
  Future<Result<List<EventModel>>> getTimelineEventsGuest({
    int? pagination,
  });
  Future<Result<EventDetailsModel>> getEventDetails({
    String? eventId,
  });
  Future<Result<EventDetailsModel>> getEventGuest({
    String? eventId,
  });
  Future<Result<List<EventCommentModel>>> getEventComments({
    int? pagination,
    String? eventId,
  });
  Future<Result<List<EventCommentModel>>> getEventCommentsReplies({
    int? pagination,
    String? commentOrReplyId,
  });
  Future<Result<List<EventRequestModel>>> getRequestEvent({
    int? pagination,
    String? eventId,
  });
  Future<Result<EventAllUsersModel>> getUserEvent({
    int? pagination,
    String? eventId,
  });
  Future<Result<List<EventFriendInviteModel>>> getEventUsersInvite({
    int? pagination,
    String? eventId,
  });
  Future<Result<List<ConceptImageModel>>> getTagImages({int? tagId});
  Future<Result<List<UserSearchModel>>> getEventFriendInviteList({
    int? pagination,
    String? eventId,
    String? keyword,
  });
  Future<Result<void>> eventCommentCreate(String eventId, String comment);
  Future<Result<void>> eventCommentRemove({String? commentId, String? replyId});
  Future<Result<void>> eventJoinRequest(
    String eventId, {
    bool openToJoin = false,
  });
  Future<Result<void>> eventRemoveJoinRequest(String eventId);
  Future<Result<void>> createInviteToFriend(String eventId, String userId);
  Future<Result<void>> removeInviteToFriend(String eventId, String userId);
  Future<Result<void>> acceptRequest(String requestId);
  Future<Result<void>> acceptInvate(String invateId);

  Future<Result<void>> declineRequest(String requestId);
  Future<Result<void>> eventLike(String eventId);
  Future<Result<void>> eventUnlike(String eventId);
  Future<Result<void>> updateApplauseCount(int applauseCount);
  Future<Result<void>> eventCommentCreateReply(
    String? commentId,
    String? replayId,
    String comment,
  );
  Future<Result<void>> createCommentOrReplyLike({
    String? replyId,
    String? commentId,
  });
  Future<Result<void>> removeCommentOrReplyLike({
    String? replyId,
    String? commentId,
  });
  Future<Result<void>> updateCommentPrivacy(
    String eventId,
  );
  Future<Result<void>> commentMark(
    String commentId,
  );
  Future<Result<void>> commentUnMark(
    String commentId,
  );
  Future<Result<void>> createEventRating(
    String eventId,
    double rating,
    String description,
  );
  Future<Result<void>> removeEventRating(
    String id,
  );
  Future<Result<void>> removeEvent(
    String eventId,
  );
  Future<Result<void>> leaveEvent(
    String eventId,
  );
  Future<Result<void>> updateEventSort(
    String? eventId,
    String? sortNumber,
  );
  Future<Result<GroupRequestDetail>> createGroupRequest(
    String? eventId,
  );

  Future<Result<void>> deleteGroupRequest(
    String? eventId,
  );
  Future<Result<List<MessageInfoModel>>> getGroupMessages(
    String? groupId,
  );
  Future<Result<void>> sendMessageReaction(
    String messageId,
    String reaction,
  );
  Future<Result<void>> deleteMessage(
    String messageId,
  );
}
