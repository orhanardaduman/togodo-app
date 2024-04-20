import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:togodo/core/component/custom_event_card.dart';
import 'package:togodo/core/component/custom_refresher.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/ui/profile/view_model/tab_joined_event_view_model.dart';

class TabEventsJoinedView extends StatefulHookConsumerWidget {
  const TabEventsJoinedView({super.key, this.userId});
  final String? userId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TabEventsJoinedViewState();
}

class _TabEventsJoinedViewState extends ConsumerState<TabEventsJoinedView> {
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
          .read(tabEventsJoinedViewModelProvider(widget.userId).notifier)
          .fetchEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(tabEventsJoinedViewModelProvider(widget.userId));
    final notifier =
        ref.watch(tabEventsJoinedViewModelProvider(widget.userId).notifier);
    final router = useRouter();
    // homeViewModel.data içerisinde verilerinizi bulabilirsiniz.
    return data.loading
        ? const SizedBox.shrink()
        : CustomRefresher(
            controller: _refreshController,
            onRefresh: () async => notifier.fetchEvents(),
            onLoading: () async => notifier.fetchMoreEvents(),
            enablePullUp: true,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
