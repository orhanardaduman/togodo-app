import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/extension/notifications_message.dart';
import 'package:togodo/core/extension/time_ago_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/notification/notification_model.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/notification/notification_view_model.dart';
import 'package:togodo/ui/settings/language_settings.dart';

class NotificationEventRequestView extends HookConsumerWidget {
  const NotificationEventRequestView({
    required this.requestData,
    required this.isNotNullOrEmpty,
    super.key,
  });
  final List<NotificationModel> requestData;
  final bool isNotNullOrEmpty;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final notifier = ref.read(notificationViewModelProvider.notifier);

    final language = ref.watch(languageProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (requestData.ext.isNotNullOrEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: PrimaryText(
              '${l10n.eventRequests} 👋🏼',
              style: theme.textTheme.h5.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        if (requestData.ext.isNotNullOrEmpty)
          ConstrainedBox(
            constraints: isNotNullOrEmpty
                ? BoxConstraints(
                    maxHeight: context.dyHeight(321),
                  )
                : const BoxConstraints(),
            child: ListView.separated(
              itemCount: requestData.length,
              shrinkWrap: true,
              physics: requestData.length > 3
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return bodyRequest(
                  router,
                  requestData[index],
                  theme,
                  l10n,
                  notifier,
                  context,
                  language,
                  ref,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
            ),
          ),
      ],
    );
  }

  Container bodyRequest(
    StackRouter router,
    NotificationModel data,
    AppTheme theme,
    L10n l10n,
    NotificationViewModel notifier,
    BuildContext context,
    String language,
    WidgetRef ref,
  ) {
    final bgColor =
        theme.mode == ThemeMode.light ? MainColors.grey100 : MainColors.dark2;
    final user = data.user!;
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              final userModel = ref.watch(userViewModelProvider).tokenModel;
              if (userModel != null && userModel.userId! == user.id) {
                router.popAndPush(
                  ProfileRoute(),
                );
              } else {
                router.push(
                  UserProfileRoute(
                    userId: user.id!,
                  ),
                );
              }
            },
            child: Row(
              children: [
                Column(
                  children: [
                    userItem(
                      user.imageUrl ?? '',
                      user.name ?? '',
                      false,
                      context,
                      theme,
                      data,
                      router,
                      l10n,
                    ),
                    if (user.friendId != null)
                      const SizedBox(
                        height: 6,
                      ),
                    if (user.friendId != null)
                      userItem(
                        user.friendImageUrl ?? '',
                        user.friendName ?? '',
                        true,
                        context,
                        theme,
                        data,
                        router,
                        l10n,
                      ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: PrimaryText(
                        language == 'tr'
                            ? data.createdAt!.formatCreatedAt()
                            : data.createdAt!.formatCreatedAtEn(),
                        style: theme.textTheme.bodySmall.copyWith(
                          fontWeight: FontWeight.w500,
                          color: MainColors.grey700,
                        ),
                      ),
                    ),
                    if (data.request == null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: context.dyWidth(81),
                            height: context.dyHeight(32),
                            child: CustomButton(
                              text: l10n.accept,
                              radius: 100,
                              onPressed: () {
                                print(data.type);
                                if (data.type == 'EventRequestToFriend') {
                                  notifier
                                      .acceptInvite(
                                    data.requestId!,
                                    data.user!.id!,
                                  )
                                      .then(
                                    (value) {
                                      notifier.incrementRemoveData(
                                        data.id!,
                                      );
                                    },
                                  );
                                } else {
                                  notifier
                                      .acceptRequest(
                                        data.requestId!,
                                        data.user!.id!,
                                      )
                                      .then(
                                        (value) =>
                                            notifier.incrementRequestUpdatte(
                                          data.id!,
                                        ),
                                      );
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: context.dyWidth(81),
                            height: context.dyHeight(32),
                            child: CustomButton(
                              text: l10n.reject,
                              bgColor: theme.mode == ThemeMode.dark
                                  ? MainColors.dark3
                                  : MainColors.primary,
                              radius: 100,
                              style: theme.textTheme.bodyMedium.copyWith(
                                fontWeight: FontWeight.w500,
                                color: MainColors.grey500,
                              ),
                              mode: ButtonMode.dark,
                              onPressed: () {
                                if (data.type == 'EventRequestToFriend') {
                                  notifier
                                      .declineInvite(
                                        data.requestId!,
                                        data.user!.id!,
                                      )
                                      .then(
                                        (value) => notifier.incrementRemoveData(
                                          data.id!,
                                        ),
                                      );
                                } else {
                                  notifier
                                      .declineRequest(
                                        data.requestId!,
                                        data.user!.id!,
                                      )
                                      .then(
                                        (value) => notifier.incrementRemoveData(
                                          data.id!,
                                        ),
                                      );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row userItem(
    String imageUrl,
    String name,
    // ignore: avoid_positional_boolean_parameters
    bool isFriend,
    BuildContext context,
    AppTheme theme,
    NotificationModel data,
    StackRouter router,
    L10n l10n,
  ) {
    return Row(
      children: [
        CustomAvatarImage(
          imageUrl: imageUrl,
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: context.dyWidth(200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  PrimaryText(
                    name,
                    style: theme.textTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.appColors.text,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              if (!isFriend)
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${data.event!.name} ',
                        style: theme.textTheme.bodySmall.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.appColors.themeColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            router.push(
                              EventDetailsRoute(
                                eventId: data.event!.id!,
                              ),
                            );
                          },
                      ),
                      TextSpan(
                        text: data.type!
                            .notificationMessage(
                              l10n,
                            )
                            .trim(),
                        style: theme.textTheme.bodySmall.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.appColors.text,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
