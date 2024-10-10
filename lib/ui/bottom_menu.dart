// ignore_for_file: avoid_bool_literals_in_conditional_expressions, deprecated_member_use_from_same_package, use_setters_to_change_properties
import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/custom_bottom_navigation.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/notification/fcm_model.dart';
import 'package:togodo/core/notification/fcm_notification_service.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/component/event_remove_popup.dart';
import 'package:togodo/features/component/won_popup.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/chat/widgets/message_chat_popup.dart';
import 'package:togodo/ui/common/welcome.dart';
import 'package:togodo/ui/event/create_event_page.dart';
import 'package:togodo/ui/event/widget/event_rating_popup.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';
import 'package:togodo/ui/notification_view_model.dart';

import 'home/widget/rate_popup.dart';
//import 'package:uni_links/uni_links.dart';

class IntStateNotifier extends StateNotifier<int> {
  IntStateNotifier() : super(0); // Başlangıç değeri 0 olarak ayarlanır.

  void setInt(int value) {
    state = value;
  }
}

// StateNotifierProvider'ı kullanarak hangi sayfada olduğumuzu takip ediyoruz.
final intStateNotifierProvider =
    StateNotifierProvider((_) => IntStateNotifier());

@RoutePage()
class BottomMenuPage extends StatefulHookConsumerWidget {
  const BottomMenuPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomMenuPageState();
}

class _BottomMenuPageState extends ConsumerState<BottomMenuPage> {
  late final FCM firebaseMessaging;
  bool _newNotification = false;
  bool _isDialogShowing = false;
  bool _isRatingShowing = false;
  bool _isEventRemoveShow = false;
  bool _isWonShowing = false;
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollControllerTwo = ScrollController();

  StreamSubscription<dynamic>? _streamSubscription;
  @override
  void initState() {
    super.initState();
    final router = AutoRouter.of(context);
    _incomingLinkHandler(router);
    _initFCM();
    //checkHasDeep(router);
  }

  /* checkHasDeep(StackRouter router) async {
    final link = await getInitialLink();
    if (link != null) {
      final uri = Uri.parse(link);
      router.pushNamed(uri.path);
    }
  }*/

  void _incomingLinkHandler(StackRouter router) {
    // 1
    if (!kIsWeb) {
      final _appLinks = AppLinks(); // AppLinks is singleton

// Subscribe to all events (initial link and further)
      _appLinks.uriLinkStream.listen((uri) {
        print("uri deneme  " + uri.toString());
        router.pushNamed(uri.path);
      });
      // 2
      /* _streamSubscription = uriLinkStream.listen(
        (Uri? uri) {
          if (!mounted) {
            return;
          }
          debugPrint('Received URI: $uri');
          router.pushNamed(uri!.path);

          // 3
        },
        onError: (Object err) {
          if (!mounted) {
            return;
          }
          debugPrint('Error occurred: $err');
          setState(() {});
        },
      );*/
    }
  }

  void _initFCM() {
    firebaseMessaging = FCM();

    firebaseMessaging.streamCtlr.stream.listen(_changeWon);
  }

