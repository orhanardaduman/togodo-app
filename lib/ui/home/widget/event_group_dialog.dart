import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/extension/device_size_extension.dart';

import '../../../core/component/button/custom_button.dart';
import '../../../core/component/custom_event_card.dart';
import '../../../core/component/primary_text.dart';
import '../../../core/helpers/colors/colors.dart';
import '../../../core/hook/use_l10n.dart';
import '../../../core/hook/use_router.dart';
import '../../../core/route/app_route.gr.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../../core/theme/app_theme.dart';
import '../../group/model/group_model.dart';
import '../../group/pages/group_page.dart';
import '../../notification_view_model.dart';

class EventGroupDialog extends StatefulHookConsumerWidget {
  const EventGroupDialog({super.key, required this.data});
  final GroupDetailModelForDialog data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EventGroupDialogState();
}

class _EventGroupDialogState extends ConsumerState<EventGroupDialog> {
  int? selectedPoint;
  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();

    return Scaffold(
      backgroundColor: Color(0xfff09101D).withOpacity(.7),
      body: Center(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width * .8,
            padding: const EdgeInsets.all(
              20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                52,
              ),
              color: MainColors.bottomColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EnventCards(
                    data: widget.data.eventModel,
                    isShowVendor: false,
                    height: context.dyHeight(190),
                    size: EventCardSize.custom,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PrimaryText(
                    l10n.yourGroupFriends,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme().bodyXLarge.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: MainColors.primary,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: widget.data.users
                        .map(
                          (e) => GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 50,
                              height: 50,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 2.5,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: MainColors.primary,
                                  width: 2,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    e.aspNetUsers?.imageUrl ?? "",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  PrimaryText(
                    l10n.groupMatchText(widget.data.eventModel.name ?? ''),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme().bodyXLarge.copyWith(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(
                            159,
                            158,
                            158,
                            1,
                          ),
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: l10n.groupDetails,
                    radius: 100,
                    style: theme.textTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    onPressed: () {
                      ref
                          .read(notificationStateProvider.notifier)
                          .neverShowDialog(
                            widget.data.id,
                          );
                      Navigator.pop(context);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (
                            c,
                          ) {
                            return GroupPage(
                              id: widget.data.eventGroupsId ?? '',
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: l10n.eventDetails,
                    bgColor: theme.mode == ThemeMode.dark
                        ? MainColors.dark3
                        : MainColors.grey300,
                    radius: 100,
                    style: theme.textTheme.bodyMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    mode: ButtonMode.dark,
                    onPressed: () {
                      ref
                          .read(notificationStateProvider.notifier)
                          .neverShowDialog(
                            widget.data.id,
                          );
                      Navigator.pop(context);

                      router.push(
                        EventDetailsRoute(
                            eventId: widget.data.eventModel.id ?? ''),
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: PrimaryText(
                      l10n.close,
                      style: AppTextTheme().bodyMedium.copyWith(
                            color: MainColors.primary,
                            fontSize: 16,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
