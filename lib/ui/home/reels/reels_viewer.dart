import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:togodo/core/component/custom_refresher.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/ui/common/welcome.dart';
import 'package:togodo/ui/home/reels/components/guest_event_button.dart';
import 'package:togodo/ui/home/reels/components/reels_bottom_button.dart';
import 'package:togodo/ui/home/reels/reels_page.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';

class ReelsViewer extends HookConsumerWidget {
  const ReelsViewer({
    required this.reelsList,
    required this.controller,
    super.key,
    this.showVerifiedTick = true,
    this.onClickMoreBtn,
    this.onFollow,
    this.onLike,
    this.onTap,
    this.onShare,
    this.appbarTitle,
    this.showAppbar = true,
    this.onClickBackArrow,
    this.onIndexChanged,
  });

  /// use reel model and provide list of reels, list contains reels object, object contains url and other parameters
  final List<EventModel> reelsList;

  /// use to show/hide verified tick, by default true
  final bool showVerifiedTick;

  /// function invoke when user click on share btn and return reel url
  final void Function(EventCommonProperties)? onShare;

  /// function invoke when user click on like btn and return reel url
  final void Function(String)? onLike;

  /// function invoke when user click on like btn and return reel url
  final void Function(String)? onTap;

  /// function invoke when reel change and return current index
  final void Function(int)? onIndexChanged;

  /// function invoke when user click on more options btn
  final void Function()? onClickMoreBtn;

  /// function invoke when user click on follow btn
  final void Function()? onFollow;

  /// for change appbar title
  final String? appbarTitle;

  /// for show/hide appbar, by default true
  final bool showAppbar;

  /// function invoke when user click on back btn
  final void Function()? onClickBackArrow;
  final SwiperController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(homeViewModelProvider.notifier);
    final model = ref.read(homeViewModelProvider);
    final refreshController = RefreshController();
    final index = (model.isToday ? model.dailyIndex : model.forYouIndex);
    final userType = ref.watch(userTypeStateNotifierProvider);

    return Stack(
      children: [
        Swiper(
          loop: false,
          itemBuilder: (BuildContext context, int index) {
            return /* _index != 0 && _index & 5 == 0
                ? QuizView(
                    item: widget.reelsList[index - 1],
                    controller: controller,
                  )
                : */
                index == 0
                    ? CustomRefresher(
                        controller: refreshController,
                        onRefresh: () {
                          if (model.isToday) {
                            notifier.fetchEventsDaily();
                          } else {
                            notifier.fetchEvents();
                          }
                        },
                        onLoading: controller.next,
                        enablePullUp: true,
                        child: reelsMain(index),
                      )
                    : reelsMain(index);
          },
          controller: controller,
          itemCount: reelsList.length,
          scrollDirection: Axis.vertical,
          onIndexChanged: (value) {
            notifier.addIndex(value);
            onIndexChanged?.call(value);
          },
        ),
        if (showAppbar && reelsList.isNotEmpty && reelsList.length > index)
          /*   _index != 0 && _index & 5 == 0
              ? const SizedBox.shrink()
              :  */
          if (userType == UserType.user)
            ReelsBottomButton(
              model: reelsList[index],
            )
          else
            const GuestEventButton(),
      ],
    );
  }

  ReelsPage reelsMain(int index) {
    return ReelsPage(
      item: reelsList[index],
      onClickMoreBtn: onClickMoreBtn,
      onFollow: onFollow,
      onLike: onLike,
      onTap: onTap,
      onShare: onShare,
      swiperController: controller,
    );
  }
}