  void _showRatings(FcmModel msg) {
    if (msg.typeId == '4') {
      if (_isRatingShowing) return;
      _isRatingShowing = true;
      showDialog<Dialog>(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: CustomModal(
            maxHeight: context.sized.dynamicHeight(0.8),
            borderRadius: const BorderRadius.all(
              Radius.circular(52),
            ),
            child: RatingPopupView(
              eventName: msg.eventName ?? '',
              eventId: msg.eventId ?? '',
              onDissmissed: () {
                _isRatingShowing = false;
              },
            ),
          ),
        ),
      ).then((value) {
        _isRatingShowing = false;
        showToast(
          context,
          'Başarılı',
          gravity: ToastGravity.CENTER,
        );
        setState(() {});
      });
    }
  }

  void _deleteEvent(FcmModel msg) {
    if (msg.typeId == '5') {
      if (_isEventRemoveShow) return;
      _isEventRemoveShow = true;
      showDialog<Dialog>(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: EventRemoveWidget(
            eventName: msg.eventName ?? '',
            l10n: L10n.of(context)!,
            theme: ref.watch(appThemeProvider),
          ),
        ),
      ).then((value) => _isEventRemoveShow = false);
    }
  }

  void _changeWon(FcmModel msg) {
    _newNotification = msg.typeId == '2' || msg.typeId == '5' ? true : false;
    ref.read(notificationStateProvider.notifier)
      ..updateMessage(msg.typeId == '1' ? true : false)
      ..updateNotification(_newNotification);
    _showRatings(msg);
    _wonPopup(msg);
    _chatPopup(msg);
    _ratePopup(msg);
    _deleteEvent(msg);
  }

  void _wonPopup(FcmModel msg) {
    if (msg.typeId == '3') {
      if (_isWonShowing) return;
      _isWonShowing = true;
      final theme = ref.watch(appThemeProvider);
      final l10n = L10n.of(context)!;
      ref
          .read(homeViewModelProvider.notifier)
          .incrementNotificationJoinStatus(msg.eventId ?? '');
      showDialog<Dialog>(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: WonWidget(
            l10n: l10n,
            theme: theme,
            applause: msg.applauseCount ?? '',
          ),
        ),
      ).then((value) => _isWonShowing = false);
    }
  }

  void _chatPopup(FcmModel msg) {
    if (msg.typeId == '1') {
      if (_isDialogShowing) return;
      _isDialogShowing = true;
      final router = AutoRouter.of(context);
      final currentRoute = router.current;
      if (currentRoute.name == 'ChatHomeRoute' ||
          currentRoute.name == 'GroupRoute' ||
          currentRoute.name == 'ChatRoute') {
        _isDialogShowing = false;
        return;
      }
      showDialog<MessagePopUpWidget>(
        context: context,
        builder: (BuildContext context) {
          return MessagePopUpWidget(
            imgUrl: msg.userProfileImage ?? '',
            name: msg.userFullName ?? '',
            message: msg.chatContent ?? '',
            chatRoomId: msg.chatRoomId ?? '',
            userId: msg.userId ?? '',
            isGroup: msg.isGroup ?? '',
            type: msg.type ?? '',
          );
        },
      ).then((value) => _isDialogShowing = false);
    } else if (msg.typeId == '10') {
      if (_isDialogShowing) return;
      _isDialogShowing = true;
      final router = AutoRouter.of(context);
      final currentRoute = router.current;
      if (currentRoute.name == 'GroupRoute') {
        _isDialogShowing = false;
        return;
      }
      showDialog<MessagePopUpWidget>(
        context: context,
        builder: (BuildContext context) {
          return MessagePopUpWidget(
            imgUrl: msg.userProfileImage ?? '',
            name: msg.userFullName ?? '',
            message: msg.chatContent ?? '',
            chatRoomId: msg.chatRoomId ?? '',
            userId: msg.userId ?? '',
            isGroup: msg.isGroup ?? '',
            type: msg.type ?? '',
            isEventGroup: true,
          );
        },
      ).then((value) => _isDialogShowing = false);
    }
  }

  void _ratePopup(FcmModel msg) {
    if (msg.typeId == '8') {
      if (_isDialogShowing) return;
      _isDialogShowing = true;
      showDialog<MessagePopUpWidget>(
        context: context,
        builder: (BuildContext context) {
          return RatePopUpWidget(
            imgUrl: msg.userProfileImage ?? '',
            name: msg.userFullName ?? '',
            eventName: msg.eventName ?? '',
            rate: msg.rate ?? '',
          );
        },
      ).then((value) => _isDialogShowing = false);
    }
  }

  @override
  void dispose() {
    firebaseMessaging.dispose();
    _scrollController.dispose();
    _scrollControllerTwo.dispose();

    _streamSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    firebaseMessaging.setNotifications(
      context,
      AutoRouter.of(context),
      ref,
    );
    return AutoTabsScaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      routes: [
        const HomeRoute(),
        DiscoverRoute(),
        CreateEventRoute(),
        const LikesRoute(),
        ProfileRoute(controller: _scrollControllerTwo),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBarMenu(
          tabsRouter: tabsRouter,
          controllerTwo: _scrollControllerTwo,
          controller: _scrollController,
        );
      },
    );
  }
}

