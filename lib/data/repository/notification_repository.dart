import 'package:togodo/data/model/notification/notification_model.dart';
import 'package:togodo/data/model/result.dart';

abstract class NotificationRepository {
  Future<Result<void>> acceptInvite(String inviteId, String userId);
  Future<Result<void>> declineInvite(String inviteId, String userId);
  Future<Result<void>> acceptRequest(String requestId, String userId);
  Future<Result<void>> declineRequest(String requestId, String userId);
  Future<Result<String>> getUserHasUnread();
  Future<Result<List<NotificationModel>>> getUserNotification(
    int? pagination,
  );
}
