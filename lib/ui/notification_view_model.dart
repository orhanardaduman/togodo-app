// ignore_for_file: avoid_positional_boolean_parameters

import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationStateProvider =
    StateNotifierProvider<NotificationState, NotificationModel>((ref) {
  return NotificationState();
});

class NotificationState extends StateNotifier<NotificationModel> {
  NotificationState() : super(NotificationModel());

  void updateNotification(bool newNotification) {
    state = state.copyWith(newNotification: newNotification);
  }

  void updateMessage(bool newMessage) {
    state = state.copyWith(newMessage: newMessage);
  }
}

class NotificationModel {
  NotificationModel({this.newNotification = false, this.newMessage = false});
  final bool newNotification;
  final bool newMessage;

  NotificationModel copyWith({
    bool? newNotification,
    bool? newMessage,
  }) {
    return NotificationModel(
      newNotification: newNotification ?? this.newNotification,
      newMessage: newMessage ?? this.newMessage,
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
