import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/profil/daily_reports_model.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/data/model/profil/reports_model.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/data/model/result.dart';
import 'package:togodo/data/remote/api/profil_data_source.dart';
import 'package:togodo/data/repository/profil_repository.dart';

final profilRepositoryProvider = Provider(ProfilRepositoryImpl.new);

class ProfilRepositoryImpl implements ProfilRepository {
  ProfilRepositoryImpl(this._reader);

  final ProviderRef<dynamic> _reader;

  late final ProfilDataSource _dataSource =
      _reader.read(profilDataSourceProvider);

  @override
  Future<Result<ProfilModel>> getProfil({String? userId}) {
    return Result.guardFuture(
      () async => _dataSource.getProfil(userId: userId),
    );
  }

  @override
  Future<Result<List<SocialMedias>>> getSocialMedias() {
    return Result.guardFuture(
      () async => _dataSource.getSocialMedias(),
    );
  }

  @override
  Future<Result<DailyReportsModel>> getUserCount() {
    return Result.guardFuture(
      () async => _dataSource.getUserCount(),
    );
  }

  @override
  Future<Result<List<ReportsModel>>> getReports() {
    return Result.guardFuture(
      () async => _dataSource.getReports(),
    );
  }

  @override
  Future<Result<List<UserSearchModel>>> getUserRecommendedUsers() {
    return Result.guardFuture(
      () async => _dataSource.getUserRecommendedUsers(
          // For checking reload.

          ),
    );
  }

  @override
  Future<Result<List<UserSearchModel>>> getUserSearch(
    String? keyword,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserSearch(
        // For checking reload.
        keyword: keyword,
      ),
    );
  }

  @override
  Future<Result<List<UserSearchModel>>> getUserFriends(
    int? pagination,
    String? userId,
    String? keyword,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserFriends(
        pagination: pagination,
        userId: userId,
        keyword: keyword,
      ),
    );
  }

  @override
  Future<Result<List<UserSearchModel>>> getUserFollowed(
    int? pagination,
    String? userId,
    String? keyword,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserFollowed(
        pagination: pagination,
        userId: userId,
        keyword: keyword,
      ),
    );
  }

  @override
  Future<Result<List<UserSearchModel>>> getUserFriendsRequests(
    int? pagination,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserFriendsRequests(
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<List<UserSearchModel>>> getUserFollowersUsers(
    String? userId,
    int? pagination,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserFollowersUsers(
        userId: userId,
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<void>> logout() {
    return Result.guardFuture(
      () => _dataSource.logout({}),
    );
  }

  @override
  Future<Result<void>> acceptRequest(String userId) {
    return Result.guardFuture(
      () => _dataSource.acceptRequest({
        'userId': userId,
      }),
    );
  }

  @override
  Future<Result<void>> addRequest(String userId) {
    return Result.guardFuture(
      () => _dataSource.addRequest({
        'userId': userId,
      }),
    );
  }

  @override
  Future<Result<void>> declineRequest(String userId) {
    return Result.guardFuture(
      () => _dataSource.declineRequest({
        'userId': userId,
      }),
    );
  }

  @override
  Future<Result<void>> removeFriend(String userId) {
    return Result.guardFuture(
      () => _dataSource.removeFriend({
        'userId': userId,
      }),
    );
  }

  @override
  Future<Result<void>> removeRequest(String userId) {
    return Result.guardFuture(
      () => _dataSource.removeRequest({
        'userId': userId,
      }),
    );
  }

  @override
  Future<Result<List<UserSearchModel>>> getUserBlocked(
    int? pagination,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserBlocked(
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<List<EventModel>>> getUserLikedEvents(
    int? pagination,
    String? userId,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserLikedEvents(
        pagination: pagination,
        userId: userId,
      ),
    );
  }

  @override
  Future<Result<List<EventModel>>> getUserDraftEvents(
    int? pagination,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserDraftEvents(
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<List<EventModel>>> getUserDraftAndCreatedEvent(
    int? pagination,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserDraftAndCreatedEvent(
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<List<EventModel>>> getUserRequestedEvents(
    int? pagination,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserRequestedEvents(
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<List<EventModel>>> getUserEvents(
    String? userId,
    int? pagination,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserEvents(
        userId: userId,
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<List<EventModel>>> getUserJoinedEvents(
    String? userId,
    int? pagination,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserJoinedEvents(
        userId: userId,
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<void>> blockRelation(String userId) {
    return Result.guardFuture(
      () => _dataSource.blockRelation({
        'userId': userId,
      }),
    );
  }

  @override
  Future<Result<void>> unblockRelation(String userId) {
    return Result.guardFuture(
      () => _dataSource.unblockRelation({
        'userId': userId,
      }),
    );
  }

  @override
  Future<Result<void>> createReportUser(
    String userId,
    String? eventId,
    String description,
  ) {
    return Result.guardFuture(
      () => _dataSource.createReportUser({
        'userId': userId,
        'eventId': eventId,
        'description': description,
      }),
    );
  }

  @override
  Future<Result<void>> updatePrivacyType(int type) {
    return Result.guardFuture(
      () => _dataSource.updatePrivacyType({
        'type': type,
      }),
    );
  }

  @override
  Future<Result<List<EventModel>>> getUserCreateEvents(
    String? userId,
    int? pagination,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserCreateEvents(
        userId: userId,
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<void>> addFollow(String userId) {
    return Result.guardFuture(
      () => _dataSource.addFollow({
        'userId': userId,
      }),
    );
  }

  @override
  Future<Result<void>> removeFollow(String userId) {
    return Result.guardFuture(
      () => _dataSource.removeFollow({
        'userId': userId,
      }),
    );
  }

  @override
  Future<Result<void>> updateLanguage(String name) {
    return Result.guardFuture(
      () => _dataSource.updateLanguage({
        'name': name,
      }),
    );
  }

  @override
  Future<Result<void>> updateNotification(String userId) {
    return Result.guardFuture(
      () => _dataSource.updateNotification({
        'userId': userId,
      }),
    );
  }

  @override
  Future<Result<void>> createHiddenEvent(String userId, {bool status = true}) {
    return Result.guardFuture(
      () => _dataSource.createHideEvent({
        'userId': userId,
        'status': status,
      }),
    );
  }

  @override
  Future<Result<void>> removeHiddenEvent(String userId, {bool status = true}) {
    return Result.guardFuture(
      () => _dataSource.removeHideEvent({
        'userId': userId,
      }),
    );
  }

  @override
  Future<Result<List<UserSearchModel>>> getUserHideEventsToUser(
    int? pagination, {
    bool status = true,
  }) {
    return Result.guardFuture(
      () async => _dataSource.getUserHideEventsToUser(
        pagination: pagination,
        status: status,
      ),
    );
  }
}
