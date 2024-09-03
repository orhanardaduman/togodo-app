import 'dart:developer';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:togodo/core/helpers/index.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/common/welcome.dart';
import 'package:togodo/ui/home/reels/components/app_bar.dart';
import 'package:togodo/ui/home/reels/reels_viewer.dart';
import 'package:togodo/ui/home/view/share_event.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';

import '../notification_view_model.dart';

@RoutePage()
class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userType = ref.watch(userTypeStateNotifierProvider);
      initPlugin();
      if (userType == UserType.guest) {
        ref.read(homeViewModelProvider.notifier).fetchEventsGuest();
      } else {
        ref.read(notificationStateProvider.notifier).getHasUnread();
        ref.read(notificationStateProvider.notifier).getHasUnreadMessage();
        ref.read(notificationStateProvider.notifier).hasNeededRatings(context);
        ref.read(userViewModelProvider).tokenCheck();
        ref.read(homeViewModelProvider.notifier)
              ..fetchEvents()
              ..fetchEventsDaily()
              ..getEnableShowcase()
            /* .then(
          (value) => requestLocationService(
            ref.read(appThemeProvider),
            L10n.of(context)!,
            context,
          ),
        ) */
            ;
      }
    });
  }

  Future<void> initPlugin() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final status = await AppTrackingTransparency.trackingAuthorizationStatus;
      // If the system can show an authorization request dialog
      if (status == TrackingStatus.notDetermined) {
        await AppTrackingTransparency.requestTrackingAuthorization();
      }
      // ignore: empty_catches
    } on PlatformException {}

    await AppTrackingTransparency.getAdvertisingIdentifier();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(homeViewModelProvider);
    final notifier = ref.read(homeViewModelProvider.notifier);
    final router = useRouter();
    final theme = ref.watch(appThemeProvider);
    final userType = ref.watch(userTypeStateNotifierProvider);
    // homeViewModel.data içerisinde verilerinizi bulabilirsiniz.
    return SafeArea(
      bottom: false,
      top: false,
      child: Stack(
        children: [
          PreloadPageView(
            controller: notifier.mainController,
            preloadPagesCount: 2,
            onPageChanged: (value) {
              notifier.changeToday(
                isVal: value == 1,
              );
              if (value == 0) {
                notifier.fetchEvents();
              } else {
                notifier.fetchEventsDaily();
              }
            },
            children: [
              body(
                data.events,
                router,
                context,
                notifier,
                userType! as UserType,
                theme,
              ),
              body(
                data.eventsDaily,
                router,
                context,
                notifier,
                userType as UserType,
                theme,
                isDaily: true,
              ),
            ],
          ),
          ReelsAppBar(
            controller: notifier.mainController,
            onTopMove: notifier.moveTop,
          ),
        ],
      ),
    );
  }

  Widget body(
    List<EventModel> data,
    StackRouter router,
    BuildContext context,
    HomeViewModel notifier,
    UserType userType,
    AppTheme theme, {
    bool isDaily = false,
  }) {
    return /* data.isShimmerShow
        ? MyShimmerWidget(
            theme: theme,
          )
        :  */
        ReelsViewer(
      reelsList: data,
      controller:
          isDaily ? notifier.dailyController : notifier.forYouController,
      onTap: (p0) {
        router.push(EventDetailsRoute(eventId: p0));
      },
      onShare: (evet) {
        if (userType == UserType.guest) {
          return showGuestInfo(theme, context);
        }
        showModalBottomSheet<DraggableScrollableSheet>(
          context: context,
          enableDrag: false,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            // Burada yeni post ekleme formunuzu oluşturun
            return DraggableScrollableSheet(
              minChildSize: 0.6,
              maxChildSize: 0.9,
              initialChildSize: 0.85,
              builder: (_, controller) {
                return ShareEvent(
                  event: evet,
                  controller: controller,
                );
              },
            );
          },
        );
      },
      onLike: (id) {
        if (userType == UserType.guest) {
          return showGuestInfo(theme, context);
        }
        notifier.toggleLike(id);
      },
      onFollow: () {
        log('======> Clicked on follow <======');
      },
      onClickMoreBtn: () {
        log('======> Clicked on more option <======');
      },
      onClickBackArrow: () {
        log('======> Clicked on back arrow <======');
      },
      onIndexChanged: (index) {
        print(index);
        if (index % 9 == 0) {
          if (userType == UserType.guest) {
            notifier.fetchEventsGuest();
          } else {
            isDaily ? notifier.fetchEventsDaily() : notifier.fetchMoreReels();
          }
        }
      },
    );
  }
}
