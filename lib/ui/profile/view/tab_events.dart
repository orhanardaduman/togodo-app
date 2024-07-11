import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:togodo/core/component/custom_event_card.dart';
import 'package:togodo/core/component/custom_refresher.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/profile/view_model/tab_events_view_model.dart';
import 'package:togodo/ui/profile/widget/null_event.dart';

class TabEventsView extends StatefulHookConsumerWidget {
  const TabEventsView({
    required this.isCurrentUser,
    super.key,
    this.userId,
  });
  final String? userId;
  final bool isCurrentUser;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabEventsViewState();
}

class _TabEventsViewState extends ConsumerState<TabEventsView> {
  final RefreshController _refreshController = RefreshController();
  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(tabEventsViewModelProvider(widget.userId).notifier)
          .fetchEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(tabEventsViewModelProvider(widget.userId));
    final notifier =
        ref.watch(tabEventsViewModelProvider(widget.userId).notifier);
    final router = useRouter();
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    // homeViewModel.data içerisinde verilerinizi bulabilirsiniz.
    return data.loading
        ? const SizedBox.shrink()
        : CustomRefresher(
            controller: _refreshController,
            onRefresh: () async => notifier.fetchEvents(),
            onLoading: () async => notifier.fetchMoreEvents(),
            enablePullUp: true,
            child: data.events.isEmpty
                ? NullEventWidget(
                    theme: theme,
                    userId: widget.userId,
                    userName: '',
                    l10n: l10n,
                    isCurrentUser: widget.isCurrentUser,
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Yan yana iki öğe olacak
                      crossAxisSpacing: 18, // Yatay aralık
                      mainAxisSpacing: 16, // Dikey aralık
                      childAspectRatio:
                          189 / 302, // Öğelerin genişlik/yükseklik oranı
                    ),
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 24,
                      bottom: 100,
                    ),
                    itemCount: data.events.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          router.push(
                            EventDetailsRoute(eventId: data.events[index].id!),
                          );
                        },
                        child: EnventCards(
                          data: data.events[index],
                          isShowRating: true,
                        ),
                      );
                    },
                  ),
          );
  }
}
