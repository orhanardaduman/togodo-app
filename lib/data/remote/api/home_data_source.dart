import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:togodo/core/network/api/app_dio.dart';
import 'package:togodo/data/model/event/concept_image_model.dart';
import 'package:togodo/data/model/event/event_comment_model.dart';
import 'package:togodo/data/model/event/event_details_model.dart';
import 'package:togodo/data/model/event/event_friend_invite_model.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/event/event_request_model.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';

part 'home_data_source.g.dart';

final homeDataSourceProvider = Provider(HomeDataSource.new);

@RestApi()
abstract class HomeDataSource {
  factory HomeDataSource(ProviderRef<dynamic> ref) =>
      _HomeDataSource(ref.read(dioProvider));

  @GET('Timeline/GetTimelineEvents')
  Future<List<EventModel>> getTimelineEvents({
    @Query('pagination') int? pagination,
  });
  @GET('Timeline/GetTimelineEventsDaily')
  Future<List<EventModel>> getTimelineEventsDaily({
    @Query('pagination') int? pagination,
  });
  @GET('External/GetTimeline')
  Future<List<EventModel>> getTimelineEventsGuest({
    @Query('pagination') int? pagination,
  });
  @GET('External/GetEvent')
  Future<EventDetailsModel> getEventGuest({
    @Query('eventId') String? eventId,
  });
  @GET('Timeline/GetEvent')
  Future<EventDetailsModel> getEventDetails({
    @Query('eventId') String? eventId,
  });
  @GET('Timeline/GetEventComments')
  Future<List<EventCommentModel>> getEventComments({
    @Query('pagination') int? pagination,
    @Query('eventId') String? eventId,
  });
  @GET('Timeline/GetEventCommentsReplies')
  Future<List<EventCommentModel>> getEventCommentsReplies({
    @Query('pagination') int? pagination,
    @Query('commentOrReplyId') String? commentOrReplyId,
  });
  @GET('Timeline/GetEventRequests')
  Future<List<EventRequestModel>> getRequestEvent({
    @Query('pagination') int? pagination,
    @Query('eventId') String? eventId,
  });
  @GET('Timeline/GetEventUsers')
  Future<List<EventFriendInviteModel>> getUserEvent({
    @Query('pagination') int? pagination,
    @Query('eventId') String? eventId,
  });
  @GET('Timeline/GetEventUsersInvite')
  Future<List<EventFriendInviteModel>> getEventUsersInvite({
    @Query('pagination') int? pagination,
    @Query('eventId') String? eventId,
  });
  @GET('Timeline/GetEventFriendInviteList')
  Future<List<UserSearchModel>> getEventFriendInviteList({
    @Query('pagination') int? pagination,
    @Query('eventId') String? eventId,
    @Query('keyword') String? keyword,
  });
  @GET('Search/GetTagImages')
  Future<List<ConceptImageModel>> getTagImages({
    @Query('tagId') int? tagId,
  });
  @POST('EventComment/Create')
  Future<dynamic> eventCommentCreate(
    @Body() Map<String, dynamic> data,
  );

  @DELETE('EventComment/Remove')
  Future<dynamic> eventCommentRemove(
    @Body() Map<String, dynamic> data,
  );
  @POST('EventComment/CreateReply')
  Future<dynamic> eventCommentCreateReply(
    @Body() Map<String, dynamic> data,
  );
  @POST('EventComment/CreateCommentOrReplyLike')
  Future<dynamic> createCommentOrReplyLike(
    @Body() Map<String, dynamic> data,
  );
  @POST('EventComment/CommentMark')
  Future<dynamic> commentMark(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('EventComment/RemoveCommentOrReplyLike')
  Future<dynamic> removeCommentOrReplyLike(
    @Body() Map<String, dynamic> data,
  );
  @PUT('EventComment/UpdateCommentPrivacy')
  Future<dynamic> updateCommentPrivacy(
    @Body() Map<String, dynamic> data,
  );
  @PUT('User/UpdateApplauseCount')
  Future<dynamic> updateApplauseCount(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('EventComment/CommentUnMark')
  Future<dynamic> commentUnMark(
    @Body() Map<String, dynamic> data,
  );
  @POST('Event/Like')
  Future<dynamic> eventLike(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('Event/Unlike')
  Future<dynamic> eventUnlike(
    @Body() Map<String, dynamic> data,
  );
  @POST('Event/CreateRequest')
  Future<dynamic> eventJoinRequest(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('Event/RemoveRequest')
  Future<dynamic> eventRemoveJoinRequest(
    @Body() Map<String, dynamic> data,
  );
  @POST('Event/CreateInviteToFriend')
  Future<dynamic> createInviteToFriend(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('Event/RemoveInviteToFriend')
  Future<dynamic> removeInviteToFriend(
    @Body() Map<String, dynamic> data,
  );
  @POST('Event/AcceptRequest')
  Future<dynamic> acceptRequest(
    @Body() Map<String, dynamic> data,
  );

  @DELETE('Event/DeclineRequest')
  Future<dynamic> declineRequest(
    @Body() Map<String, dynamic> data,
  );
  @POST('Event/CreateEventRating')
  Future<dynamic> createEventRating(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('Event/RemoveEventRating')
  Future<dynamic> removeEventRating(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('Event/RemoveEvent')
  Future<dynamic> removeEvent(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('Event/LeaveEvent')
  Future<dynamic> leaveEvent(
    @Body() Map<String, dynamic> data,
  );
}
