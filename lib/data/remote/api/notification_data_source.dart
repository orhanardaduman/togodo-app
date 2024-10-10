import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:togodo/core/network/api/app_dio.dart';
import 'package:togodo/data/model/notification/notification_model.dart';

import '../../../ui/group/model/group_model.dart';
import '../../model/event/event_rating_needed_model.dart';

part 'notification_data_source.g.dart';

final notificationDataSourceProvider = Provider(NotificationDataSource.new);

@RestApi()
abstract class NotificationDataSource {
  factory NotificationDataSource(ProviderRef<dynamic> ref) =>
      _NotificationDataSource(ref.read(dioProvider));

  @GET('User/GetUserNotification')
  Future<List<NotificationModel>> getUserNotification({
    @Query('pagination') int? pagination,
  });
  @POST('Event/AcceptRequest')
  Future<dynamic> acceptRequest(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('Event/DeclineRequest')
  Future<dynamic> declineRequest(
    @Body() Map<String, dynamic> data,
  );
  @POST('Event/AcceptInvite')
  Future<dynamic> acceptInvite(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('Event/DeclineInvite')
  Future<dynamic> declineInvite(
    @Body() Map<String, dynamic> data,
  );
  @GET('User/UnreadCount')
  Future<String> unreadCount();

  @GET('User/UnreadCountMessage')
  Future<String> unreadCountMessage();

  @GET('Event/UserRatingNeededEvents')
  Future<List<EventRatingNeededModel>> neededRatings();

  @POST('Event/NeverShow')
  Future<dynamic> neverShow(
    @Body() Map<String, dynamic> data,
  );

  @POST('Event/AskLater')
  Future<dynamic> askLater(
    @Body() Map<String, dynamic> data,
  );

  @POST('Event/AddUserRating')
  Future<dynamic> addPoint(
    @Body() Map<String, dynamic> data,
  );

  @GET('Event/EventGroupCloseDialog')
  Future<dynamic> closeDialog(
    @Query('groupId') String? groupId,
  );

  @GET('Event/EventGroupNeverShowDialog')
  Future<dynamic> neverShowDialog(
    @Query('groupId') String? groupId,
  );

  @GET('Event/UserEventGroupsDialog')
  Future<List<GroupDetailModelForDialog>> hasEventDialog();
}
