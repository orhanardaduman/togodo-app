import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/data/model/event/event_details_model.dart';
import 'package:togodo/ui/home/widget/event_ratings.dart';

@RoutePage()
class EventRatingsAllPage extends StatefulHookConsumerWidget {
  const EventRatingsAllPage({
    required this.dragScrollController,
    this.ratingsList,
    super.key,
  });
  final ScrollController dragScrollController;
  final List<Ratings>? ratingsList;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EventRatingsAllPageState();
}

class _EventRatingsAllPageState extends ConsumerState<EventRatingsAllPage> {
  @override
  Widget build(BuildContext context) {
    return CustomModal(
      title: 'Etkinlik Değerlendirme',
      maxHeight: context.sized.dynamicHeight(1.2),
      isCloseDivider: true,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.metrics.pixels <=
              notification.metrics.minScrollExtent) {}
          return true;
        },
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.separated(
            itemCount: widget.ratingsList!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, indexs) {
              final data = widget.ratingsList![indexs];
              return EventRatingsItem(
                ratings: data,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 16);
            },
          ),
        ),
      ),
    );
  }
}
