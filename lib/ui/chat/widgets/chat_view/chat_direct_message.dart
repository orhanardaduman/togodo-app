import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/custom_event_card.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/data/model/event/event_model.dart';

class ChatDirectMessageContent extends HookConsumerWidget {
  const ChatDirectMessageContent({
    required this.data,
    super.key,
  });
  final EventCommonProperties data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();

    return GestureDetector(
      onTap: () {
        router.push(EventDetailsRoute(eventId: data.id!));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        child: EnventCards(
          size: EventCardSize.large,
          data: data,
        ),
      ),
    );
  }
}
