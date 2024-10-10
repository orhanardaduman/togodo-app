import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/event/event_details_model.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/ui/profile/user_groups/bloc/user_groups_bloc.dart';

import '../../../core/component/primary_text.dart';
import '../../../core/helpers/colors/colors.dart';
import '../../../core/hook/use_l10n.dart';
import '../../../core/hook/use_router.dart';
import '../../../core/route/app_route.gr.dart';
import '../../../core/theme/app_theme.dart';
import '../../home/reels/group_view/search_view.dart';
import '../../home/widget/event_info.dart';
import '../../profile/user_groups/bloc/user_groups_events.dart';

class EmptyGroupView extends HookConsumerWidget {
  const EmptyGroupView({super.key, this.eventModel});
  final EventDetailsModel? eventModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();

    return SingleChildScrollView(
      child: Column(
        children: [
          GroupSearchView(
            onCancel: () {
              Navigator.of(context).pop();
              context.read<UserGroupsBloc>().add(GetUserGroups(''));
            },
            hideEventName: true,
            item: EventModel(
              id: eventModel?.id,
              name: eventModel?.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: EventInfo(
              name: eventModel?.name ?? '',
              date: eventModel?.date ?? '',
              location:
                  (eventModel?.onlineUrl == '' || eventModel?.onlineUrl == null)
                      ? eventModel?.location ?? ''
                      : eventModel?.onlineUrl ?? '',
              starTime: '${eventModel?.startTime}',
              endTime: eventModel?.endTime,
              description: eventModel?.description ?? '',
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  router.push(
                    EventDetailsRoute(eventId: eventModel?.id ?? ''),
                  );
                },
                child: PrimaryText(
                  l10n.goToEventDetail,
                  style: theme.textTheme.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    color: MainColors.primary,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: PrimaryText(
                l10n.chat,
                style: theme.textTheme.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          PrimaryText(
            l10n.canStartChatWhenReady,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge.copyWith(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
