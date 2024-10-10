// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/repository/notification_repository.dart';
import 'package:togodo/data/repository/notification_repository_impl.dart';

import '../data/model/event/event_rating_needed_model.dart';
import 'home/widget/event_group_dialog.dart';
import 'home/widget/event_point_dialog.dart';

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

  Future<void> getHasUnreadMessage() async {
    final result = await _repository.getUserHasUnreadMessage();
    try {
      state = state.copyWith(newMessage: result.dataOrThrow == 'true');
    } catch (_) {}
  }

  Future<void> hasNeededRatings(BuildContext parentContext) async {
    final result = await _repository.getHasRatingNeeded();
    try {
      if (result.dataOrThrow.isNotEmpty) {
        state = state.copyWith(needRating: result.dataOrThrow);
        showDialog(
            context: parentContext,
            builder: (context) => EventPointDialog(
                  data: result.dataOrThrow.first,
                ));
      }
    } catch (_) {}
  }

  Future<void> hasNeedEventGroup(BuildContext parentContext) async {
    final result = await _repository.hasEventDialog();
    print(result);
    try {
      if (result.dataOrThrow.isNotEmpty) {
        showDialog(
            context: parentContext,
            builder: (context) => EventGroupDialog(
                  data: result.dataOrThrow.first,
                )).then((_) {
          cloeDialog(
            result.dataOrThrow.first.id,
          );
        });
      }
    } catch (_) {}
  }

  Future<void> rate(EventRatingNeededModel model, int rate) async {
    final result = await _repository.rate(model.id ?? "", rate);
  }

  Future<void> askLater(EventRatingNeededModel model) async {
    final result = await _repository.askLater(model.id ?? "");
  }

  Future<void> neverAsk(EventRatingNeededModel model) async {
    final result = await _repository.neverShow(model.id ?? "");
  }

  Future<void> cloeDialog(String id) async {
    final result = await _repository.closeDialog(id);
  }

  Future<void> neverShowDialog(String id) async {
    final result = await _repository.neverShowDialog(id);
  }
}

class NotificationModel {
  NotificationModel({
    this.newNotification = false,
    this.newMessage = false,
    this.hasUnread = false,
    this.needRating,
  });
  final bool newNotification;
  final bool newMessage;
  final bool hasUnread;
  final List<EventRatingNeededModel>? needRating;

  NotificationModel copyWith({
    bool? newNotification,
    bool? newMessage,
    bool? hasUnread,
    List<EventRatingNeededModel>? needRating,
  }) {
    return NotificationModel(
      newNotification: newNotification ?? this.newNotification,
      newMessage: newMessage ?? this.newMessage,
      hasUnread: hasUnread ?? this.hasUnread,
      needRating: needRating ?? this.needRating,
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
