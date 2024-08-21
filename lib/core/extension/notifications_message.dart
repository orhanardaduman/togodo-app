import 'package:flutter_gen/gen_l10n/l10n.dart';

extension NotificationTypeExtension on String {
  String notificationMessage(L10n l10n) {
    switch (this) {
      case 'EventLike':
        return l10n.eventLiked;
      case 'EventComment':
        return l10n.eventCommented;
      case 'FriendRequest':
        return l10n.friendRequest;
      case 'EventUpdateLocationToUser':
        return l10n.eventLocationUpdated;
      case 'EventUpdateTimeToUser':
        return l10n.eventTimeUpdated;
      case 'EventUpdateDateToUser':
        return l10n.eventDateUpdated;
      case 'EventRemovedToUser':
        return l10n.eventCancelled;
      case 'EventRequestToEventOwnerWithFriend':
      case 'EventRequestToEventOwner':
        return l10n.eventRequestToEventOwner;
      case 'EventRequestAcceptByEventOwner':
        return l10n.eventJoinRequestAcceptedByOwner;
      case 'EventRequestToFriend':
        return l10n.eventRequestToFriend;
      case 'EventLimitOverToEventOwner':
        return l10n.eventCapacityFull;
      case 'EventLimitUpdateToUser':
        return l10n.eventCapacityOpened;
      case 'EventLimitOverToUser':
        return l10n.eventCapacityReached;
      case 'EventRequestAcceptByFriend':
        return l10n.eventRequestAcceptByFriend;
      case 'EventRequestAcceptByFriendForFriend':
        return l10n.eventRequestAcceptByFriendForFriend;
      case 'FriendRequestAccept':
        return l10n.friendRequestAccept;
      case 'FriendRequestDecline':
        return l10n.friendRequestReject;
      case 'Applause':
        return l10n.earnedApplause;
      case 'EventRemoved':
        return l10n.eventRemoved;
      case 'EventUpdateNameToUser':
        return l10n.eventNameUpdated;
      case 'Follow':
        return l10n.followNot;
      case 'EventCommentLike':
        return l10n.eventCommentLike;
      case 'NewEvent':
        return l10n.newEvent;
      case 'EventRate':
        return l10n.eventRated;
      default:
        return l10n.unknownNotification;
    }
  }
}
