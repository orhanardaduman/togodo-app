// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i50;
import 'package:flutter/cupertino.dart' as _i56;
import 'package:flutter/foundation.dart' as _i55;
import 'package:flutter/material.dart' as _i51;
import 'package:togodo/core/theme/app_theme.dart' as _i52;
import 'package:togodo/data/model/event/event_details_model.dart' as _i54;
import 'package:togodo/data/model/event/event_model.dart' as _i53;
import 'package:togodo/ui/auth/signin.dart' as _i38;
import 'package:togodo/ui/auth/signup.dart' as _i39;
import 'package:togodo/ui/auth/verifty_phone.dart' as _i47;
import 'package:togodo/ui/auth/verify_email.dart' as _i45;
import 'package:togodo/ui/auth/verify_phone_normal.dart' as _i46;
import 'package:togodo/ui/auth/welcome_question/view/hoby_question.dart'
    as _i23;
import 'package:togodo/ui/auth/welcome_question/view/user_image_question.dart'
    as _i42;
import 'package:togodo/ui/auth/welcome_question/view/user_type_question.dart'
    as _i44;
import 'package:togodo/ui/bottom_menu.dart' as _i4;
import 'package:togodo/ui/chat/screens/add_group_chat_users.dart' as _i1;
import 'package:togodo/ui/chat/screens/chat_details_page.dart' as _i6;
import 'package:togodo/ui/chat/screens/chat_home_page.dart' as _i5;
import 'package:togodo/ui/chat/screens/chat_user_search_page.dart' as _i35;
import 'package:togodo/ui/chat/screens/group_details.dart' as _i22;
import 'package:togodo/ui/chat/screens/new_group_page.dart' as _i28;
import 'package:togodo/ui/comment/comment.dart' as _i7;
import 'package:togodo/ui/common/splash_view.dart' as _i40;
import 'package:togodo/ui/common/welcome.dart' as _i48;
import 'package:togodo/ui/discover/discover_search_page.dart' as _i11;
import 'package:togodo/ui/discover/view/discover_page.dart' as _i10;
import 'package:togodo/ui/discover/view/discovery_map.dart' as _i12;
import 'package:togodo/ui/discover/widget_test.dart' as _i49;
import 'package:togodo/ui/event/create_event_page.dart' as _i8;
import 'package:togodo/ui/event/view/draft.dart' as _i13;
import 'package:togodo/ui/event/view/ready_template.dart' as _i32;
import 'package:togodo/ui/event/view/ready_template_pixexls.dart' as _i33;
import 'package:togodo/ui/event/view/success_page.dart' as _i9;
import 'package:togodo/ui/home/home_page.dart' as _i24;
import 'package:togodo/ui/home/view/event_details.dart' as _i15;
import 'package:togodo/ui/home/view/event_request.dart' as _i18;
import 'package:togodo/ui/home/view/join_with_friends.dart' as _i25;
import 'package:togodo/ui/home/view/joined_user.dart' as _i16;
import 'package:togodo/ui/home/widget/event_ratings_all.dart' as _i17;
import 'package:togodo/ui/likes/likes_page.dart' as _i27;
import 'package:togodo/ui/notification/notification_page.dart' as _i29;
import 'package:togodo/ui/profile/view/followers_user_page.dart' as _i19;
import 'package:togodo/ui/profile/view/friends_search_page.dart' as _i21;
import 'package:togodo/ui/profile/view/friends_view.dart' as _i20;
import 'package:togodo/ui/profile/view/profil_edit_page.dart' as _i30;
import 'package:togodo/ui/profile/view/profile_page.dart' as _i31;
import 'package:togodo/ui/profile/view/user_profil_page.dart' as _i43;
import 'package:togodo/ui/settings/admin_dashboard_page.dart' as _i2;
import 'package:togodo/ui/settings/block_user.dart' as _i3;
import 'package:togodo/ui/settings/event_block.dart' as _i14;
import 'package:togodo/ui/settings/language_settings.dart' as _i26;
import 'package:togodo/ui/settings/remove_user_page.dart' as _i34;
import 'package:togodo/ui/settings/security_page.dart' as _i36;
import 'package:togodo/ui/settings/settings_page.dart' as _i37;
import 'package:togodo/ui/settings/theme_settings_page.dart' as _i41;