class BottomNavigationBarMenu extends HookConsumerWidget {
  const BottomNavigationBarMenu({
    required this.tabsRouter,
    required this.controller,
    required this.controllerTwo,
    super.key,
  });

  final TabsRouter tabsRouter;
  final ScrollController controller, controllerTwo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final bottomMenuState = ref.read(bottomMenuStateProvider.notifier);
    final userType = ref.watch(userTypeStateNotifierProvider);
    final bottomMenuModel = ref.watch(bottomMenuStateProvider);
    final color = theme.mode == ThemeMode.dark
        ? MainColors.bottomColor.withOpacity(0.85)
        : MainColors.white.withOpacity(0.85);
    return CustomBottomNavigationBar(
      currentIndex: tabsRouter.activeIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (userType == UserType.guest) {
          showGuestInfo(theme, context);
        } else {
          if (index == 2) {
            showMaterialModalBottomSheet<CreateEventPage>(
              context: context,
              enableDrag: false,
              builder: (BuildContext context) {
                // Burada yeni post ekleme formunuzu oluşturun
                return const CreateEventPage();
              },
            );
            return;
          }
          tabsRouter.setActiveIndex(index);
          ref.read(intStateNotifierProvider.notifier).setInt(index);
        }
      },
      backgroundColor: color,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedLabelStyle: theme.textTheme.bodyLarge.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
      ),
      unselectedLabelStyle: theme.textTheme.bodyLarge.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
      ),
      selectedItemColor: theme.appColors.themeColor,
      unselectedItemColor: theme.appColors.text,
      items: [
        BottomNavigationBarItem(
          backgroundColor: color,
          icon: tabsRouter.activeIndex == 0
              ? InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    bottomMenuState.updateBottomMenu(!bottomMenuModel);
                    if (bottomMenuModel) {
                      ref.read(homeViewModelProvider.notifier)
                        ..fetchEvents()
                        ..moveTop();
                    }
                  },
                  child: Assets.icons.bold.home.svg(
                    color: theme.appColors.themeColor,
                    width: 24,
                  ),
                )
              : Assets.icons.lightOutline.home.svg(
                  color: MainColors.grey500,
                  width: 24,
                ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: color,
          icon: tabsRouter.activeIndex == 1
              ? Assets.icons.bold.search.svg(
                  color: theme.appColors.themeColor,
                  width: 24,
                )
              : Assets.icons.lightOutline.search.svg(
                  color: MainColors.grey500,
                  width: 24,
                ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          backgroundColor: color,
          icon: Container(
            decoration: BoxDecoration(
              color: tabsRouter.activeIndex == 2
                  ? theme.appColors.themeColor
                  : (theme.mode == ThemeMode.dark
                      ? MainColors.grey600.withOpacity(0.2)
                      : MainColors.transparentBlue),
              borderRadius: BorderRadius.circular(16),
            ),
            width: 48,
            height: 48,
            child: Icon(
              Icons.add,
              color: theme.mode == ThemeMode.dark
                  ? MainColors.white
                  : MainColors.primary,
              size: 24,
            ),
          ),
          label: 'Adds',
        ),
        BottomNavigationBarItem(
          backgroundColor: color,
          icon: tabsRouter.activeIndex == 3
              ? Assets.icons.bold.heart.svg(
                  color: theme.appColors.themeColor,
                  width: 24,
                )
              : Assets.icons.lightOutline.heart.svg(
                  color: MainColors.grey500,
                  width: 24,
                ),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          backgroundColor: color,
          icon: tabsRouter.activeIndex == 4
              ? InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    /*bottomMenuState.updateBottomMenu(!bottomMenuModel);
                    if (bottomMenuModel) {
                    }*/
                    controllerTwo.animateTo(
                      0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                    //indicator.currentState?.show(atTop: true);
                  },
                  child: Assets.icons.bold.profile.svg(
                    color: theme.appColors.themeColor,
                    width: 24,
                  ),
                )
              : Assets.icons.lightOutline.profile.svg(
                  color: MainColors.grey500,
                  width: 24,
                ),
          label: 'Profile',
        ),
      ],
    );
  }

  Positioned countBadge() {
    return Positioned(
      top: 0,
      right: 0,
      child: Semantics(
        label: 'Notifications count badge',
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
