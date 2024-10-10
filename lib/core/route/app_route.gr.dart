// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i51;
import 'package:flutter/cupertino.dart' as _i57;
import 'package:flutter/foundation.dart' as _i56;
import 'package:flutter/material.dart' as _i52;
import 'package:togodo/core/theme/app_theme.dart' as _i53;
import 'package:togodo/data/model/event/event_details_model.dart' as _i55;
import 'package:togodo/data/model/event/event_model.dart' as _i54;
import 'package:togodo/ui/auth/signin.dart' as _i39;
import 'package:togodo/ui/auth/signup.dart' as _i40;
import 'package:togodo/ui/auth/verifty_phone.dart' as _i48;
import 'package:togodo/ui/auth/verify_email.dart' as _i46;
import 'package:togodo/ui/auth/verify_phone_normal.dart' as _i47;
import 'package:togodo/ui/auth/welcome_question/view/hoby_question.dart'
    as _i24;
import 'package:togodo/ui/auth/welcome_question/view/user_image_question.dart'
    as _i43;
import 'package:togodo/ui/auth/welcome_question/view/user_type_question.dart'
    as _i45;
import 'package:togodo/ui/bottom_menu.dart' as _i4;
import 'package:togodo/ui/chat/screens/add_group_chat_users.dart' as _i1;
import 'package:togodo/ui/chat/screens/chat_details_page.dart' as _i6;
import 'package:togodo/ui/chat/screens/chat_home_page.dart' as _i5;
import 'package:togodo/ui/chat/screens/chat_user_search_page.dart' as _i36;
import 'package:togodo/ui/chat/screens/group_details.dart' as _i22;
import 'package:togodo/ui/chat/screens/new_group_page.dart' as _i29;
import 'package:togodo/ui/comment/comment.dart' as _i7;
import 'package:togodo/ui/common/splash_view.dart' as _i41;
import 'package:togodo/ui/common/welcome.dart' as _i49;
import 'package:togodo/ui/discover/discover_search_page.dart' as _i11;
import 'package:togodo/ui/discover/view/discover_page.dart' as _i10;
import 'package:togodo/ui/discover/view/discovery_map.dart' as _i12;
import 'package:togodo/ui/discover/widget_test.dart' as _i50;
import 'package:togodo/ui/event/create_event_page.dart' as _i8;
import 'package:togodo/ui/event/view/draft.dart' as _i13;
import 'package:togodo/ui/event/view/ready_template.dart' as _i33;
import 'package:togodo/ui/event/view/ready_template_pixexls.dart' as _i34;
import 'package:togodo/ui/event/view/success_page.dart' as _i9;
import 'package:togodo/ui/group/pages/group_page.dart' as _i23;
import 'package:togodo/ui/home/home_page.dart' as _i25;
import 'package:togodo/ui/home/view/event_details.dart' as _i15;
import 'package:togodo/ui/home/view/event_request.dart' as _i18;
import 'package:togodo/ui/home/view/join_with_friends.dart' as _i26;
import 'package:togodo/ui/home/view/joined_user.dart' as _i16;
import 'package:togodo/ui/home/widget/event_ratings_all.dart' as _i17;
import 'package:togodo/ui/likes/likes_page.dart' as _i28;
import 'package:togodo/ui/notification/notification_page.dart' as _i30;
import 'package:togodo/ui/profile/view/followers_user_page.dart' as _i19;
import 'package:togodo/ui/profile/view/friends_search_page.dart' as _i21;
import 'package:togodo/ui/profile/view/friends_view.dart' as _i20;
import 'package:togodo/ui/profile/view/profil_edit_page.dart' as _i31;
import 'package:togodo/ui/profile/view/profile_page.dart' as _i32;
import 'package:togodo/ui/profile/view/user_profil_page.dart' as _i44;
import 'package:togodo/ui/settings/admin_dashboard_page.dart' as _i2;
import 'package:togodo/ui/settings/block_user.dart' as _i3;
import 'package:togodo/ui/settings/event_block.dart' as _i14;
import 'package:togodo/ui/settings/language_settings.dart' as _i27;
import 'package:togodo/ui/settings/remove_user_page.dart' as _i35;
import 'package:togodo/ui/settings/security_page.dart' as _i37;
import 'package:togodo/ui/settings/settings_page.dart' as _i38;
import 'package:togodo/ui/settings/theme_settings_page.dart' as _i42;