abstract class $AppRouter extends _i50.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i50.PageFactory> pagesMap = {
    AddGroupChatUserRoute.name: (routeData) {
      final args = routeData.argsAs<AddGroupChatUserRouteArgs>();
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddGroupChatUserPage(
          roomId: args.roomId,
          key: args.key,
        ),
      );
    },
    AdminDashboardRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AdminDashboardPage(),
      );
    },
    BlockUserRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BlockUserPage(),
      );
    },
    BottomMenuRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.BottomMenuPage(),
      );
    },
    ChatHomeRoute.name: (routeData) {
      final args = routeData.argsAs<ChatHomeRouteArgs>(
          orElse: () => const ChatHomeRouteArgs());
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ChatHomePage(
          key: args.key,
          isNotificationRoute: args.isNotificationRoute,
          isBackButton: args.isBackButton,
        ),
      );
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ChatPage(
          userId: args.userId,
          name: args.name,
          imageUrl: args.imageUrl,
          isOnline: args.isOnline,
          roomId: args.roomId,
          isProfil: args.isProfil,
          isNotificationRoute: args.isNotificationRoute,
          isGroup: args.isGroup,
          key: args.key,
        ),
      );
    },
    CommentRoute.name: (routeData) {
      final args = routeData.argsAs<CommentRouteArgs>();
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.CommentPage(
          eventId: args.eventId,
          isEventOwner: args.isEventOwner,
          dragScrollController: args.dragScrollController,
          isClosedComment: args.isClosedComment,
          isCurrentUser: args.isCurrentUser,
          key: args.key,
        ),
      );
    },
    CreateEventRoute.name: (routeData) {
      final args = routeData.argsAs<CreateEventRouteArgs>(
          orElse: () => const CreateEventRouteArgs());
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.CreateEventPage(
          key: args.key,
          isDraft: args.isDraft,
          initStep: args.initStep,
          isProfil: args.isProfil,
          userId: args.userId,
          isUpdate: args.isUpdate,
          eventId: args.eventId,
        ),
      );
    },
    CreateEventSuccesRoute.name: (routeData) {
      final args = routeData.argsAs<CreateEventSuccesRouteArgs>();
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.CreateEventSuccesPage(
          theme: args.theme,
          data: args.data,
          title: args.title,
          key: args.key,
        ),
      );
    },
    DiscoverRoute.name: (routeData) {
      final args = routeData.argsAs<DiscoverRouteArgs>(
          orElse: () => const DiscoverRouteArgs());
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.DiscoverPage(
          key: args.key,
          initialIndex: args.initialIndex,
        ),
      );
    },
    DiscoverSearchRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.DiscoverSearchPage(),
      );
    },
    DiscoveryMapViewRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.DiscoveryMapViewPage(),
      );
    },
    DraftRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.DraftPage(),
      );
    },
    EventBlockRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.EventBlockPage(),
      );
    },
    EventDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventDetailsRouteArgs>(
          orElse: () =>
              EventDetailsRouteArgs(eventId: pathParams.getString('eventId')));
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.EventDetailsPage(
          eventId: args.eventId,
          applauseCount: args.applauseCount,
          isNotification: args.isNotification,
          onLikeIncrement: args.onLikeIncrement,
          key: args.key,
        ),
      );
    },
    EventJoinedUserRoute.name: (routeData) {
      final args = routeData.argsAs<EventJoinedUserRouteArgs>();
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.EventJoinedUserPage(
          eventId: args.eventId,
          isManagement: args.isManagement,
          key: args.key,
        ),
      );
    },
    EventRatingsAllRoute.name: (routeData) {
      final args = routeData.argsAs<EventRatingsAllRouteArgs>();
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.EventRatingsAllPage(
          dragScrollController: args.dragScrollController,
          ratingsList: args.ratingsList,
          key: args.key,
        ),
      );
    },
    EventRequestRoute.name: (routeData) {
      final args = routeData.argsAs<EventRequestRouteArgs>();
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.EventRequestPage(
          eventId: args.eventId,
          key: args.key,
        ),
      );
    },
    FollowersUserSearchRoute.name: (routeData) {
      final args = routeData.argsAs<FollowersUserSearchRouteArgs>();
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.FollowersUserSearchPage(
          userId: args.userId,
          key: args.key,
          isRoute: args.isRoute,
        ),
      );
    },
    FriendsRequestRoute.name: (routeData) {
      final args = routeData.argsAs<FriendsRequestRouteArgs>(
          orElse: () => const FriendsRequestRouteArgs());
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.FriendsRequestPage(
          userId: args.userId,
          key: args.key,
        ),
      );
    },
    FriendsSearchRoute.name: (routeData) {
      final args = routeData.argsAs<FriendsSearchRouteArgs>(
          orElse: () => const FriendsSearchRouteArgs());
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.FriendsSearchPage(
          userId: args.userId,
          key: args.key,
          isRoute: args.isRoute,
        ),
      );
    },
    GroupDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<GroupDetailsRouteArgs>();
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.GroupDetailsPage(
          roomId: args.roomId,
          key: args.key,
        ),
      );
    },
    HobyQuestionRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.HobyQuestionPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.HomePage(),
      );
    },
    JoinWithFriendsRoute.name: (routeData) {
      final args = routeData.argsAs<JoinWithFriendsRouteArgs>();
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.JoinWithFriendsPage(
          eventId: args.eventId,
          ticketUrl: args.ticketUrl,
          key: args.key,
        ),
      );
    },
    LanguageSelectorRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.LanguageSelectorPage(),
      );
    },
    LikesRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.LikesPage(),
      );
    },
    NewGroupRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.NewGroupPage(),
      );
    },
    NotificationRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationRouteArgs>(
          orElse: () => const NotificationRouteArgs());
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.NotificationPage(
          key: args.key,
          isNotification: args.isNotification,
        ),
      );
    },
    ProfilEditRoute.name: (routeData) {
      final args = routeData.argsAs<ProfilEditRouteArgs>(
          orElse: () => const ProfilEditRouteArgs());
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.ProfilEditPage(
          key: args.key,
          profilScrollPosition: args.profilScrollPosition,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.ProfilePage(
          key: args.key,
          userId: args.userId,
          controller: args.controller,
        ),
      );
    },
    ReadyTemplateRoute.name: (routeData) {
      final args = routeData.argsAs<ReadyTemplateRouteArgs>(
          orElse: () => const ReadyTemplateRouteArgs());
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.ReadyTemplatePage(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    ReadyTemplatePixelsRoute.name: (routeData) {
      final args = routeData.argsAs<ReadyTemplatePixelsRouteArgs>(
          orElse: () => const ReadyTemplatePixelsRouteArgs());
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i33.ReadyTemplatePixelsPage(
          key: args.key,
          controller: args.controller,
        ),
      );
    },
    RemoveUserRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i34.RemoveUserPage(),
      );
    },
    SearchScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SearchScreenRouteArgs>(
          orElse: () => const SearchScreenRouteArgs());
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i35.SearchScreenPage(
          key: args.key,
          isRoute: args.isRoute,
        ),
      );
    },
    SecurityRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i36.SecurityPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>();
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i37.SettingsPage(
          userType: args.userType,
          key: args.key,
        ),
      );
    },
    SigninRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i38.SigninPage(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i39.SignupPage(),
      );
    },
    SplashViewRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i40.SplashViewPage(),
      );
    },
    ThemeModeSelectorRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i41.ThemeModeSelectorPage(),
      );
    },
    UserImageQuestionRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i42.UserImageQuestionPage(),
      );
    },
    UserProfileRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UserProfileRouteArgs>(
          orElse: () =>
              UserProfileRouteArgs(userId: pathParams.getString('userId')));
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i43.UserProfilePage(
          userId: args.userId,
          key: args.key,
        ),
      );
    },
    UserTypeQuestionRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i44.UserTypeQuestionPage(),
      );
    },
    VerifyEmailRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i45.VerifyEmailPage(),
      );
    },
    VerifyPhoneRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i46.VerifyPhonePage(),
      );
    },
    VerifyPhoneSpecialRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i47.VerifyPhoneSpecialPage(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i48.WelcomePage(),
      );
    },
    WidgetTestRoute.name: (routeData) {
      return _i50.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i49.WidgetTestPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddGroupChatUserPage]
