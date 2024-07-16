import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/profil/daily_reports_model.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/data/model/profil/reports_model.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/data/model/result.dart';

abstract class ProfilRepository {
  Future<Result<ProfilModel>> getProfil({String? userId});
  Future<Result<DailyReportsModel>> getUserCount();
  Future<Result<List<ReportsModel>>> getReports();
  Future<Result<List<SocialMedias>>> getSocialMedias();
  Future<Result<List<UserSearchModel>>> getUserSearch(
    String? keyword,
  );
  Future<Result<List<UserSearchModel>>> getUserRecommendedUsers();

  Future<Result<List<UserSearchModel>>> getUserFriends(
    int? pagination,
    String? userId,
    String? keyword,
  );
  Future<Result<List<UserSearchModel>>> getUserFollowed(
    int? pagination,
    String? userId,
    String? keyword,
  );
  Future<Result<List<UserSearchModel>>> getUserFriendsRequests(
    int? pagination,
  );
  Future<Result<List<UserSearchModel>>> getUserFollowersUsers(
    String? userId,
    int? pagination,
  );
  Future<Result<void>> addFollow(String userId);
  Future<Result<void>> removeFollow(String userId);
  Future<Result<void>> addRequest(String userId);

  Future<Result<void>> removeRequest(String userId);
  Future<Result<void>> acceptRequest(String userId);
  Future<Result<void>> declineRequest(String userId);
  Future<Result<void>> removeFriend(String userId);
  Future<Result<void>> blockRelation(
    String userId,
    bool isEmptyUser,
  );
  Future<Result<void>> unblockRelation(String userId);
  Future<Result<void>> updatePrivacyType(int type);
  Future<Result<void>> updateLanguage(String name);
  Future<Result<void>> updateNotification(String userId);
  Future<Result<void>> createReportUser(
    String userId,
    String? eventId,
    String description,
  );

  Future<Result<void>> logout();
  Future<Result<List<UserSearchModel>>> getUserBlocked(
    int? pagination,
  );
  Future<Result<List<EventModel>>> getUserLikedEvents(
    int? pagination,
    String? userId,
  );
  Future<Result<List<EventModel>>> getUserDraftEvents(
    int? pagination,
  );
  Future<Result<List<EventModel>>> getUserDraftAndCreatedEvent(
    int? pagination,
  );
  Future<Result<List<EventModel>>> getUserEvents(
    String? userId,
    int? pagination,
  );
  Future<Result<List<EventModel>>> getUserCreateEvents(
    String? userId,
    int? pagination,
  );
  Future<Result<List<EventModel>>> getUserRequestedEvents(
    int? pagination,
  );
  Future<Result<List<EventModel>>> getUserJoinedEvents(
    String? userId,
    int? pagination,
  );
  Future<Result<void>> createHiddenEvent(String userId, {bool status = true});
  Future<Result<void>> removeHiddenEvent(String userId, {bool status = true});
  Future<Result<List<UserSearchModel>>> getUserHideEventsToUser(
    int? pagination, {
    bool status = true,
  });
}
