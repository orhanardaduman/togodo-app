// ignore_for_file: avoid_positional_boolean_parameters

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/repository/notification_repository.dart';
import 'package:togodo/data/repository/notification_repository_impl.dart';

final notificationStateProvider =
    StateNotifierProvider<NotificationState, NotificationModel>(
  NotificationState.new,
);

class NotificationState extends StateNotifier<NotificationModel> {
  NotificationState(
    this._ref,
  ) : super(NotificationModel());
  final Ref _ref;

  late final NotificationRepository _repository =
      _ref.read(notificationRepositoryProvider);
  void updateNotification(bool newNotification) {
    state = state.copyWith(newNotification: newNotification, hasUnread: false);
  }

  void updateMessage(bool newMessage) {
    state = state.copyWith(newMessage: newMessage, hasUnread: false);
  }

  Future<void> getHasUnread() async {
    final result = await _repository.getUserHasUnread();
    try {
      state = state.copyWith(hasUnread: result.dataOrThrow == 'true');
    } catch (_) {}
  }
}

class NotificationModel {
  NotificationModel({
    this.newNotification = false,
    this.newMessage = false,
    this.hasUnread = false,
  });
  final bool newNotification;
  final bool newMessage;
  final bool hasUnread;

  NotificationModel copyWith({
    bool? newNotification,
    bool? newMessage,
    bool? hasUnread,
  }) {
    return NotificationModel(
      newNotification: newNotification ?? this.newNotification,
      newMessage: newMessage ?? this.newMessage,
      hasUnread: hasUnread ?? this.hasUnread,
    );
  }
}

final bottomMenuStateProvider =
    StateNotifierProvider<BottomMenuState, bool>((ref) {
  return BottomMenuState();
});

class BottomMenuState extends StateNotifier<bool> {
  BottomMenuState() : super(false);

  // ignore: use_setters_to_change_properties
  void updateBottomMenu(bool isChangePage) {
    state = isChangePage;
  }
}