/// generated route for
/// [_i1.AddGroupChatUserPage]
class AddGroupChatUserRoute
    extends _i51.PageRouteInfo<AddGroupChatUserRouteArgs> {
  AddGroupChatUserRoute({
    required String roomId,
    _i52.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          AddGroupChatUserRoute.name,
          args: AddGroupChatUserRouteArgs(
            roomId: roomId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddGroupChatUserRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddGroupChatUserRouteArgs>();
      return _i1.AddGroupChatUserPage(
        roomId: args.roomId,
        key: args.key,
      );
    },
  );
}

class AddGroupChatUserRouteArgs {
  const AddGroupChatUserRouteArgs({
    required this.roomId,
    this.key,
  });

  final String roomId;

  final _i52.Key? key;

  @override
  String toString() {
    return 'AddGroupChatUserRouteArgs{roomId: $roomId, key: $key}';
  }
}

/// generated route for
/// [_i2.AdminDashboardPage]
class AdminDashboardRoute extends _i51.PageRouteInfo<void> {
  const AdminDashboardRoute({List<_i51.PageRouteInfo>? children})
      : super(
          AdminDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminDashboardRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i2.AdminDashboardPage();
    },
  );
}

/// generated route for
/// [_i3.BlockUserPage]
class BlockUserRoute extends _i51.PageRouteInfo<void> {
  const BlockUserRoute({List<_i51.PageRouteInfo>? children})
      : super(
          BlockUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlockUserRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i3.BlockUserPage();
    },
  );
}

/// generated route for
/// [_i4.BottomMenuPage]
class BottomMenuRoute extends _i51.PageRouteInfo<void> {
  const BottomMenuRoute({List<_i51.PageRouteInfo>? children})
      : super(
          BottomMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomMenuRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i4.BottomMenuPage();
    },
  );
}

/// generated route for
/// [_i5.ChatHomePage]
class ChatHomeRoute extends _i51.PageRouteInfo<ChatHomeRouteArgs> {
  ChatHomeRoute({
    _i52.Key? key,
    bool isNotificationRoute = false,
    bool isBackButton = true,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          ChatHomeRoute.name,
          args: ChatHomeRouteArgs(
            key: key,
            isNotificationRoute: isNotificationRoute,
            isBackButton: isBackButton,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatHomeRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatHomeRouteArgs>(
          orElse: () => const ChatHomeRouteArgs());
      return _i5.ChatHomePage(
        key: args.key,
        isNotificationRoute: args.isNotificationRoute,
        isBackButton: args.isBackButton,
      );
    },
  );
}

class ChatHomeRouteArgs {
  const ChatHomeRouteArgs({
    this.key,
    this.isNotificationRoute = false,
    this.isBackButton = true,
  });

  final _i52.Key? key;

  final bool isNotificationRoute;

  final bool isBackButton;

  @override
  String toString() {
    return 'ChatHomeRouteArgs{key: $key, isNotificationRoute: $isNotificationRoute, isBackButton: $isBackButton}';
  }
}

/// generated route for
/// [_i6.ChatPage]
class ChatRoute extends _i51.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    required String userId,
    required String name,
    required String imageUrl,
    required bool isOnline,
    String? roomId,
    bool? isProfil = false,
    bool isNotificationRoute = false,
    bool isGroup = false,
    _i52.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          ChatRoute.name,
          args: ChatRouteArgs(
            userId: userId,
            name: name,
            imageUrl: imageUrl,
            isOnline: isOnline,
            roomId: roomId,
            isProfil: isProfil,
            isNotificationRoute: isNotificationRoute,
            isGroup: isGroup,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatRouteArgs>();
      return _i6.ChatPage(
        userId: args.userId,
        name: args.name,
        imageUrl: args.imageUrl,
        isOnline: args.isOnline,
        roomId: args.roomId,
        isProfil: args.isProfil,
        isNotificationRoute: args.isNotificationRoute,
        isGroup: args.isGroup,
        key: args.key,
      );
    },
  );
}

class ChatRouteArgs {
  const ChatRouteArgs({
    required this.userId,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
    this.roomId,
    this.isProfil = false,
    this.isNotificationRoute = false,
    this.isGroup = false,
    this.key,
  });

  final String userId;

  final String name;

  final String imageUrl;

  final bool isOnline;

  final String? roomId;

  final bool? isProfil;

  final bool isNotificationRoute;

  final bool isGroup;

  final _i52.Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{userId: $userId, name: $name, imageUrl: $imageUrl, isOnline: $isOnline, roomId: $roomId, isProfil: $isProfil, isNotificationRoute: $isNotificationRoute, isGroup: $isGroup, key: $key}';
  }
}

