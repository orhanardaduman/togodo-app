import 'package:flutter/material.dart';
import 'package:flutter_liquid_swipe/flutter_liquid_swipe.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/ui/common/welcome.dart';
import 'package:togodo/ui/home/reels/components/guest_event_button.dart';
import 'package:togodo/ui/home/reels/components/reels_bottom_button.dart';
import 'package:togodo/ui/home/reels/reels_page.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';

import '../../../core/component/custom_refresher.dart';
import 'group_view/reels_group_view.dart';

class ReelsViewer extends StatefulHookConsumerWidget {
  const ReelsViewer({
    required this.reelsList,
    this.showVerifiedTick,
    this.onShare,
    this.onLike,
    this.onTap,
    this.onIndexChanged,
    this.onClickMoreBtn,
    this.onFollow,
    this.appbarTitle,
    this.showAppbar,
    this.onClickBackArrow,
    required this.controller,
    super.key,
  });

  /// use reel model and provide list of reels, list contains reels object, object contains url and other parameters
  final List<EventModel> reelsList;

  /// use to show/hide verified tick, by default true
  final bool? showVerifiedTick;

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
  final bool? showAppbar;

  /// function invoke when user click on back btn
  final void Function()? onClickBackArrow;
  final PreloadPageController controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReelsViewerState();
}

class _ReelsViewerState extends ConsumerState<ReelsViewer> {
  List<int> openIndexes = [];
  int currentIndex = 0;
  bool hasOpen = false,
      showBuble = true,
      _isInnerScrollable = true,
      showMore = false,
      loadedMore = false;
  @override
  Widget build(BuildContext context) {
    final model = ref.watch(homeViewModelProvider);
    final viewModel = ref.read(homeViewModelProvider.notifier);

    final refreshController = RefreshController();
    final index = model.forYouIndex;
    final userType = ref.watch(userTypeStateNotifierProvider);
    return Stack(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .1,
              ),
              child: widget.reelsList[currentIndex].participantsLimit == null
                  ? mainView(refreshController, viewModel)
                  : LiquidSwipe(
                      onPageChange: (page) {
                        if (hasOpen != ((page ?? 0) >= 0.01)) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() {
                              hasOpen = (page ?? 0) >= 0.01;
                            });
                          });
                        }
                      },
                      children: [
                        mainView(refreshController, viewModel),
                        ReelsGroupView(
                          item: widget.reelsList[currentIndex],
                          showAll: !hasOpen,
                        ),
                      ],
                    ),
            ),
            if (showMore)
              GestureDetector(
                onTapDown: (e) {
                  setState(() {
                    showMore = false;
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent,
                ),
              )
          ],
        ),
        if ((widget.showAppbar ?? true) &&
            widget.reelsList.isNotEmpty &&
            widget.reelsList.length > index &&
            !hasOpen)
          /*   _index != 0 && _index & 5 == 0
              ? const SizedBox.shrink()
              :  */
          Positioned(
            bottom: 0,
            child: userType == UserType.user
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ReelsBottomButton(
                      model: widget.reelsList[currentIndex],
                      showMore: showMore,
                      onShowMore: (val) {
                        setState(() {
                          showMore = val;
                        });
                      },
                    ),
                  )
                : const GuestEventButton(),
          ),
      ],
    );
  }

  Widget mainView(
    RefreshController refreshController,
    HomeViewModel viewModel,
  ) {
    return CustomRefresher(
      controller: refreshController,
      onRefresh: () {
        viewModel.fetchEvents();
        setState(() {
          _isInnerScrollable = true;
          loadedMore = true;
        });
      },
      onLoading: () {
        widget.controller.animateToPage(
          1,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      },
      enablePullUp: true,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (!loadedMore) {
            if (notification is ScrollUpdateNotification) {
              // Eğer iç scrollable en üstte ve yukarı kaydırma yapılıyorsa
              if (widget.controller.position.pixels <= 0 &&
                  notification.metrics.pixels < 0) {
                setState(() {
                  _isInnerScrollable = false;
                });
              }
              // Eğer iç scrollable en alttaysa ve aşağı kaydırma yapılıyorsa
              else if (widget.controller.position.pixels >=
                      widget.controller.position.maxScrollExtent &&
                  notification.metrics.pixels > 0) {
                setState(() {
                  _isInnerScrollable = false;
                });
              } else {
                setState(() {
                  _isInnerScrollable = true;
                });
              }
            }
          }
          return false;
        },
        child: PreloadPageView.builder(
          physics: _isInnerScrollable
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          preloadPagesCount: 3,
          //loop: false,
          itemBuilder: (BuildContext context, int index) {
            return /* _index != 0 && _index & 5 == 0
                              ? QuizView(
                                  item: widget.reelsList[index - 1],
                                  controller: controller,
                                )
                              : */
                reelsMain(
              index,
              context,
              viewModel,
            );
          },
          controller: widget.controller,
          itemCount: widget.reelsList.length,
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
              showMore = false;
            });
          },
        ),
      ),
    );
  }

  SizedBox reelsMain(int index, BuildContext context, HomeViewModel model) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ReelsPage(
        item: widget.reelsList[index],
        onClickMoreBtn: widget.onClickMoreBtn,
        onFollow: widget.onFollow,
        onLike: widget.onLike,
        onTap: widget.onTap,
        onShare: widget.onShare,
      ),
    );
  }
}
