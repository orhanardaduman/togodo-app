// ignore_for_file: prefer_null_aware_method_calls

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/features/component/featured_image.dart';
import 'package:togodo/ui/home/reels/components/screen_options.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({
    required this.item,
    required this.swiperController,
    super.key,
    this.onClickMoreBtn,
    this.onFollow,
    this.onLike,
    this.onTap,
    this.onShare,
  });
  final EventModel item;
  final void Function(EventCommonProperties)? onShare;
  final void Function(String)? onLike;
  final void Function(String)? onTap;
  final void Function()? onClickMoreBtn;
  final void Function()? onFollow;
  final SwiperController swiperController;

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
      ],
    );
  }
}