/// generated route for
/// [_i7.CommentPage]
class CommentRoute extends _i51.PageRouteInfo<CommentRouteArgs> {
  CommentRoute({
    required String eventId,
    required bool isEventOwner,
    required _i52.ScrollController dragScrollController,
    required bool isClosedComment,
    required bool isCurrentUser,
    _i52.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          CommentRoute.name,
          args: CommentRouteArgs(
            eventId: eventId,
            isEventOwner: isEventOwner,
            dragScrollController: dragScrollController,
            isClosedComment: isClosedComment,
            isCurrentUser: isCurrentUser,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CommentRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommentRouteArgs>();
      return _i7.CommentPage(
        eventId: args.eventId,
        isEventOwner: args.isEventOwner,
        dragScrollController: args.dragScrollController,
        isClosedComment: args.isClosedComment,
        isCurrentUser: args.isCurrentUser,
        key: args.key,
      );
    },
  );
}

class CommentRouteArgs {
  const CommentRouteArgs({
    required this.eventId,
    required this.isEventOwner,
    required this.dragScrollController,
    required this.isClosedComment,
    required this.isCurrentUser,
    this.key,
  });

  final String eventId;

  final bool isEventOwner;

  final _i52.ScrollController dragScrollController;

  final bool isClosedComment;

  final bool isCurrentUser;

  final _i52.Key? key;

  @override
  String toString() {
    return 'CommentRouteArgs{eventId: $eventId, isEventOwner: $isEventOwner, dragScrollController: $dragScrollController, isClosedComment: $isClosedComment, isCurrentUser: $isCurrentUser, key: $key}';
  }
}

/// generated route for
/// [_i8.CreateEventPage]
class CreateEventRoute extends _i51.PageRouteInfo<CreateEventRouteArgs> {
  CreateEventRoute({
    _i52.Key? key,
    bool isDraft = false,
    int initStep = 0,
    bool isProfil = false,
    String? userId,
    bool isUpdate = false,
    String? eventId,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          CreateEventRoute.name,
          args: CreateEventRouteArgs(
            key: key,
            isDraft: isDraft,
            initStep: initStep,
            isProfil: isProfil,
            userId: userId,
            isUpdate: isUpdate,
            eventId: eventId,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateEventRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateEventRouteArgs>(
          orElse: () => const CreateEventRouteArgs());
      return _i8.CreateEventPage(
        key: args.key,
        isDraft: args.isDraft,
        initStep: args.initStep,
        isProfil: args.isProfil,
        userId: args.userId,
        isUpdate: args.isUpdate,
        eventId: args.eventId,
      );
    },
  );
}

class CreateEventRouteArgs {
  const CreateEventRouteArgs({
    this.key,
    this.isDraft = false,
    this.initStep = 0,
    this.isProfil = false,
    this.userId,
    this.isUpdate = false,
    this.eventId,
  });

  final _i52.Key? key;

  final bool isDraft;

  final int initStep;

  final bool isProfil;

  final String? userId;

  final bool isUpdate;

  final String? eventId;

  @override
  String toString() {
    return 'CreateEventRouteArgs{key: $key, isDraft: $isDraft, initStep: $initStep, isProfil: $isProfil, userId: $userId, isUpdate: $isUpdate, eventId: $eventId}';
  }
}

/// generated route for
/// [_i9.CreateEventSuccesPage]
class CreateEventSuccesRoute
    extends _i51.PageRouteInfo<CreateEventSuccesRouteArgs> {
  CreateEventSuccesRoute({
    required _i53.AppTheme theme,
    required _i54.EventModel data,
    required String title,
    _i52.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          CreateEventSuccesRoute.name,
          args: CreateEventSuccesRouteArgs(
            theme: theme,
            data: data,
            title: title,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateEventSuccesRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateEventSuccesRouteArgs>();
      return _i9.CreateEventSuccesPage(
        theme: args.theme,
        data: args.data,
        title: args.title,
        key: args.key,
      );
    },
  );
}

class CreateEventSuccesRouteArgs {
  const CreateEventSuccesRouteArgs({
    required this.theme,
    required this.data,
    required this.title,
    this.key,
  });

  final _i53.AppTheme theme;

  final _i54.EventModel data;

  final String title;

  final _i52.Key? key;

  @override
  String toString() {
    return 'CreateEventSuccesRouteArgs{theme: $theme, data: $data, title: $title, key: $key}';
  }
}

/// generated route for
/// [_i10.DiscoverPage]
class DiscoverRoute extends _i51.PageRouteInfo<DiscoverRouteArgs> {
  DiscoverRoute({
    _i52.Key? key,
    int? initialIndex,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          DiscoverRoute.name,
          args: DiscoverRouteArgs(
            key: key,
            initialIndex: initialIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DiscoverRouteArgs>(
          orElse: () => const DiscoverRouteArgs());
      return _i10.DiscoverPage(
        key: args.key,
        initialIndex: args.initialIndex,
      );
    },
  );
}

class DiscoverRouteArgs {
  const DiscoverRouteArgs({
    this.key,
    this.initialIndex,
  });

  final _i52.Key? key;

  final int? initialIndex;

  @override
  String toString() {
    return 'DiscoverRouteArgs{key: $key, initialIndex: $initialIndex}';
  }
}

/// generated route for
/// [_i11.DiscoverSearchPage]
class DiscoverSearchRoute extends _i51.PageRouteInfo<void> {
  const DiscoverSearchRoute({List<_i51.PageRouteInfo>? children})
      : super(
          DiscoverSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverSearchRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i11.DiscoverSearchPage();
    },
  );
}

/// generated route for
/// [_i12.DiscoveryMapViewPage]
class DiscoveryMapViewRoute extends _i51.PageRouteInfo<void> {
  const DiscoveryMapViewRoute({List<_i51.PageRouteInfo>? children})
      : super(
          DiscoveryMapViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoveryMapViewRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i12.DiscoveryMapViewPage();
    },
  );
}

/// generated route for
/// [_i13.DraftPage]
class DraftRoute extends _i51.PageRouteInfo<void> {
  const DraftRoute({List<_i51.PageRouteInfo>? children})
      : super(
          DraftRoute.name,
          initialChildren: children,
        );

