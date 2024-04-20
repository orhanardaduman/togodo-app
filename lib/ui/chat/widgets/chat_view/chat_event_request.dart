// ignore_for_file: use_named_constants

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_event_card.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/date_time.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/features/component/custom_divider.dart';
import 'package:togodo/features/component/featured_image.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/chat/model/post_files.dart';
import 'package:togodo/ui/chat/model/post_info_model.dart';
import 'package:togodo/ui/notification/notification_view_model.dart';
import 'package:togodo/ui/settings/language_settings.dart';

class ChatEventRequestContent extends HookConsumerWidget {
  const ChatEventRequestContent({
    required this.fullName,
    required this.eventInfo,
    required this.userId,
    required this.inviteId,
    required this.isCurrentUser,
    this.inviteStatus,
    super.key,
    this.imageUrl,
  });
  final List<PostFiles>? imageUrl;
  final String fullName;
  final PostInfo eventInfo;
  final String userId;
  final String inviteId;
  final bool isCurrentUser;
  final bool? inviteStatus;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final language = ref.watch(languageProvider);
    final router = useRouter();
    return GestureDetector(
      onTap: () {
        router.push(EventDetailsRoute(eventId: eventInfo.eventId!));
      },
      child: inviteStatus != null
          ? Column(
              children: [
                EnventCards(
                  size: EventCardSize.large,
                  data: EventModel(
                    id: eventInfo.eventId,
                    name: eventInfo.eventName,
                    date: eventInfo.eventDate,
                    location: eventInfo.eventLocation,
                    description: eventInfo.eventContent,
                    imageUrl: eventInfo.eventImageUrl,
                    vendorDetails: VendorDetails(
                      name: eventInfo.userFullName,
                      imageUrl: eventInfo.userImageUrl,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: PrimaryText(
                    isCurrentUser
                        ? (inviteStatus!
                            ? l10n.acceptedEventInvitation
                            : l10n.declinedEventInvitation)
                        : inviteStatus!
                            ? l10n.youAcceptedEventInvitation
                            : l10n.youDeclinedEventInvitation,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyXLarge.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.appColors.text,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                const CustomDivider(),
                const SizedBox(height: 13),
                SizedBox(
                  width: 300,
                  height: 458,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      FeaturedImageWidget(
                        imageUrl: eventInfo.eventImageUrl ?? '',
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: onTextColumn(
                          theme,
                          18,
                          14,
                          20,
                          context,
                          eventInfo,
                          language,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: PrimaryText(
                    isCurrentUser
                        ? l10n.inviteForActivityTogether
                        : l10n.youAreInvitedForActivity(fullName),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyXLarge.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.appColors.text,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (!isCurrentUser && inviteStatus == null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: context.dyWidth(81),
                        height: context.dyHeight(32),
                        child: CustomButton(
                          text: l10n.reject,
                          bgColor: MainColors.dark3,
                          radius: 100,
                          style: theme.textTheme.bodyMedium.copyWith(
                            fontWeight: FontWeight.w500,
                            color: MainColors.grey500,
                          ),
                          mode: ButtonMode.dark,
                          onPressed: () {
                            ref
                                .read(notificationViewModelProvider.notifier)
                                .declineInvite(inviteId, userId);
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: context.dyWidth(81),
                        height: context.dyHeight(32),
                        child: CustomButton(
                          text: l10n.accept,
                          radius: 100,
                          onPressed: () {
                            ref
                                .read(notificationViewModelProvider.notifier)
                                .acceptInvite(inviteId, userId);
                          },
                        ),
                      ),
                    ],
                  ),
              ],
            ),
    );
  }

  Column onTextColumn(
    AppTheme theme,
    double dateSize,
    double subFontSize,
    double titleFontSize,
    BuildContext context,
    PostInfo data,
    String language,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (data.eventDate != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PrimaryText(
                      data.eventDate!.getFormattedDate(language),
                      style: theme.textTheme.bodyXLarge.copyWith(
                        color: MainColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: dateSize,
                      ),
                    ),
                    PrimaryText(
                      data.eventDate!.getFormattedDay(language),
                      style: theme.textTheme.bodyMedium.copyWith(
                        color: MainColors.white,
                        fontSize: subFontSize,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                image: data.userImageUrl != null
                    ? DecorationImage(
                        image: NetworkImage(
                          data.userImageUrl!,
                        ),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: AssetImage(
                          Assets.images.stock.avatar.path,
                        ),
                        fit: BoxFit.cover,
                      ),
                borderRadius: BorderRadius.circular(99.9994888305664),
              ),
            ),
            const SizedBox(width: 8),
            PrimaryText(
              data.userFullName ?? 'Vendor Name',
              style: theme.textTheme.bodyMedium.copyWith(
                color: MainColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ],
        ),
        if (data.eventName != null)
          PrimaryText(
            data.eventName!,
            maxLines: 2,
            style: theme.textTheme.h5.copyWith(
              color: MainColors.white,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
              fontSize: titleFontSize,
            ),
          ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (data.eventLocation != null)
              SizedBox(
                width: 250,
                child: PrimaryText(
                  data.eventLocation!,
                  style: theme.textTheme.bodyMedium.copyWith(
                    color: MainColors.white,
                    fontSize: subFontSize,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  BoxDecoration decoration(double radius) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      gradient: const LinearGradient(
        colors: [
          Color(0xff272727),
          Color(0x00000000),
        ],
        stops: [
          0,
          0.375,
        ],
        begin: Alignment(-0, -1),
        end: Alignment(0, 1),
        // angle: 180,
        // scale: undefined,
      ),
    );
  }
}
