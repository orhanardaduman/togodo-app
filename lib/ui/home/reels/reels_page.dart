// ignore_for_file: prefer_null_aware_method_calls

import 'package:flutter/material.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/features/component/featured_image.dart';
import 'package:togodo/ui/common/index.dart';
import 'package:togodo/ui/home/reels/components/reels_bottom_button.dart';
import 'package:togodo/ui/home/reels/components/screen_options.dart';

import 'components/guest_event_button.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({
    required this.item,
    required this.onShowMore,
    super.key,
    this.onClickMoreBtn,
    this.onFollow,
    this.onLike,
    this.onTap,
    this.onShare,
    this.showButton = false,
    this.isShowMore = false,
    this.userType = UserType.guest,
  });

  final UserType userType;
  final Function(bool val) onShowMore;
  final bool showButton, isShowMore;
  final EventModel item;
  final void Function(EventCommonProperties)? onShare;
  final void Function(String)? onLike;
  final void Function(String)? onTap;
  final void Function()? onClickMoreBtn;
  final void Function()? onFollow;

  @override
  Widget build(BuildContext context) {
    return getView(context);
  }

  Widget getView(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GestureDetector(
          onTap: () {
            onTap!(item.id!);
          },
          onDoubleTap: () {
            if (!(item.likeStatus ?? false)) {
              if (onLike != null) {
                onLike!(item.id!);
              }
            }
          },
          child: FeaturedImageWidget(
            aspectRatio: item.aspectRatio ?? '',
            imageUrl: item.imageUrl ?? '',
            resolution: item.resolution ?? '1200x800',
            isTimeline: true,
          ),
        ),
        ScreenOptions(
          onClickMoreBtn: onClickMoreBtn,
          onFollow: onFollow,
          onLike: onLike,
          onShare: onShare,
          item: item,
        ),
        if (isShowMore)
          GestureDetector(
            onTapDown: (e) {
              onShowMore(false);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
            ),
          ),
        if (showButton)
          if (userType == UserType.user)
            Positioned(
              bottom: 5,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ReelsBottomButton(
                  model: item,
                  showMore: isShowMore,
                  onShowMore: onShowMore,
                  bottom: true,
                ),
              ),
            )
          else
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const GuestEventButton()),
      ],
    );
  }
}