  static const String name = 'DraftRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i13.DraftPage();
    },
  );
}

/// generated route for
/// [_i14.EventBlockPage]
class EventBlockRoute extends _i51.PageRouteInfo<void> {
  const EventBlockRoute({List<_i51.PageRouteInfo>? children})
      : super(
          EventBlockRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventBlockRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i14.EventBlockPage();
    },
  );
}

/// generated route for
/// [_i15.EventDetailsPage]
class EventDetailsRoute extends _i51.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    required String eventId,
    String? applauseCount,
    bool isNotification = false,
    void Function()? onLikeIncrement,
    _i52.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          EventDetailsRoute.name,
          args: EventDetailsRouteArgs(
            eventId: eventId,
            applauseCount: applauseCount,
            isNotification: isNotification,
            onLikeIncrement: onLikeIncrement,
            key: key,
          ),
          rawPathParams: {'eventId': eventId},
          initialChildren: children,
        );

  static const String name = 'EventDetailsRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EventDetailsRouteArgs>(
          orElse: () =>
              EventDetailsRouteArgs(eventId: pathParams.getString('eventId')));
      return _i15.EventDetailsPage(
        eventId: args.eventId,
        applauseCount: args.applauseCount,
        isNotification: args.isNotification,
        onLikeIncrement: args.onLikeIncrement,
        key: args.key,
      );
    },
  );
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({
    required this.eventId,
    this.applauseCount,
    this.isNotification = false,
    this.onLikeIncrement,
    this.key,
  });

  final String eventId;

  final String? applauseCount;

  final bool isNotification;

  final void Function()? onLikeIncrement;

  final _i52.Key? key;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{eventId: $eventId, applauseCount: $applauseCount, isNotification: $isNotification, onLikeIncrement: $onLikeIncrement, key: $key}';
  }
}

