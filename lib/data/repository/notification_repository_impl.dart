import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/notification/notification_model.dart';
import 'package:togodo/data/model/result.dart';
import 'package:togodo/data/remote/api/notification_data_source.dart';
import 'package:togodo/data/repository/notification_repository.dart';

import '../model/event/event_rating_needed_model.dart';

final notificationRepositoryProvider = Provider(NotificationRepositoryImpl.new);

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl(this._reader);

  final ProviderRef<dynamic> _reader;

  late final NotificationDataSource _dataSource =
      _reader.read(notificationDataSourceProvider);

  @override
  Future<Result<void>> acceptInvite(String inviteId, String userId) {
    return Result.guardFuture(
      () async => _dataSource.acceptInvite(
        {
          'inviteId': inviteId,
          'userId': userId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> declineInvite(String inviteId, String userId) {
    return Result.guardFuture(
      () async => _dataSource.declineInvite(
        {
          'inviteId': inviteId,
          'userId': userId,
        },
      ),
    );
  }

  @override
  Future<Result<List<NotificationModel>>> getUserNotification(
    int? pagination,
  ) {
    return Result.guardFuture(
      () async => _dataSource.getUserNotification(
        pagination: pagination,
      ),
    );
  }

  @override
  Future<Result<void>> acceptRequest(String requestId, String userId) {
    return Result.guardFuture(
      () async => _dataSource.acceptRequest(
        {
          'requestId': requestId,
          'userId': userId,
        },
      ),
    );
  }

  @override
  Future<Result<void>> declineRequest(String requestId, String userId) {
    return Result.guardFuture(
      () async => _dataSource.declineRequest(
        {
          'requestId': requestId,
          'userId': userId,
        },
      ),
    );
  }

  @override
  Future<Result<String>> getUserHasUnread() {
    return Result.guardFuture(
      () async => _dataSource.unreadCount(),
    );
  }

  @override
  Future<Result<String>> getUserHasUnreadMessage() {
    return Result.guardFuture(
      () async => _dataSource.unreadCountMessage(),
    );
  }

  @override
  Future<Result<List<EventRatingNeededModel>>> getHasRatingNeeded() {
    return Result.guardFuture(
      () async => _dataSource.neededRatings(),
    );
  }

  @override
  Future<Result<void>> askLater(String eventUserId) {
    return Result.guardFuture(
      () async => _dataSource.askLater({
        "eventUserId": eventUserId,
      }),
    );
  }

  @override
  Future<Result<void>> neverShow(String eventUserId) {
    return Result.guardFuture(
      () async => _dataSource.neverShow({
        "eventUserId": eventUserId,
      }),
    );
  }

  @override
  Future<Result<void>> rate(String eventUserId, int rate) {
    return Result.guardFuture(
      () async => _dataSource.addPoint({
        "point": rate,
        "eventUserId": eventUserId,
      }),
    );
  }
}
