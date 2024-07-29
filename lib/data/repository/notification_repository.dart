import 'package:togodo/data/model/notification/notification_model.dart';
import 'package:togodo/data/model/result.dart';

import '../model/event/event_rating_needed_model.dart';

abstract class NotificationRepository {
  Future<Result<void>> acceptInvite(String inviteId, String userId);
  Future<Result<void>> declineInvite(String inviteId, String userId);
  Future<Result<void>> acceptRequest(String requestId, String userId);
  Future<Result<void>> declineRequest(String requestId, String userId);
  Future<Result<String>> getUserHasUnread();
  Future<Result<List<EventRatingNeededModel>>> getHasRatingNeeded();
  Future<Result<List<NotificationModel>>> getUserNotification(
    int? pagination,
  );
  Future<Result<void>> askLater(String eventUserId);
  Future<Result<void>> neverShow(String eventUserId);
  Future<Result<void>> rate(String eventUserId, int rate);
}