/// generated route for
/// [_i16.EventJoinedUserPage]
class EventJoinedUserRoute
    extends _i51.PageRouteInfo<EventJoinedUserRouteArgs> {
  EventJoinedUserRoute({
    required String eventId,
    bool isManagement = true,
    _i52.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          EventJoinedUserRoute.name,
          args: EventJoinedUserRouteArgs(
            eventId: eventId,
            isManagement: isManagement,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EventJoinedUserRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventJoinedUserRouteArgs>();
      return _i16.EventJoinedUserPage(
        eventId: args.eventId,
        isManagement: args.isManagement,
        key: args.key,
      );
    },
  );
}

class EventJoinedUserRouteArgs {
  const EventJoinedUserRouteArgs({
    required this.eventId,
    this.isManagement = true,
    this.key,
  });

  final String eventId;

  final bool isManagement;

  final _i52.Key? key;

  @override
  String toString() {
    return 'EventJoinedUserRouteArgs{eventId: $eventId, isManagement: $isManagement, key: $key}';
  }
}

/// generated route for
/// [_i17.EventRatingsAllPage]
class EventRatingsAllRoute
    extends _i51.PageRouteInfo<EventRatingsAllRouteArgs> {
  EventRatingsAllRoute({
    required _i52.ScrollController dragScrollController,
    List<_i55.Ratings>? ratingsList,
    _i52.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          EventRatingsAllRoute.name,
          args: EventRatingsAllRouteArgs(
            dragScrollController: dragScrollController,
            ratingsList: ratingsList,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EventRatingsAllRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventRatingsAllRouteArgs>();
      return _i17.EventRatingsAllPage(
        dragScrollController: args.dragScrollController,
        ratingsList: args.ratingsList,
        key: args.key,
      );
    },
  );
}

class EventRatingsAllRouteArgs {
  const EventRatingsAllRouteArgs({
    required this.dragScrollController,
    this.ratingsList,
    this.key,
  });

  final _i52.ScrollController dragScrollController;

  final List<_i55.Ratings>? ratingsList;

  final _i52.Key? key;

  @override
  String toString() {
    return 'EventRatingsAllRouteArgs{dragScrollController: $dragScrollController, ratingsList: $ratingsList, key: $key}';
  }
}

/// generated route for
/// [_i18.EventRequestPage]
class EventRequestRoute extends _i51.PageRouteInfo<EventRequestRouteArgs> {
  EventRequestRoute({
    required String eventId,
    _i52.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          EventRequestRoute.name,
          args: EventRequestRouteArgs(
            eventId: eventId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EventRequestRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventRequestRouteArgs>();
      return _i18.EventRequestPage(
        eventId: args.eventId,
        key: args.key,
      );
    },
  );
}

class EventRequestRouteArgs {
  const EventRequestRouteArgs({
    required this.eventId,
    this.key,
  });

  final String eventId;

  final _i52.Key? key;

  @override
  String toString() {
    return 'EventRequestRouteArgs{eventId: $eventId, key: $key}';
  }
}

/// generated route for
/// [_i19.FollowersUserSearchPage]
class FollowersUserSearchRoute
    extends _i51.PageRouteInfo<FollowersUserSearchRouteArgs> {
  FollowersUserSearchRoute({
    required String userId,
    _i52.Key? key,
    bool isRoute = false,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          FollowersUserSearchRoute.name,
          args: FollowersUserSearchRouteArgs(
            userId: userId,
            key: key,
            isRoute: isRoute,
          ),
          initialChildren: children,
        );

  static const String name = 'FollowersUserSearchRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FollowersUserSearchRouteArgs>();
      return _i19.FollowersUserSearchPage(
        userId: args.userId,
        key: args.key,
        isRoute: args.isRoute,
      );
    },
  );
}

class FollowersUserSearchRouteArgs {
  const FollowersUserSearchRouteArgs({
    required this.userId,
    this.key,
    this.isRoute = false,
  });

  final String userId;

  final _i52.Key? key;

  final bool isRoute;

  @override
  String toString() {
    return 'FollowersUserSearchRouteArgs{userId: $userId, key: $key, isRoute: $isRoute}';
  }
}

/// generated route for
/// [_i20.FriendsRequestPage]
class FriendsRequestRoute extends _i51.PageRouteInfo<FriendsRequestRouteArgs> {
  FriendsRequestRoute({
    String? userId,
    _i52.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          FriendsRequestRoute.name,
          args: FriendsRequestRouteArgs(
            userId: userId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FriendsRequestRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FriendsRequestRouteArgs>(
          orElse: () => const FriendsRequestRouteArgs());
      return _i20.FriendsRequestPage(
        userId: args.userId,
        key: args.key,
      );
    },
  );
}

class FriendsRequestRouteArgs {
  const FriendsRequestRouteArgs({
    this.userId,
    this.key,
  });

  final String? userId;

  final _i52.Key? key;

  @override
  String toString() {
    return 'FriendsRequestRouteArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i21.FriendsSearchPage]
class FriendsSearchRoute extends _i51.PageRouteInfo<FriendsSearchRouteArgs> {
  FriendsSearchRoute({
    String? userId,
    _i52.Key? key,
    bool isRoute = false,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          FriendsSearchRoute.name,
          args: FriendsSearchRouteArgs(
            userId: userId,
            key: key,
            isRoute: isRoute,
          ),
          initialChildren: children,
        );

  static const String name = 'FriendsSearchRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FriendsSearchRouteArgs>(
          orElse: () => const FriendsSearchRouteArgs());
      return _i21.FriendsSearchPage(
        userId: args.userId,
        key: args.key,
        isRoute: args.isRoute,
      );
    },
  );
}

class FriendsSearchRouteArgs {
  const FriendsSearchRouteArgs({
    this.userId,
    this.key,
    this.isRoute = false,
  });

  final String? userId;

  final _i52.Key? key;

  final bool isRoute;

  @override
  String toString() {
    return 'FriendsSearchRouteArgs{userId: $userId, key: $key, isRoute: $isRoute}';
  }
}

/// generated route for
/// [_i22.GroupDetailsPage]
class GroupDetailsRoute extends _i51.PageRouteInfo<GroupDetailsRouteArgs> {
  GroupDetailsRoute({
    required String roomId,
    _i52.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          GroupDetailsRoute.name,
          args: GroupDetailsRouteArgs(
            roomId: roomId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GroupDetailsRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GroupDetailsRouteArgs>();
      return _i22.GroupDetailsPage(
        roomId: args.roomId,
        key: args.key,
      );
    },
  );
}

class GroupDetailsRouteArgs {
  const GroupDetailsRouteArgs({
    required this.roomId,
    this.key,
  });

  final String roomId;

  final _i52.Key? key;

  @override
  String toString() {
    return 'GroupDetailsRouteArgs{roomId: $roomId, key: $key}';
  }
}

/// generated route for
/// [_i23.GroupPage]
class GroupRoute extends _i51.PageRouteInfo<GroupRouteArgs> {
  GroupRoute({
    required String id,
    _i55.EventDetailsModel? eventModel,
    _i52.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          GroupRoute.name,
          args: GroupRouteArgs(
            id: id,
            eventModel: eventModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GroupRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GroupRouteArgs>();
      return _i23.GroupPage(
        id: args.id,
        eventModel: args.eventModel,
        key: args.key,
      );
    },
  );
}

class GroupRouteArgs {
  const GroupRouteArgs({
    required this.id,
    this.eventModel,
    this.key,
  });

  final String id;

  final _i55.EventDetailsModel? eventModel;

  final _i52.Key? key;

  @override
  String toString() {
    return 'GroupRouteArgs{id: $id, eventModel: $eventModel, key: $key}';
  }
}

/// generated route for
/// [_i24.HobyQuestionPage]
class HobyQuestionRoute extends _i51.PageRouteInfo<void> {
  const HobyQuestionRoute({List<_i51.PageRouteInfo>? children})
      : super(
          HobyQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'HobyQuestionRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i24.HobyQuestionPage();
    },
  );
}

/// generated route for
/// [_i25.HomePage]
class HomeRoute extends _i51.PageRouteInfo<void> {
  const HomeRoute({List<_i51.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i25.HomePage();
    },
  );
}

/// generated route for
/// [_i26.JoinWithFriendsPage]
class JoinWithFriendsRoute
    extends _i51.PageRouteInfo<JoinWithFriendsRouteArgs> {
  JoinWithFriendsRoute({
    required String eventId,
    String? ticketUrl,
    _i56.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          JoinWithFriendsRoute.name,
          args: JoinWithFriendsRouteArgs(
            eventId: eventId,
            ticketUrl: ticketUrl,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'JoinWithFriendsRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<JoinWithFriendsRouteArgs>();
      return _i26.JoinWithFriendsPage(
        eventId: args.eventId,
        ticketUrl: args.ticketUrl,
        key: args.key,
      );
    },
  );
}

class JoinWithFriendsRouteArgs {
  const JoinWithFriendsRouteArgs({
    required this.eventId,
    this.ticketUrl,
    this.key,
  });

  final String eventId;

  final String? ticketUrl;

  final _i56.Key? key;

  @override
  String toString() {
    return 'JoinWithFriendsRouteArgs{eventId: $eventId, ticketUrl: $ticketUrl, key: $key}';
  }
}

/// generated route for
/// [_i27.LanguageSelectorPage]
class LanguageSelectorRoute extends _i51.PageRouteInfo<void> {
  const LanguageSelectorRoute({List<_i51.PageRouteInfo>? children})
      : super(
          LanguageSelectorRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageSelectorRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i27.LanguageSelectorPage();
    },
  );
}

/// generated route for
/// [_i28.LikesPage]
class LikesRoute extends _i51.PageRouteInfo<void> {
  const LikesRoute({List<_i51.PageRouteInfo>? children})
      : super(
          LikesRoute.name,
          initialChildren: children,
        );

  static const String name = 'LikesRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i28.LikesPage();
    },
  );
}

/// generated route for
/// [_i29.NewGroupPage]
class NewGroupRoute extends _i51.PageRouteInfo<void> {
  const NewGroupRoute({List<_i51.PageRouteInfo>? children})
      : super(
          NewGroupRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewGroupRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i29.NewGroupPage();
    },
  );
}

/// generated route for
/// [_i30.NotificationPage]
class NotificationRoute extends _i51.PageRouteInfo<NotificationRouteArgs> {
  NotificationRoute({
    _i52.Key? key,
    bool isNotification = false,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          NotificationRoute.name,
          args: NotificationRouteArgs(
            key: key,
            isNotification: isNotification,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationRouteArgs>(
          orElse: () => const NotificationRouteArgs());
      return _i30.NotificationPage(
        key: args.key,
        isNotification: args.isNotification,
      );
    },
  );
}

class NotificationRouteArgs {
  const NotificationRouteArgs({
    this.key,
    this.isNotification = false,
  });

  final _i52.Key? key;

  final bool isNotification;

  @override
  String toString() {
    return 'NotificationRouteArgs{key: $key, isNotification: $isNotification}';
  }
}

/// generated route for
/// [_i31.ProfilEditPage]
class ProfilEditRoute extends _i51.PageRouteInfo<ProfilEditRouteArgs> {
  ProfilEditRoute({
    _i52.Key? key,
    _i31.ProfilScrollPosition? profilScrollPosition,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          ProfilEditRoute.name,
          args: ProfilEditRouteArgs(
            key: key,
            profilScrollPosition: profilScrollPosition,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfilEditRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfilEditRouteArgs>(
          orElse: () => const ProfilEditRouteArgs());
      return _i31.ProfilEditPage(
        key: args.key,
        profilScrollPosition: args.profilScrollPosition,
      );
    },
  );
}

class ProfilEditRouteArgs {
  const ProfilEditRouteArgs({
    this.key,
    this.profilScrollPosition,
  });

  final _i52.Key? key;

  final _i31.ProfilScrollPosition? profilScrollPosition;

  @override
  String toString() {
    return 'ProfilEditRouteArgs{key: $key, profilScrollPosition: $profilScrollPosition}';
  }
}

/// generated route for
/// [_i32.ProfilePage]
class ProfileRoute extends _i51.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i52.Key? key,
    String? userId,
    _i52.ScrollController? controller,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            userId: userId,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<ProfileRouteArgs>(orElse: () => const ProfileRouteArgs());
      return _i32.ProfilePage(
        key: args.key,
        userId: args.userId,
        controller: args.controller,
      );
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.userId,
    this.controller,
  });

  final _i52.Key? key;

  final String? userId;

  final _i52.ScrollController? controller;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, userId: $userId, controller: $controller}';
  }
}

