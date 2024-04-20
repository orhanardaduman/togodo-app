import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/time_ago_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_request_model.dart';
import 'package:togodo/ui/home/view_model/event_request_view_model.dart';
import 'package:togodo/ui/settings/language_settings.dart';

@RoutePage()
class EventRequestPage extends HookConsumerWidget {
  const EventRequestPage({
    required this.eventId,
    super.key,
  });
  final String eventId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final notifier = ref.watch(eventRequestViewModelProvider(eventId).notifier);
    final language = ref.watch(languageProvider);
    final users = ref.watch(
      eventRequestViewModelProvider(eventId).select((value) {
        return value.events;
      }),
    );
    final loading = ref.watch(
      eventRequestViewModelProvider(eventId).select((value) {
        return value.loading;
      }),
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.eventRequests,
      ),
      body: loading
          ? const Loading()
          : ListView.builder(
              itemCount: users.length,
              padding: const EdgeInsets.all(24),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var isSameDate = true;
                final dateString = users[index].date!;
                final date = DateTime.parse(dateString);
                final item = users[index];
                if (index == 0) {
                  isSameDate = false;
                } else {
                  final prevDateString = users[index - 1].date;
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
                      const SizedBox(height: 16),
                      body(router, item, theme, l10n, notifier, context),
                      const SizedBox(height: 16),
                    ],
                  );
                } else {
                  return body(router, item, theme, l10n, notifier, context);
                }
              },
            ),
    );
  }

  Container body(
    StackRouter router,
    EventRequestModel user,
    AppTheme theme,
    L10n l10n,
    EventRequestViewModel notifier,
    BuildContext context,
  ) {
    final bgColor =
        theme.mode == ThemeMode.light ? MainColors.grey100 : MainColors.dark2;
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  router.push(
                    UserProfileRoute(
                      userId: user.userId!,
                    ),
                  );
                },
                child: Row(
                  children: [
                    CustomAvatarImage(
                      imageUrl: user.imageUrl,
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 133,
                      child: PrimaryText(
                        user.name ?? '', // Replace with actual user's username
                        style: theme.textTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.appColors.text,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (user.friend != null)
                const SizedBox(
                  height: 8,
                ),
              if (user.friend != null)
                GestureDetector(
                  onTap: () {
                    router.push(
                      UserProfileRoute(
                        userId: user.friend!.userId!,
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      CustomAvatarImage(
                        imageUrl: user.friend!.imageUrl,
                      ),
                      const SizedBox(width: 8),
                      PrimaryText(
                        user.friend!.name ??
                            '', // Replace with actual user's username
                        style: theme.textTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 110,
            height: 38,
            child: user.requestStatus ?? false
                ? CustomButton(
                    text: l10n.acceptCheck,
                    bgColor: bgColor,
                    style: theme.textTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w500,
                      color: MainColors.primary,
                    ),
                    radius: 100,
                    side: const BorderSide(
                      color: MainColors.primary,
                      width: 2,
                    ),
                    onPressed: () {
                      notifier.acceptRequest(user.requestId!).then((value) {
                        if (value) {
                          showToast(context, 'Başarılı');
                        } else {
                          showToast(
                            context,
                            'Hata oluştu. Lütfen tekrar deneyin.',
                            type: AlertType.error,
                          );
                        }
                      });
                    },
                  )
                : CustomButton(
                    text: l10n.accept,
                    radius: 100,
                    style: theme.textTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w500,
                      color: MainColors.white,
                    ),
                    onPressed: () {
                      notifier.acceptRequest(user.requestId!).then((value) {
                        if (value) {
                          showToast(context, 'Başarılı');
                        } else {
                          showToast(
                            context,
                            'Hata oluştu. Lütfen tekrar deneyin.',
                            type: AlertType.error,
                          );
                        }
                      });
                    },
                  ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
