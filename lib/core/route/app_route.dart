import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:togodo/core/route/app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: SplashViewRoute.page,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: '/welcome',
          page: WelcomeRoute.page,
        ),
        AutoRoute(
          path: '/signUp',
          page: SignupRoute.page,
        ),
        AutoRoute(
          path: '/signIn',
          page: SigninRoute.page,
        ),
        AutoRoute(
          path: '/verifyPhone',
          page: VerifyPhoneRoute.page,
        ),
        AutoRoute(
          path: '/verifyEmail',
          page: VerifyEmailRoute.page,
        ),
        AutoRoute(
          path: '/userTypeQuestion',
          page: UserTypeQuestionRoute.page,
        ),
        AutoRoute(
          path: '/hobyQuestion',
          page: HobyQuestionRoute.page,
        ),
        AutoRoute(
          path: '/userImageQuestion',
          page: UserImageQuestionRoute.page,
        ),
        AutoRoute(
          path: '/home',
          page: BottomMenuRoute.page,
          initial: true,
          children: <AutoRoute>[
            AutoRoute(
              path: 'home',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'discover',
              page: DiscoverRoute.page,
            ),
            CustomRoute(
              path: 'createEvent',
              page: CreateEventRoute.page,
              fullMatch: true,
              transitionsBuilder: TransitionsBuilders.slideTop,
            ),
            AutoRoute(
              path: 'likes',
              page: LikesRoute.page,
            ),
            AutoRoute(
              path: 'profile',
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/notification',
          page: NotificationRoute.page,
        ),
        AutoRoute(
          path: '/settings',
          page: SettingsRoute.page,
        ),
        AutoRoute(
          path: '/profilEdit',
          page: ProfilEditRoute.page,
        ),
        AutoRoute(
          path: '/newGroup',
          page: NewGroupRoute.page,
        ),
        AutoRoute(
          path: '/groupDetails',
          page: GroupDetailsRoute.page,
        ),
        AutoRoute(
          path: '/addGroupChatUser',
          page: AddGroupChatUserRoute.page,
        ),
        AutoRoute(
          path: '/discoverSearch',
          page: DiscoverSearchRoute.page,
        ),
        AutoRoute(
          path: '/userSearch',
          page: FriendsSearchRoute.page,
        ),
        AutoRoute(
          path: '/removeUser',
          page: RemoveUserRoute.page,
        ),
        AutoRoute(
          path: '/followers',
          page: FollowersUserSearchRoute.page,
        ),
        AutoRoute(
          path: '/theme',
          page: ThemeModeSelectorRoute.page,
        ),
        AutoRoute(
          path: '/language',
          page: LanguageSelectorRoute.page,
        ),
        AutoRoute(
          path: '/draft',
          page: DraftRoute.page,
        ),
        AutoRoute(
          path: '/friendsRequest',
          page: FriendsRequestRoute.page,
        ),
        AutoRoute(
          path: '/requestEvent',
          page: EventRequestRoute.page,
        ),
        AutoRoute(
          path: '/eventJoined',
          page: EventJoinedUserRoute.page,
        ),
        AutoRoute(
          path: '/eventJoinedWithFriends',
          page: JoinWithFriendsRoute.page,
        ),
        AutoRoute(
          path: '/EventDetails/:eventId',
          page: EventDetailsRoute.page,
        ),
        AutoRoute(
          path: '/userProfile/:userId',
          page: UserProfileRoute.page,
        ),
        AutoRoute(
          path: '/blockUser',
          page: BlockUserRoute.page,
        ),
        AutoRoute(
          path: '/security',
          page: SecurityRoute.page,
        ),
        AutoRoute(
          path: '/comment',
          page: CommentRoute.page,
        ),
        AutoRoute(
          path: '/discoveryMapView',
          page: DiscoveryMapViewRoute.page,
        ),
        AutoRoute(
          path: '/searchScreen',
          page: SearchScreenRoute.page,
        ),
        AutoRoute(
          path: '/eventBlock',
          page: EventBlockRoute.page,
        ),
        CustomRoute(
          path: '/createEventSuccess',
          page: CreateEventSuccesRoute.page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
        AutoRoute(
          path: '/chatHome',
          page: ChatHomeRoute.page,
        ),
        AutoRoute(
          path: '/chat',
          page: ChatRoute.page,
        ),
        AutoRoute(
          path: '/group',
          page: GroupRoute.page,
        ),
        AutoRoute(
          path: '/adminDashboard',
          page: AdminDashboardRoute.page,
        ),
      ];
}
