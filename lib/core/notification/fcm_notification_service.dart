// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/notification/fcm_model.dart';
import 'package:togodo/core/route/app_route.gr.dart';

Future<void> onBackgroundMessages(
  RemoteMessage message,
) async {
  // ignore: body_might_complete_normally_catch_error
  await Firebase.initializeApp().catchError((dynamic e) {
    log('Firebase init error: $e');
  });

  final data = message.data;

  data['type'] as String?;
}

class FCM {
  final streamCtlr = StreamController<FcmModel>.broadcast();

  void setNotifications(
    BuildContext context,
    StackRouter router,
    WidgetRef ref,
    String currentUserId,
  ) {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.data["toUser"] == currentUserId) {
        navigateBasedOnType(
          message,
          router,
        );
      }
    });
    FirebaseMessaging.onMessage.listen(
      (message) {
        try {
          final model = FcmModel.fromJson(message.data);
          if (model.toUser == currentUserId) {
            streamCtlr.sink.add(model);
          }
        } catch (e) {
          log('Error while receiving a message: $e');
        }
      },
    );

    /*   try {
      FirebaseMessaging.onBackgroundMessage(
        (message) async {
          final msg = FcmModel.fromJson(message.data);
          ref.read(notificationStateProvider.notifier)
            ..updateMessage(msg.typeId == '1' ? true : false)
            ..updateNotification(
                msg.typeId == '2' || msg.typeId == '5' ? true : false);
          await onBackgroundMessage(
            message,
            router,
          );
        },
      );
    } catch (e) {
      print(e);
    } */
  }

  void dispose() {
    streamCtlr.close();
  }
}

Future<void> onBackgroundMessage(
  RemoteMessage message,
  StackRouter router,
) async {
  // ignore: body_might_complete_normally_catch_error
  await Firebase.initializeApp().catchError((dynamic e) {
    log('Firebase init error: $e');
  });

  await navigateBasedOnType(message, router);
}

Future<void> navigateBasedOnType(
  RemoteMessage message,
  StackRouter router,
) async {
  final data = FcmModel.fromJson(message.data);
  if ('1' == data.isEventGroup) {
    await router.push(
      GroupRoute(
        id: data.chatRoomId ?? '',
      ),
    );
  } else {
    switch (data.type) {
      case 'EventLike':
      case 'EventComment':
      case 'EventUpdateLocationToUser':
      case 'EventUpdateTimeToUser':
      case 'EventUpdateDateToUser':
        await router.push(
          EventDetailsRoute(
            eventId: data.eventId!,
            isNotification: true,
          ),
        );

      case 'EventRequestToOwner':
      case 'EventRequestToEventOwner':
      case 'EventRequestToFriend':
      case 'EventRequestAcceptByEventOwner':
      case 'EventRequestAcceptByFriend':
      case 'FriendRequest':
        await router.push(
          NotificationRoute(isNotification: true),
        );

      case 'TextMessage':
      case 'ImageMessage':
      case 'VideoMessage':
      case 'EventShareMessage':
      case 'AudioMessage':
      case 'EventRequestMessage':
        await router.push(
          ChatRoute(
            userId: data.userId ?? '',
            roomId: data.chatRoomId,
            name: data.userFullName!,
            imageUrl: data.userProfileImage!,
            isOnline: false,
            isNotificationRoute: true,
            isGroup: data.isGroup == 'true',
          ),
        );
      case 'EventGroup':
        await router.push(
          GroupRoute(
            id: data.requestId ?? '',
          ),
        );
      case 'EventGroupMessage':
      case 'Applause':
        if (data.eventId != null) {
          await router.push(
            EventDetailsRoute(
              eventId: data.eventId!,
              applauseCount: data.applauseCount,
              isNotification: true,
            ),
          );
        }
      /* else {
        showApplauseWon(
          theme,
          l10n,
          context,
          data.applauseCount ?? '',
        );
      }
 */
      default:
        break;
    }
  }
}
