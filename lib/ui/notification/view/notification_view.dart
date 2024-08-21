import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';
import 'package:togodo/ui/settings/language_settings.dart';

class NotificationItemView extends HookConsumerWidget {
  const NotificationItemView({
    required this.notData,
    required this.isNotNullOrEmpty,
    super.key,
  });
  final List<NotificationModel> notData;
  final bool isNotNullOrEmpty;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final notifier = ref.watch(notificationViewModelProvider.notifier);

    final language = ref.watch(languageProvider);

    return ListView.separated(
      itemCount: notData.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var isSameDate = true;
        final dateString = notData[index].createdAt;
        final date = DateTime.parse(dateString!);
        final item = notData[index];
        if (index == 0) {
          isSameDate = false;
        } else {
          final prevDateString = notData[index - 1].createdAt;
          final prevDate = DateTime.parse(prevDateString!);
          isSameDate = date.isSameDate(prevDate);
        }
        if (index == 0 || !isSameDate) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                date.getRelativeDate(language),
                style: theme.textTheme.bodyXLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              body(
                router,
                item,
                theme,
                l10n,
                notifier,
                context,
                language,
                ref,
              ),
            ],
          );
        } else {
          return body(
            router,
            item,
            theme,
            l10n,
            notifier,
            context,
            language,
            ref,
          );
        }
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
    );
  }

  Container body(
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
          Row(
            children: [
              InkWell(
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
                child: CustomAvatarImage(
                  imageUrl: user.imageUrl,
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  if (data.event != null && data.event!.id != null) {
                    router.push(
                      EventDetailsRoute(
                        eventId: data.event!.id!,
                      ),
                    );
                  } else if (data.user != null && data.user!.id != null) {
                    final userModel =
                        ref.watch(userViewModelProvider).tokenModel;
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
                  }
                },
                child: SizedBox(
                  width: context.dyWidth(200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          PrimaryText(
                            user.name ??
                                '', // Replace with actual user's username
                            style: theme.textTheme.bodyLarge.copyWith(
                              fontWeight: FontWeight.w700,
                              color: theme.appColors.text,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      if (data.type == 'EventRemoved' ||
                          data.type == 'EventUpdateTimeToUser' ||
                          data.type == 'EventUpdateDateToUser' ||
                          data.type == 'EventUpdateNameToUser' ||
                          data.type == 'EventLike' ||
                          data.type == 'NewEvent' ||
                          data.type == 'EventComment' ||
                          data.type == 'EventCommentLike' ||
                          data.type == 'EventUpdateLocationToUser')
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: ' ${data.event?.name} ',
                                style: theme.textTheme.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: theme.appColors.themeColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              TextSpan(
                                text: data.type!.notificationMessage(
                                  l10n,
                                ),
                                style: theme.textTheme.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: theme.appColors.text,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        )
                      else if (data.type == 'EventRequestAcceptByEventOwner' ||
                          data.type == 'EventRequestAcceptByFriend' ||
                          data.type == 'EventRequestAcceptByFriendForFriend')
                        RichText(
                          text: TextSpan(
                            children: [
                              if (data.type == 'EventRequestAcceptByEventOwner')
                                TextSpan(
                                  text: '${data.user!.name},',
                                  style: theme.textTheme.bodySmall.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: theme.appColors.text,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              TextSpan(
                                text: '${data.event!.name} ',
                                style: theme.textTheme.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: theme.appColors.themeColor,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              TextSpan(
                                text: data.type!.notificationMessage(
                                  l10n,
                                ),
                                style: theme.textTheme.bodySmall.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: theme.appColors.text,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        )
                      else if (data.type != 'FriendRequest')
                        PrimaryText(
                          '${(data.type != 'EventRate') ? "${data.user?.name} " : ""}${data.type != null ? data.type?.notificationMessage(
                              l10n,
                            ) : l10n.deletedEvent}', // Replace with actual user's username
                          maxLines: 3,
                          style: theme.textTheme.bodySmall.copyWith(
                            fontWeight: FontWeight.w500,
                            color: theme.appColors.text,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      else
                        PrimaryText(
                          '${data.user?.name} ${data.type != null ? data.type?.notificationMessage(
                              l10n,
                            ) : l10n.deletedEvent}', // Replace with actual user's username
                          maxLines: 3,
                          style: theme.textTheme.bodySmall.copyWith(
                            fontWeight: FontWeight.w500,
                            color: theme.appColors.text,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
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
                  if (data.type == 'FriendRequest' && data.request == null)
                    Column(
                      children: <Widget>[
                        SizedBox(
                          width: context.dyWidth(81),
                          height: context.dyHeight(32),
                          child: CustomButton(
                            text: l10n.accept,
                            radius: 100,
                            onPressed: () {
                              ref
                                  .read(
                                    profilViewModelProvider(null).notifier,
                                  )
                                  .acceptRequest(data.user!.id!)
                                  .then(
                                    (value) => notifier.incrementRequestUpdatte(
                                      data.id!,
                                    ),
                                  );
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
                                : MainColors.grey300,
                            radius: 100,
                            style: theme.textTheme.bodyMedium.copyWith(
                              fontWeight: FontWeight.w500,
                              color: MainColors.grey500,
                            ),
                            mode: ButtonMode.dark,
                            onPressed: () {
                              ref
                                  .read(
                                    profilViewModelProvider(null).notifier,
                                  )
                                  .declineRequest(data.user!.id!)
                                  .then(
                                    (value) => notifier.incrementRemoveData(
                                      data.id!,
                                    ),
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