/// generated route for
/// [_i33.ReadyTemplatePage]
class ReadyTemplateRoute extends _i51.PageRouteInfo<ReadyTemplateRouteArgs> {
  ReadyTemplateRoute({
    _i57.Key? key,
    _i57.ScrollController? controller,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          ReadyTemplateRoute.name,
          args: ReadyTemplateRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'ReadyTemplateRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReadyTemplateRouteArgs>(
          orElse: () => const ReadyTemplateRouteArgs());
      return _i33.ReadyTemplatePage(
        key: args.key,
        controller: args.controller,
      );
    },
  );
}

class ReadyTemplateRouteArgs {
  const ReadyTemplateRouteArgs({
    this.key,
    this.controller,
  });

  final _i57.Key? key;

  final _i57.ScrollController? controller;

  @override
  String toString() {
    return 'ReadyTemplateRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i34.ReadyTemplatePixelsPage]
class ReadyTemplatePixelsRoute
    extends _i51.PageRouteInfo<ReadyTemplatePixelsRouteArgs> {
  ReadyTemplatePixelsRoute({
    _i52.Key? key,
    _i52.ScrollController? controller,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          ReadyTemplatePixelsRoute.name,
          args: ReadyTemplatePixelsRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'ReadyTemplatePixelsRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReadyTemplatePixelsRouteArgs>(
          orElse: () => const ReadyTemplatePixelsRouteArgs());
      return _i34.ReadyTemplatePixelsPage(
        key: args.key,
        controller: args.controller,
      );
    },
  );
}

class ReadyTemplatePixelsRouteArgs {
  const ReadyTemplatePixelsRouteArgs({
    this.key,
    this.controller,
  });

