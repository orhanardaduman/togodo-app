import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/custom_refresher.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/notification/notification_view_model.dart';
import 'package:togodo/ui/notification/view/event_request_view.dart';
import 'package:togodo/ui/notification/view/notification_view.dart';

@RoutePage()
class NotificationPage extends StatefulHookConsumerWidget {
  const NotificationPage({super.key, this.isNotification = false});
  final bool isNotification;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  final RefreshController _refreshController = RefreshController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notificationViewModelProvider.notifier).fetchNotification();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final theme = ref.watch(appThemeProvider);
    final notifier = ref.read(notificationViewModelProvider.notifier);
    final model = ref.watch(notificationViewModelProvider);
    final l10n = useL10n();
    final notData = model.events
        .where(
          (element) =>
              element.type != 'EventRequestToFriend' &&
              element.type != 'EventRequestToEventOwner' &&
              element.type != 'EventRequestToEventOwnerWithFriend',
        )
        .toList();
    final requestData = model.events
        .where(
          (element) =>
              element.type == 'EventRequestToFriend' ||
              element.type == 'EventRequestToEventOwner' ||
              element.type == 'EventRequestToEventOwnerWithFriend',
        )
        .toList();
    final loading = ref.watch(
      notificationViewModelProvider.select((value) {
        return value.loading;
      }),
    );
    return PopScope(
      canPop: !widget.isNotification,
      onPopInvoked: (pop) async {
        await router.push(
          const HomeRoute(),
        );
      },
      child: Scaffold(
        appBar: CustomAppBar(title: l10n.notifications),
        body: loading
            ? const Loading()
            : CustomRefresher(
                controller: _refreshController,
                onRefresh: () async => notifier.fetchNotification(),
                onLoading: () async => notifier.fetchMoreNotification(),
                enablePullUp: true,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: requestData.isEmpty && notData.isEmpty
                      ? emptyContainer(theme, l10n)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NotificationEventRequestView(
                              requestData: requestData,
                              isNotNullOrEmpty: notData.ext.isNotNullOrEmpty,
                            ),
                            if (notData.ext.isNotNullOrEmpty)
                              NotificationItemView(
                                isNotNullOrEmpty:
                                    requestData.ext.isNotNullOrEmpty,
                                notData: notData,
                              ),
                          ],
                        ),
                ),
              ),
      ),
    );
  }

  Column emptyContainer(AppTheme theme, L10n l10n) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 124,
        ),
        Assets.images.dark.notificationDark.svg(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 24,
          ),
          child: Column(
            children: [
              PrimaryText(
                l10n.noNotificationInfo,
                style: theme.textTheme.h4.copyWith(
                  color: MainColors.primary,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              PrimaryText(
                l10n.noNotificationInfoSub,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 180,
        ),
      ],
    );
  }
}