class AddGroupChatUserRoute
    extends _i50.PageRouteInfo<AddGroupChatUserRouteArgs> {
  AddGroupChatUserRoute({
    required String roomId,
    _i51.Key? key,
    List<_i50.PageRouteInfo>? children,
  }) : super(
          AddGroupChatUserRoute.name,
          args: AddGroupChatUserRouteArgs(
            roomId: roomId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddGroupChatUserRoute';

  static const _i50.PageInfo<AddGroupChatUserRouteArgs> page =
      _i50.PageInfo<AddGroupChatUserRouteArgs>(name);
}

class AddGroupChatUserRouteArgs {
  const AddGroupChatUserRouteArgs({
    required this.roomId,
    this.key,
  });

  final String roomId;

  final _i51.Key? key;

  @override
  String toString() {
    return 'AddGroupChatUserRouteArgs{roomId: $roomId, key: $key}';
  }
}

/// generated route for
/// [_i2.AdminDashboardPage]
class AdminDashboardRoute extends _i50.PageRouteInfo<void> {
  const AdminDashboardRoute({List<_i50.PageRouteInfo>? children})
      : super(
          AdminDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminDashboardRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BlockUserPage]
class BlockUserRoute extends _i50.PageRouteInfo<void> {
  const BlockUserRoute({List<_i50.PageRouteInfo>? children})
      : super(
          BlockUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlockUserRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BottomMenuPage]
class BottomMenuRoute extends _i50.PageRouteInfo<void> {
  const BottomMenuRoute({List<_i50.PageRouteInfo>? children})
      : super(
          BottomMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomMenuRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ChatHomePage]
class ChatHomeRoute extends _i50.PageRouteInfo<ChatHomeRouteArgs> {
  ChatHomeRoute({
    _i51.Key? key,
    bool isNotificationRoute = false,
    bool isBackButton = true,
    List<_i50.PageRouteInfo>? children,
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

  static const _i50.PageInfo<ChatHomeRouteArgs> page =
      _i50.PageInfo<ChatHomeRouteArgs>(name);
}

class ChatHomeRouteArgs {
  const ChatHomeRouteArgs({
    this.key,
    this.isNotificationRoute = false,
    this.isBackButton = true,
  });

  final _i51.Key? key;

  final bool isNotificationRoute;

  final bool isBackButton;

  @override
  String toString() {
    return 'ChatHomeRouteArgs{key: $key, isNotificationRoute: $isNotificationRoute, isBackButton: $isBackButton}';
  }
}

/// generated route for
/// [_i6.ChatPage]
class ChatRoute extends _i50.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({
    required String userId,
    required String name,
    required String imageUrl,
    required bool isOnline,
    String? roomId,
    bool? isProfil = false,
    bool isNotificationRoute = false,
    bool isGroup = false,
    _i51.Key? key,
    List<_i50.PageRouteInfo>? children,
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

  static const _i50.PageInfo<ChatRouteArgs> page =
      _i50.PageInfo<ChatRouteArgs>(name);
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

  final _i51.Key? key;

  @override
  String toString() {
    return 'ChatRouteArgs{userId: $userId, name: $name, imageUrl: $imageUrl, isOnline: $isOnline, roomId: $roomId, isProfil: $isProfil, isNotificationRoute: $isNotificationRoute, isGroup: $isGroup, key: $key}';
  }
}

/// generated route for
/// [_i7.CommentPage]
class CommentRoute extends _i50.PageRouteInfo<CommentRouteArgs> {
  CommentRoute({
    required String eventId,
    required bool isEventOwner,
    required _i51.ScrollController dragScrollController,
    required bool isClosedComment,
    required bool isCurrentUser,
    _i51.Key? key,
    List<_i50.PageRouteInfo>? children,
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

  static const _i50.PageInfo<CommentRouteArgs> page =
      _i50.PageInfo<CommentRouteArgs>(name);
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

  final _i51.ScrollController dragScrollController;

  final bool isClosedComment;

  final bool isCurrentUser;

  final _i51.Key? key;

  @override
  String toString() {
    return 'CommentRouteArgs{eventId: $eventId, isEventOwner: $isEventOwner, dragScrollController: $dragScrollController, isClosedComment: $isClosedComment, isCurrentUser: $isCurrentUser, key: $key}';
  }
}

/// generated route for
/// [_i8.CreateEventPage]
class CreateEventRoute extends _i50.PageRouteInfo<CreateEventRouteArgs> {
  CreateEventRoute({
    _i51.Key? key,
    bool isDraft = false,
    int initStep = 0,
    bool isProfil = false,
    String? userId,
    bool isUpdate = false,
    String? eventId,
    List<_i50.PageRouteInfo>? children,
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

  static const _i50.PageInfo<CreateEventRouteArgs> page =
      _i50.PageInfo<CreateEventRouteArgs>(name);
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

  final _i51.Key? key;

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
    extends _i50.PageRouteInfo<CreateEventSuccesRouteArgs> {
  CreateEventSuccesRoute({
    required _i52.AppTheme theme,
    required _i53.EventModel data,
    required String title,
    _i51.Key? key,
    List<_i50.PageRouteInfo>? children,
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

  static const _i50.PageInfo<CreateEventSuccesRouteArgs> page =
      _i50.PageInfo<CreateEventSuccesRouteArgs>(name);
}

class CreateEventSuccesRouteArgs {
  const CreateEventSuccesRouteArgs({
    required this.theme,
    required this.data,
    required this.title,
    this.key,
  });

  final _i52.AppTheme theme;

  final _i53.EventModel data;

  final String title;

  final _i51.Key? key;

  @override
  String toString() {
    return 'CreateEventSuccesRouteArgs{theme: $theme, data: $data, title: $title, key: $key}';
  }
}

/// generated route for
/// [_i10.DiscoverPage]
class DiscoverRoute extends _i50.PageRouteInfo<DiscoverRouteArgs> {
  DiscoverRoute({
    _i51.Key? key,
    int? initialIndex,
    List<_i50.PageRouteInfo>? children,
  }) : super(
          DiscoverRoute.name,
          args: DiscoverRouteArgs(
            key: key,
            initialIndex: initialIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static const _i50.PageInfo<DiscoverRouteArgs> page =
      _i50.PageInfo<DiscoverRouteArgs>(name);
}

class DiscoverRouteArgs {
  const DiscoverRouteArgs({
    this.key,
    this.initialIndex,
  });

  final _i51.Key? key;

  final int? initialIndex;

  @override
  String toString() {
    return 'DiscoverRouteArgs{key: $key, initialIndex: $initialIndex}';
  }
}

/// generated route for
/// [_i11.DiscoverSearchPage]
class DiscoverSearchRoute extends _i50.PageRouteInfo<void> {
  const DiscoverSearchRoute({List<_i50.PageRouteInfo>? children})
      : super(
          DiscoverSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverSearchRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i12.DiscoveryMapViewPage]
class DiscoveryMapViewRoute extends _i50.PageRouteInfo<void> {
  const DiscoveryMapViewRoute({List<_i50.PageRouteInfo>? children})
      : super(
          DiscoveryMapViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoveryMapViewRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i13.DraftPage]
class DraftRoute extends _i50.PageRouteInfo<void> {
  const DraftRoute({List<_i50.PageRouteInfo>? children})
      : super(
          DraftRoute.name,
          initialChildren: children,
        );

  static const String name = 'DraftRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i14.EventBlockPage]
class EventBlockRoute extends _i50.PageRouteInfo<void> {
  const EventBlockRoute({List<_i50.PageRouteInfo>? children})
      : super(
          EventBlockRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventBlockRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i15.EventDetailsPage]
class EventDetailsRoute extends _i50.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    required String eventId,
    String? applauseCount,
    bool isNotification = false,
    void Function()? onLikeIncrement,
    _i51.Key? key,
    List<_i50.PageRouteInfo>? children,
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

  static const _i50.PageInfo<EventDetailsRouteArgs> page =
      _i50.PageInfo<EventDetailsRouteArgs>(name);
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

  final _i51.Key? key;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{eventId: $eventId, applauseCount: $applauseCount, isNotification: $isNotification, onLikeIncrement: $onLikeIncrement, key: $key}';
  }
}

/// generated route for
/// [_i16.EventJoinedUserPage]
class EventJoinedUserRoute
    extends _i50.PageRouteInfo<EventJoinedUserRouteArgs> {
  EventJoinedUserRoute({
    required String eventId,
    bool isManagement = true,
    _i51.Key? key,
    List<_i50.PageRouteInfo>? children,
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

  static const _i50.PageInfo<EventJoinedUserRouteArgs> page =
      _i50.PageInfo<EventJoinedUserRouteArgs>(name);
}

class EventJoinedUserRouteArgs {
  const EventJoinedUserRouteArgs({
    required this.eventId,
    this.isManagement = true,
    this.key,
  });

  final String eventId;

  final bool isManagement;

  final _i51.Key? key;

  @override
  String toString() {
    return 'EventJoinedUserRouteArgs{eventId: $eventId, isManagement: $isManagement, key: $key}';
  }
}

/// generated route for
/// [_i17.EventRatingsAllPage]
class EventRatingsAllRoute
    extends _i50.PageRouteInfo<EventRatingsAllRouteArgs> {
  EventRatingsAllRoute({
    required _i51.ScrollController dragScrollController,
    List<_i54.Ratings>? ratingsList,
    _i51.Key? key,
    List<_i50.PageRouteInfo>? children,
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

  static const _i50.PageInfo<EventRatingsAllRouteArgs> page =
      _i50.PageInfo<EventRatingsAllRouteArgs>(name);
}

class EventRatingsAllRouteArgs {
  const EventRatingsAllRouteArgs({
    required this.dragScrollController,
    this.ratingsList,
    this.key,
  });

  final _i51.ScrollController dragScrollController;

  final List<_i54.Ratings>? ratingsList;

  final _i51.Key? key;

  @override
  String toString() {
    return 'EventRatingsAllRouteArgs{dragScrollController: $dragScrollController, ratingsList: $ratingsList, key: $key}';
  }
}

/// generated route for
/// [_i18.EventRequestPage]
class EventRequestRoute extends _i50.PageRouteInfo<EventRequestRouteArgs> {
  EventRequestRoute({
    required String eventId,
    _i51.Key? key,
    List<_i50.PageRouteInfo>? children,
  }) : super(
          EventRequestRoute.name,
          args: EventRequestRouteArgs(
            eventId: eventId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EventRequestRoute';

  static const _i50.PageInfo<EventRequestRouteArgs> page =
      _i50.PageInfo<EventRequestRouteArgs>(name);
}

class EventRequestRouteArgs {
  const EventRequestRouteArgs({
    required this.eventId,
    this.key,
  });

  final String eventId;

  final _i51.Key? key;

  @override
  String toString() {
    return 'EventRequestRouteArgs{eventId: $eventId, key: $key}';
  }
}

/// generated route for
/// [_i19.FollowersUserSearchPage]
class FollowersUserSearchRoute
    extends _i50.PageRouteInfo<FollowersUserSearchRouteArgs> {
  FollowersUserSearchRoute({
    required String userId,
    _i51.Key? key,
    bool isRoute = false,
    List<_i50.PageRouteInfo>? children,
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

  static const _i50.PageInfo<FollowersUserSearchRouteArgs> page =
      _i50.PageInfo<FollowersUserSearchRouteArgs>(name);
}

class FollowersUserSearchRouteArgs {
  const FollowersUserSearchRouteArgs({
    required this.userId,
    this.key,
    this.isRoute = false,
  });

  final String userId;

  final _i51.Key? key;

  final bool isRoute;

  @override
  String toString() {
    return 'FollowersUserSearchRouteArgs{userId: $userId, key: $key, isRoute: $isRoute}';
  }
}

/// generated route for
/// [_i20.FriendsRequestPage]
class FriendsRequestRoute extends _i50.PageRouteInfo<FriendsRequestRouteArgs> {
  FriendsRequestRoute({
    String? userId,
    _i51.Key? key,
    List<_i50.PageRouteInfo>? children,
  }) : super(
          FriendsRequestRoute.name,
          args: FriendsRequestRouteArgs(
            userId: userId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FriendsRequestRoute';

  static const _i50.PageInfo<FriendsRequestRouteArgs> page =
      _i50.PageInfo<FriendsRequestRouteArgs>(name);
}

class FriendsRequestRouteArgs {
  const FriendsRequestRouteArgs({
    this.userId,
    this.key,
  });

  final String? userId;

  final _i51.Key? key;

  @override
  String toString() {
    return 'FriendsRequestRouteArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i21.FriendsSearchPage]
class FriendsSearchRoute extends _i50.PageRouteInfo<FriendsSearchRouteArgs> {
  FriendsSearchRoute({
    String? userId,
    _i51.Key? key,
    bool isRoute = false,
    List<_i50.PageRouteInfo>? children,
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

  static const _i50.PageInfo<FriendsSearchRouteArgs> page =
      _i50.PageInfo<FriendsSearchRouteArgs>(name);
}

class FriendsSearchRouteArgs {
  const FriendsSearchRouteArgs({
    this.userId,
    this.key,
    this.isRoute = false,
  });

  final String? userId;

  final _i51.Key? key;

  final bool isRoute;

  @override
  String toString() {
    return 'FriendsSearchRouteArgs{userId: $userId, key: $key, isRoute: $isRoute}';
  }
}

/// generated route for
/// [_i22.GroupDetailsPage]
class GroupDetailsRoute extends _i50.PageRouteInfo<GroupDetailsRouteArgs> {
  GroupDetailsRoute({
    required String roomId,
    _i51.Key? key,
    List<_i50.PageRouteInfo>? children,
  }) : super(
          GroupDetailsRoute.name,
          args: GroupDetailsRouteArgs(
            roomId: roomId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GroupDetailsRoute';

  static const _i50.PageInfo<GroupDetailsRouteArgs> page =
      _i50.PageInfo<GroupDetailsRouteArgs>(name);
}

class GroupDetailsRouteArgs {
  const GroupDetailsRouteArgs({
    required this.roomId,
    this.key,
  });

  final String roomId;

  final _i51.Key? key;

  @override
  String toString() {
    return 'GroupDetailsRouteArgs{roomId: $roomId, key: $key}';
  }
}

/// generated route for
/// [_i23.HobyQuestionPage]
class HobyQuestionRoute extends _i50.PageRouteInfo<void> {
  const HobyQuestionRoute({List<_i50.PageRouteInfo>? children})
      : super(
          HobyQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'HobyQuestionRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i24.HomePage]
class HomeRoute extends _i50.PageRouteInfo<void> {
  const HomeRoute({List<_i50.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i25.JoinWithFriendsPage]
class JoinWithFriendsRoute
    extends _i50.PageRouteInfo<JoinWithFriendsRouteArgs> {
  JoinWithFriendsRoute({
    required String eventId,
    String? ticketUrl,
    _i55.Key? key,
    List<_i50.PageRouteInfo>? children,
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

  static const _i50.PageInfo<JoinWithFriendsRouteArgs> page =
      _i50.PageInfo<JoinWithFriendsRouteArgs>(name);
}

class JoinWithFriendsRouteArgs {
  const JoinWithFriendsRouteArgs({
    required this.eventId,
    this.ticketUrl,
    this.key,
  });

  final String eventId;

  final String? ticketUrl;

  final _i55.Key? key;

  @override
  String toString() {
    return 'JoinWithFriendsRouteArgs{eventId: $eventId, ticketUrl: $ticketUrl, key: $key}';
  }
}

/// generated route for
/// [_i26.LanguageSelectorPage]
class LanguageSelectorRoute extends _i50.PageRouteInfo<void> {
  const LanguageSelectorRoute({List<_i50.PageRouteInfo>? children})
      : super(
          LanguageSelectorRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageSelectorRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i27.LikesPage]
class LikesRoute extends _i50.PageRouteInfo<void> {
  const LikesRoute({List<_i50.PageRouteInfo>? children})
      : super(
          LikesRoute.name,
          initialChildren: children,
        );

  static const String name = 'LikesRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i28.NewGroupPage]
class NewGroupRoute extends _i50.PageRouteInfo<void> {
  const NewGroupRoute({List<_i50.PageRouteInfo>? children})
      : super(
          NewGroupRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewGroupRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i29.NotificationPage]
class NotificationRoute extends _i50.PageRouteInfo<NotificationRouteArgs> {
  NotificationRoute({
    _i51.Key? key,
    bool isNotification = false,
    List<_i50.PageRouteInfo>? children,
  }) : super(
          NotificationRoute.name,
          args: NotificationRouteArgs(
            key: key,
            isNotification: isNotification,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i50.PageInfo<NotificationRouteArgs> page =
      _i50.PageInfo<NotificationRouteArgs>(name);
}

class NotificationRouteArgs {
  const NotificationRouteArgs({
    this.key,
    this.isNotification = false,
  });

  final _i51.Key? key;

  final bool isNotification;

  @override
  String toString() {
    return 'NotificationRouteArgs{key: $key, isNotification: $isNotification}';
  }
}

/// generated route for
/// [_i30.ProfilEditPage]
class ProfilEditRoute extends _i50.PageRouteInfo<ProfilEditRouteArgs> {
  ProfilEditRoute({
    _i51.Key? key,
    _i30.ProfilScrollPosition? profilScrollPosition,
    List<_i50.PageRouteInfo>? children,
  }) : super(
          ProfilEditRoute.name,
          args: ProfilEditRouteArgs(
            key: key,
            profilScrollPosition: profilScrollPosition,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfilEditRoute';

  static const _i50.PageInfo<ProfilEditRouteArgs> page =
      _i50.PageInfo<ProfilEditRouteArgs>(name);
}

class ProfilEditRouteArgs {
  const ProfilEditRouteArgs({
    this.key,
    this.profilScrollPosition,
  });

  final _i51.Key? key;

  final _i30.ProfilScrollPosition? profilScrollPosition;

  @override
  String toString() {
    return 'ProfilEditRouteArgs{key: $key, profilScrollPosition: $profilScrollPosition}';
  }
}

/// generated route for
/// [_i31.ProfilePage]
class ProfileRoute extends _i50.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i51.Key? key,
    String? userId,
    _i51.ScrollController? controller,
    List<_i50.PageRouteInfo>? children,
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

  static const _i50.PageInfo<ProfileRouteArgs> page =
      _i50.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.userId,
    this.controller,
  });

  final _i51.Key? key;

  final String? userId;

  final _i51.ScrollController? controller;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, userId: $userId, controller: $controller}';
  }
}

/// generated route for
/// [_i32.ReadyTemplatePage]
class ReadyTemplateRoute extends _i50.PageRouteInfo<ReadyTemplateRouteArgs> {
  ReadyTemplateRoute({
    _i56.Key? key,
    _i56.ScrollController? controller,
    List<_i50.PageRouteInfo>? children,
  }) : super(
          ReadyTemplateRoute.name,
          args: ReadyTemplateRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'ReadyTemplateRoute';

  static const _i50.PageInfo<ReadyTemplateRouteArgs> page =
      _i50.PageInfo<ReadyTemplateRouteArgs>(name);
}

class ReadyTemplateRouteArgs {
  const ReadyTemplateRouteArgs({
    this.key,
    this.controller,
  });

  final _i56.Key? key;

  final _i56.ScrollController? controller;

  @override
  String toString() {
    return 'ReadyTemplateRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i33.ReadyTemplatePixelsPage]
class ReadyTemplatePixelsRoute
    extends _i50.PageRouteInfo<ReadyTemplatePixelsRouteArgs> {
  ReadyTemplatePixelsRoute({
    _i51.Key? key,
    _i51.ScrollController? controller,
    List<_i50.PageRouteInfo>? children,
  }) : super(
          ReadyTemplatePixelsRoute.name,
          args: ReadyTemplatePixelsRouteArgs(
            key: key,
            controller: controller,
          ),
          initialChildren: children,
        );

  static const String name = 'ReadyTemplatePixelsRoute';

  static const _i50.PageInfo<ReadyTemplatePixelsRouteArgs> page =
      _i50.PageInfo<ReadyTemplatePixelsRouteArgs>(name);
}

class ReadyTemplatePixelsRouteArgs {
  const ReadyTemplatePixelsRouteArgs({
    this.key,
    this.controller,
  });

  final _i51.Key? key;

  final _i51.ScrollController? controller;

  @override
  String toString() {
    return 'ReadyTemplatePixelsRouteArgs{key: $key, controller: $controller}';
  }
}

/// generated route for
/// [_i34.RemoveUserPage]
class RemoveUserRoute extends _i50.PageRouteInfo<void> {
  const RemoveUserRoute({List<_i50.PageRouteInfo>? children})
      : super(
          RemoveUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'RemoveUserRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i35.SearchScreenPage]
class SearchScreenRoute extends _i50.PageRouteInfo<SearchScreenRouteArgs> {
  SearchScreenRoute({
    _i51.Key? key,
    bool isRoute = false,
    List<_i50.PageRouteInfo>? children,
  }) : super(
          SearchScreenRoute.name,
          args: SearchScreenRouteArgs(
            key: key,
            isRoute: isRoute,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchScreenRoute';

  static const _i50.PageInfo<SearchScreenRouteArgs> page =
      _i50.PageInfo<SearchScreenRouteArgs>(name);
}

class SearchScreenRouteArgs {
  const SearchScreenRouteArgs({
    this.key,
    this.isRoute = false,
  });

  final _i51.Key? key;

  final bool isRoute;

  @override
  String toString() {
    return 'SearchScreenRouteArgs{key: $key, isRoute: $isRoute}';
  }
}

/// generated route for
/// [_i36.SecurityPage]
class SecurityRoute extends _i50.PageRouteInfo<void> {
  const SecurityRoute({List<_i50.PageRouteInfo>? children})
      : super(
          SecurityRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecurityRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i37.SettingsPage]
class SettingsRoute extends _i50.PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    required int userType,
    _i51.Key? key,
    List<_i50.PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(
            userType: userType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i50.PageInfo<SettingsRouteArgs> page =
      _i50.PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({
    required this.userType,
    this.key,
  });

  final int userType;

  final _i51.Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{userType: $userType, key: $key}';
  }
}

/// generated route for
/// [_i38.SigninPage]
class SigninRoute extends _i50.PageRouteInfo<void> {
  const SigninRoute({List<_i50.PageRouteInfo>? children})
      : super(
          SigninRoute.name,
          initialChildren: children,
        );

  static const String name = 'SigninRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i39.SignupPage]
class SignupRoute extends _i50.PageRouteInfo<void> {
  const SignupRoute({List<_i50.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i40.SplashViewPage]
class SplashViewRoute extends _i50.PageRouteInfo<void> {
  const SplashViewRoute({List<_i50.PageRouteInfo>? children})
      : super(
          SplashViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashViewRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i41.ThemeModeSelectorPage]
class ThemeModeSelectorRoute extends _i50.PageRouteInfo<void> {
  const ThemeModeSelectorRoute({List<_i50.PageRouteInfo>? children})
      : super(
          ThemeModeSelectorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThemeModeSelectorRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i42.UserImageQuestionPage]
class UserImageQuestionRoute extends _i50.PageRouteInfo<void> {
  const UserImageQuestionRoute({List<_i50.PageRouteInfo>? children})
      : super(
          UserImageQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserImageQuestionRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i43.UserProfilePage]
class UserProfileRoute extends _i50.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    required String userId,
    _i51.Key? key,
    List<_i50.PageRouteInfo>? children,
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

  static const _i50.PageInfo<UserProfileRouteArgs> page =
      _i50.PageInfo<UserProfileRouteArgs>(name);
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({
    required this.userId,
    this.key,
  });

  final String userId;

  final _i51.Key? key;

  @override
  String toString() {
    return 'UserProfileRouteArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [_i44.UserTypeQuestionPage]
class UserTypeQuestionRoute extends _i50.PageRouteInfo<void> {
  const UserTypeQuestionRoute({List<_i50.PageRouteInfo>? children})
      : super(
          UserTypeQuestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserTypeQuestionRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i45.VerifyEmailPage]
class VerifyEmailRoute extends _i50.PageRouteInfo<void> {
  const VerifyEmailRoute({List<_i50.PageRouteInfo>? children})
      : super(
          VerifyEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyEmailRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i46.VerifyPhonePage]
class VerifyPhoneRoute extends _i50.PageRouteInfo<void> {
  const VerifyPhoneRoute({List<_i50.PageRouteInfo>? children})
      : super(
          VerifyPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyPhoneRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i47.VerifyPhoneSpecialPage]
class VerifyPhoneSpecialRoute extends _i50.PageRouteInfo<void> {
  const VerifyPhoneSpecialRoute({List<_i50.PageRouteInfo>? children})
      : super(
          VerifyPhoneSpecialRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyPhoneSpecialRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i48.WelcomePage]
class WelcomeRoute extends _i50.PageRouteInfo<void> {
  const WelcomeRoute({List<_i50.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}

/// generated route for
/// [_i49.WidgetTestPage]
class WidgetTestRoute extends _i50.PageRouteInfo<void> {
  const WidgetTestRoute({List<_i50.PageRouteInfo>? children})
      : super(
          WidgetTestRoute.name,
          initialChildren: children,
        );

  static const String name = 'WidgetTestRoute';

  static const _i50.PageInfo<void> page = _i50.PageInfo<void>(name);
}
