import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:togodo/core/network/api/app_dio.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/notification/notification_model.dart';
import 'package:togodo/data/model/profil/daily_reports_model.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/data/model/profil/reports_model.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';

import '../../../ui/profile/model/user_accounts_model.dart';

part 'profil_data_source.g.dart';

final profilDataSourceProvider = Provider(ProfilDataSource.new);

@RestApi()
abstract class ProfilDataSource {
  factory ProfilDataSource(ProviderRef<dynamic> ref) =>
      _ProfilDataSource(ref.read(dioProvider));

  @GET('User/GetUserProfile')
  Future<ProfilModel> getProfil({
    @Query('c') String? userId,
  });
  @GET('Admin/GetUserCount')
  Future<DailyReportsModel> getUserCount();
  @GET('Admin/GetReports')
  Future<List<ReportsModel>> getReports();
  @GET('User/GetUserRecommendedUsers')
  Future<List<UserSearchModel>> getUserRecommendedUsers();
  @GET('Search/GetSocialMedias')
  Future<List<SocialMedias>> getSocialMedias();
  @GET('Search/GetUserSearch')
  Future<List<UserSearchModel>> getUserSearch({
    @Query('keyword') String? keyword,
  });

  @GET('User/GetUserFriends')
  Future<List<UserSearchModel>> getUserFriends({
    @Query('pagination') int? pagination,
    @Query('userId') String? userId,
    @Query('keyword') String? keyword,
  });
  @GET('User/GetUserFollowed')
  Future<List<UserSearchModel>> getUserFollowed({
    @Query('pagination') int? pagination,
    @Query('userId') String? userId,
    @Query('keyword') String? keyword,
  });
  @GET('User/GetUserFriendRequests')
  Future<List<UserSearchModel>> getUserFriendsRequests({
    @Query('pagination') int? pagination,
  });
  @GET('User/GetUserFollowersUsers')
  Future<List<UserSearchModel>> getUserFollowersUsers({
    @Query('pagination') int? pagination,
    @Query('userId') String? userId,
  });
  @POST('FriendRelation/AddRequest')
  Future<dynamic> addRequest(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('FriendRelation/RemoveRequest')
  Future<dynamic> removeRequest(
    @Body() Map<String, dynamic> data,
  );
  @POST('FriendRelation/AcceptRequest')
  Future<dynamic> acceptRequest(
    @Body() Map<String, dynamic> data,
  );
  @PUT('FollowRelation/UpdateNotification')
  Future<dynamic> updateNotification(
    @Body() Map<String, dynamic> data,
  );
  @POST('FollowRelation/AddFollow')
  Future<dynamic> addFollow(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('FollowRelation/RemoveFollow')
  Future<dynamic> removeFollow(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('FriendRelation/DeclineRequest')
  Future<dynamic> declineRequest(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('FriendRelation/RemoveFriend')
  Future<dynamic> removeFriend(
    @Body() Map<String, dynamic> data,
  );
  @POST('Auth/Logout')
  Future<dynamic> logout(
    @Body() Map<String, dynamic> data,
  );
  @GET('User/GetUserBlocked')
  Future<List<UserSearchModel>> getUserBlocked({
    @Query('pagination') int? pagination,
  });
  @GET('User/GetUserEvents')
  Future<List<EventModel>> getUserEvents({
    @Query('userId') String? userId,
    @Query('pagination') int? pagination,
  });
  @GET('User/GetUserCreatedEvents')
  Future<List<EventModel>> getUserCreateEvents({
    @Query('userId') String? userId,
    @Query('pagination') int? pagination,
  });
  @GET('User/GetUserDraftEvents')
  Future<List<EventModel>> getUserDraftEvents({
    @Query('pagination') int? pagination,
  });
  @GET('User/GetUserDraftAndCreatedEvent')
  Future<List<EventModel>> getUserDraftAndCreatedEvent({
    @Query('pagination') int? pagination,
  });
  @GET('User/GetUserRequestedEvents')
  Future<List<EventModel>> getUserRequestedEvents({
    @Query('pagination') int? pagination,
  });
  @GET('User/GetUserNotification')
  Future<List<NotificationModel>> getUserNotification({
    @Query('pagination') int? pagination,
  });
  @GET('User/GetUserLikedEvents')
  Future<List<EventModel>> getUserLikedEvents({
    @Query('pagination') int? pagination,
    @Query('userId') String? userId,
  });
  @GET('User/GetUserJoinedEvents')
  Future<List<EventModel>> getUserJoinedEvents({
    @Query('pagination') int? pagination,
    @Query('userId') String? userId,
  });

  @POST('BlockRelation/Create')
  Future<dynamic> blockRelation(
    @Body() Map<String, dynamic> data,
  );
  @POST('BlockRelation/CreateReportUser')
  Future<dynamic> createReportUser(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('BlockRelation/Remove')
  Future<dynamic> unblockRelation(
    @Body() Map<String, dynamic> data,
  );
  @PUT('Setting/UpdatePrivacyType')
  Future<dynamic> updatePrivacyType(
    @Body() Map<String, dynamic> data,
  );
  @PUT('User/UpdateLanguage')
  Future<dynamic> updateLanguage(
    @Body() Map<String, dynamic> data,
  );
  @POST('BlockRelation/CreateHideEvent')
  Future<dynamic> createHideEvent(
    @Body() Map<String, dynamic> data,
  );
  @DELETE('BlockRelation/RemoveHideEvent')
  Future<dynamic> removeHideEvent(
    @Body() Map<String, dynamic> data,
  );
  @GET('User/GetUserHideEventsToUser')
  Future<List<UserSearchModel>> getUserHideEventsToUser({
    @Query('pagination') int? pagination,
    @Query('status') bool? status,
  });
  @POST('User/AddPoint')
  Future<String> addPoint(
    @Body() Map<String, dynamic> data,
  );

  @POST('User/SavedAccountDetail')
  Future<List<UserAccountsModel>> getSavedAccounts(
    @Body() Map<String, dynamic> data,
  );
}