  final _i52.Key? key;

  final _i52.ScrollController? controller;

  @override
  String toString() {
    return 'ReadyTemplatePixelsRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i35.RemoveUserPage]
class RemoveUserRoute extends _i51.PageRouteInfo<void> {
  const RemoveUserRoute({List<_i51.PageRouteInfo>? children})
      : super(
          RemoveUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'RemoveUserRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i35.RemoveUserPage();
    },
  );
}

/// generated route for
/// [_i36.SearchScreenPage]
class SearchScreenRoute extends _i51.PageRouteInfo<SearchScreenRouteArgs> {
  SearchScreenRoute({
    _i52.Key? key,
    bool isRoute = false,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          SearchScreenRoute.name,
          args: SearchScreenRouteArgs(
            key: key,
            isRoute: isRoute,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchScreenRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchScreenRouteArgs>(
          orElse: () => const SearchScreenRouteArgs());
      return _i36.SearchScreenPage(
        key: args.key,
        isRoute: args.isRoute,
      );
    },
  );
}

class SearchScreenRouteArgs {
  const SearchScreenRouteArgs({
    this.key,
    this.isRoute = false,
  });

  final _i52.Key? key;

  final bool isRoute;

  @override
  String toString() {
    return 'SearchScreenRouteArgs{key: $key, isRoute: $isRoute}';
  }
}

/// generated route for
/// [_i37.SecurityPage]
class SecurityRoute extends _i51.PageRouteInfo<void> {
  const SecurityRoute({List<_i51.PageRouteInfo>? children})
      : super(
          SecurityRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecurityRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i37.SecurityPage();
    },
  );
}

/// generated route for
/// [_i38.SettingsPage]
class SettingsRoute extends _i51.PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    required int userType,
    _i52.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(
            userType: userType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingsRouteArgs>();
      return _i38.SettingsPage(
        userType: args.userType,
        key: args.key,
      );
    },
  );
}

