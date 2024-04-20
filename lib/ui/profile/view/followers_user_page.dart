// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/custom_refresher.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/ui/profile/view/friends_search_page.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

@RoutePage()
class FollowersUserSearchPage extends StatefulHookConsumerWidget {
  const FollowersUserSearchPage({
    required this.userId,
    super.key,
    this.isRoute = false,
  });
  final bool isRoute; // false = Chat, true = User Profile
  final String userId;
  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _FollowersUserSearchPageState();
}

class _FollowersUserSearchPageState
    extends ConsumerState<FollowersUserSearchPage> {
  final RefreshController _refreshController = RefreshController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(
            profilViewModelProvider(widget.userId).notifier,
          )
          .fetchUserFollowersUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();
    final state = ref.watch(profilViewModelProvider(widget.userId));
    final notifier = ref.read(profilViewModelProvider(widget.userId).notifier);
    return Scaffold(
      backgroundColor: theme.appColors.background,
      appBar: CustomAppBar(
        title: l10n.followers(''),
      ),
      body: CustomRefresher(
        controller: _refreshController,
        onRefresh: () async => notifier.fetchUserFollowersUsers(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: usersContent(router, theme, state.requestModel),
        ),
      ),
    );
  }

  Widget usersContent(
    StackRouter router,
    AppTheme theme,
    List<UserSearchModel>? users,
  ) {
    return users != null && users.isNotEmpty
        ? ListView.separated(
            itemCount: users.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 24),
            itemBuilder: (context, index) {
              final user = users[index];
              return UserInfoWidget(user: user);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 24,
              );
            },
          )
        : const SizedBox.shrink();
  }
}
