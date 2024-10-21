// ignore_for_file: prefer_null_aware_method_calls

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/features/component/featured_image.dart';
import 'package:togodo/ui/home/reels/group_view/has_group_view.dart';
import 'package:togodo/ui/home/reels/group_view/search_loading_view.dart';
import 'package:togodo/ui/home/reels/group_view/search_view.dart';

import '../components/custom_paint.dart';
import 'first_view.dart';

class ReelsGroupView extends HookConsumerWidget {
  const ReelsGroupView({
    required this.item,
    required this.showAll,
    super.key,
  });
  final EventModel item;
  final bool showAll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FeaturedImageWidget(
          aspectRatio: item.aspectRatio ?? '',
          imageUrl: item.imageUrl ?? '',
          resolution: item.resolution ?? '1200x800',
          isTimeline: true,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color.fromRGBO(25, 40, 43, .5),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CustomPaint(
            painter: DropShapePainter(),
          ),
        ),
        const Positioned(
          left: 7,
          top: 0,
          bottom: 0,
          child: Icon(
            Icons.keyboard_arrow_left,
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: showAll
              ? const SizedBox.shrink()
              : item.eventGroups != null
                  ? HasGroupView(item: item)
                  : item.groupRequest != null
                      ? GroupSearchView(
                          item: item,
                        )
                      : item.searching == true
                          ? GroupSearchLoadingView(
                              item: item,
                            )
                          : ReelsGroupFirstView(
                              item: item,
                            ),
        ),
      ],
    );
  }
}