class SettingsRouteArgs {
  const SettingsRouteArgs({
    required this.userType,
    this.key,
  });

  final int userType;

  final _i52.Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{userType: $userType, key: $key}';
  }
}

/// generated route for
/// [_i39.SigninPage]
class SigninRoute extends _i51.PageRouteInfo<void> {
  const SigninRoute({List<_i51.PageRouteInfo>? children})
      : super(
          SigninRoute.name,
          initialChildren: children,
        );

  static const String name = 'SigninRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i39.SigninPage();
    },
  );
}

/// generated route for
/// [_i40.SignupPage]
class SignupRoute extends _i51.PageRouteInfo<void> {
  const SignupRoute({List<_i51.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i40.SignupPage();
    },
  );
}

/// generated route for
/// [_i41.SplashViewPage]
class SplashViewRoute extends _i51.PageRouteInfo<void> {
  const SplashViewRoute({List<_i51.PageRouteInfo>? children})
      : super(
          SplashViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashViewRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i41.SplashViewPage();
    },
  );
}

/// generated route for
/// [_i42.ThemeModeSelectorPage]
class ThemeModeSelectorRoute extends _i51.PageRouteInfo<void> {
  const ThemeModeSelectorRoute({List<_i51.PageRouteInfo>? children})
      : super(
          ThemeModeSelectorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemeModeSelectorRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i42.ThemeModeSelectorPage();
    },
  );
}

/// generated route for
/// [_i43.UserImageQuestionPage]
class UserImageQuestionRoute extends _i51.PageRouteInfo<void> {
  const UserImageQuestionRoute({List<_i51.PageRouteInfo>? children})
      : super(
          UserImageQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserImageQuestionRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i43.UserImageQuestionPage();
    },
  );
}

/// generated route for
/// [_i44.UserProfilePage]
class UserProfileRoute extends _i51.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    required String userId,
    _i52.Key? key,
    List<_i51.PageRouteInfo>? children,
  }) : super(
          UserProfileRoute.name,
          args: UserProfileRouteArgs(
            userId: userId,
            key: key,
          ),
          rawPathParams: {'userId': userId},
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<UserProfileRouteArgs>(
          orElse: () =>
              UserProfileRouteArgs(userId: pathParams.getString('userId')));
      return _i44.UserProfilePage(
        userId: args.userId,
        key: args.key,
      );
    },
  );
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({
    required this.userId,
    this.key,
  });

  final String userId;

  final _i52.Key? key;

  @override
  String toString() {
    return 'UserProfileRouteArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i45.UserTypeQuestionPage]
class UserTypeQuestionRoute extends _i51.PageRouteInfo<void> {
  const UserTypeQuestionRoute({List<_i51.PageRouteInfo>? children})
      : super(
          UserTypeQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserTypeQuestionRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i45.UserTypeQuestionPage();
    },
  );
}

/// generated route for
/// [_i46.VerifyEmailPage]
class VerifyEmailRoute extends _i51.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i51.PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i46.VerifyEmailPage();
    },
  );
}

/// generated route for
/// [_i47.VerifyPhonePage]
class VerifyPhoneRoute extends _i51.PageRouteInfo<void> {
  const VerifyPhoneRoute({List<_i51.PageRouteInfo>? children})
      : super(
          VerifyPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyPhoneRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i47.VerifyPhonePage();
    },
  );
}

/// generated route for
/// [_i48.VerifyPhoneSpecialPage]
class VerifyPhoneSpecialRoute extends _i51.PageRouteInfo<void> {
  const VerifyPhoneSpecialRoute({List<_i51.PageRouteInfo>? children})
      : super(
          VerifyPhoneSpecialRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyPhoneSpecialRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i48.VerifyPhoneSpecialPage();
    },
  );
}

/// generated route for
/// [_i49.WelcomePage]
class WelcomeRoute extends _i51.PageRouteInfo<void> {
  const WelcomeRoute({List<_i51.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i49.WelcomePage();
    },
  );
}

/// generated route for
/// [_i50.WidgetTestPage]
class WidgetTestRoute extends _i51.PageRouteInfo<void> {
  const WidgetTestRoute({List<_i51.PageRouteInfo>? children})
      : super(
          WidgetTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'WidgetTestRoute';

  static _i51.PageInfo page = _i51.PageInfo(
    name,
    builder: (data) {
      return const _i50.WidgetTestPage();
    },
  );
}
