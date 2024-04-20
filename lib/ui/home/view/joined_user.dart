// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/custom_refresher.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_friend_invite_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/home/view_model/event_joined_view_model.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

@RoutePage()
class EventJoinedUserPage extends StatefulHookConsumerWidget {
  const EventJoinedUserPage({
    required this.eventId,
    this.isManagement = true,
    super.key,
  });
  final String eventId;
  final bool isManagement; // Eğer yönetici ise ayarlar iconu gözükmesi için

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EventJoinedUserPageState();
}

class _EventJoinedUserPageState extends ConsumerState<EventJoinedUserPage> {
  final _refreshController = RefreshController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(eventJoinedViewModelProvider(widget.eventId).notifier)
          .fetchJoined();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final notifier =
        ref.watch(eventJoinedViewModelProvider(widget.eventId).notifier);
    final userType =
        ref.watch(userViewModelProvider.notifier).tokenModel?.token?.userType ??
            0;
    final users = ref.watch(
      eventJoinedViewModelProvider(widget.eventId).select((value) {
        return value.events;
      }),
    );
    final loading = ref.watch(
      eventJoinedViewModelProvider(widget.eventId).select((value) {
        return value.loading;
      }),
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.joinedUsers,
      ),
      body: loading
          ? const Loading()
          : CustomRefresher(
              controller: _refreshController,
              onRefresh: () async => notifier.fetchJoined(),
              onLoading: () async => notifier.fetchRequesyMore(),
              enablePullUp: true,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 17.5),
                    PrimaryText(
                      l10n.joinedInfo(users.length),
                      style: theme.textTheme.bodyXLarge.copyWith(
                        color: theme.appColors.text,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 17.5),
                    ListView.builder(
                      itemCount: users.length,
                      padding: const EdgeInsets.only(bottom: 32),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return body(
                          router,
                          users[index],
                          theme,
                          l10n,
                          notifier,
                          context,
                          ref,
                          userType,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Padding body(
    StackRouter router,
    EventFriendInviteModel user,
    AppTheme theme,
    L10n l10n,
    EventJoinedViewModel notifier,
    BuildContext context,
    WidgetRef ref,
    int userType,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {
          user.isCurrentUser!
              ? router.pushAndPopUntil(
                  ProfileRoute(),
                  predicate: (route) =>
                      route.settings.name == ProfileRoute.name,
                )
              : router.push(
                  UserProfileRoute(
                    userId: user.id!,
                  ),
                );
        },
        leading: CustomAvatarImage(
          imageUrl: user.imageUrl,
        ),
        title: PrimaryText(
          user.name ?? '',
          style: theme.textTheme.bodyLarge.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.appColors.text,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: userType != 0 || user.type != 0
            ? SizedBox.fromSize()
            : widget.isManagement
                ? IconButton(
                    onPressed: () {},
                    icon: Assets.icons.bold.additionalIcons.svg(
                      color: theme.appColors.text,
                    ),
                  )
                : user.isCurrentUser! || user.isFriend!
                    ? null
                    : (user.isFriendRequest ?? false
                        ? IconButton(
                            onPressed: () {
                              ref
                                  .read(
                                    profilViewModelProvider(user.id).notifier,
                                  )
                                  .removeRequest()
                                  .then(
                                    (value) => notifier
                                        .incrementRequestFriends(user.id!),
                                  );
                            },
                            icon: Assets.icons.bold.addUser.svg(
                              color: MainColors.primary,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              ref
                                  .read(
                                    profilViewModelProvider(user.id).notifier,
                                  )
                                  .addRequest()
                                  .then(
                                    (value) => notifier
                                        .incrementRequestFriends(user.id!),
                                  );
                            },
                            icon: Assets.icons.light.addUser.svg(
                              color: theme.appColors.text,
                            ),
                          )),
      ),
    );
  }
}
