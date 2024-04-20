// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/custom_stack_image.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/features/component/custom_divider.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';
import 'package:togodo/ui/profile/view_model/user_search_view_model.dart';

@RoutePage()
class FriendsSearchPage extends StatefulHookConsumerWidget {
  const FriendsSearchPage({
    this.userId,
    super.key,
    this.isRoute = false,
  });
  final bool isRoute; // false = Chat, true = User Profile
  final String? userId;
  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _FriendsSearchPageState();
}

class _FriendsSearchPageState extends ConsumerState<FriendsSearchPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _keywordController = TextEditingController();
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _keywordController.addListener(_onKeywordChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(
            profilViewModelProvider(widget.userId).notifier,
          )
          .fetchFriendsRequest();
    });
  }

  void _onKeywordChanged() {
    if (_keywordController.text.isNotEmpty) {
      setState(() {});
    }
  }

  void clearTextField() {
    _keywordController.clear();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();
    final state = ref.watch(profilViewModelProvider(widget.userId));
    return Scaffold(
      backgroundColor: theme.appColors.background,
      appBar: CustomAppBar(
        title: l10n.friends,
      ),
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  if (state.requestModel != null &&
                      state.requestModel!.isNotEmpty &&
                      widget.userId == null)
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: stackedWidget(router, context, state, l10n, theme),
                    ),
                  if (widget.userId == null)
                    const CustomDivider(
                      height: 24,
                    ),
                  TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: l10n.friends,
                      ),
                      Tab(
                        text: l10n.followed,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextField(
                      label: l10n.search,
                      controller: _keywordController,
                      prefixIcon: Assets.icons.light.search.path,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                usersContent(
                  router,
                  theme,
                ),
              ],
            ),
            ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextField(
                      label: l10n.search,
                      controller: _keywordController,
                      prefixIcon: Assets.icons.light.search.path,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                usersContent(
                  router,
                  theme,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InkWell stackedWidget(
    StackRouter router,
    BuildContext context,
    ProfilState state,
    L10n l10n,
    AppTheme theme,
  ) {
    return InkWell(
      onTap: () {
        router.push(
          FriendsRequestRoute(
            userId: widget.userId,
          ),
        );
      },
      child: Row(
        children: [
          StackedWidgets(
            size: context.isMediumScrn ? 32 : 28,
            direction: TextDirection.rtl,
            xShift: 18,
            joinedUsers: state.requestModel!.map((e) => e.imageUrl!).toList(),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                l10n.friendRequests,
                style: theme.textTheme.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              PrimaryText(
                getFriendsRequestText(state.requestModel!, 2),
                style: theme.textTheme.bodySmall.copyWith(),
              ),
            ],
          ),
          const Spacer(),
          Assets.icons.bold.addRight.svg(
            width: 24,
            height: 24,
            color: MainColors.grey600,
          ),
        ],
      ),
    );
  }

  String getFriendsRequestText(
    List<UserSearchModel> requests,
    int maxNamesToShow,
  ) {
    // İstek sayısı maxNamesToShow'dan fazla ise,
    // ilk birkaç ismi al ve geri kalan sayıyı ekle
    if (requests.length > maxNamesToShow) {
      final names = requests.take(maxNamesToShow).map((e) => e.name).join(', ');
      final remainingCount = requests.length - maxNamesToShow;
      return '$names +$remainingCount';
    } else {
      // İstek sayısı maxNamesToShow'dan az veya eşit ise,
      // tüm isimleri birleştir ve döndür
      return requests.map((e) => e.name).join(', ');
    }
  }

  Widget usersContent(
    StackRouter router,
    AppTheme theme,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        final userSearchFuture = _tabController.index == 0
            ? ref.watch(
                userSearchProvider(
                  UserSearchParam(
                    keyword: _keywordController.text,
                    userId: widget.userId,
                  ),
                ),
              )
            : ref.watch(
                userFollowedSearchProvider(
                  UserSearchParam(
                    keyword: _keywordController.text,
                    userId: widget.userId,
                  ),
                ),
              );

        return userSearchFuture.when(
          data: (users) {
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
          },
          loading: Loading.new,
          error: (error, stack) => Text('Error: $error'),
        );
      },
    );
  }
}

class UserInfoWidget extends HookConsumerWidget {
  const UserInfoWidget({
    required this.user,
    super.key,
    this.isRoute = true,
  });

  final UserSearchModel user;
  final bool isRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    return GestureDetector(
      onTap: isRoute
          ? () {
              router.push(
                UserProfileRoute(
                  userId: user.id!,
                ),
              );
            }
          : null,
      child: Row(
        children: [
          CustomAvatarImage(
            imageUrl: user.imageUrl,
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                user.name ?? '', // Replace with actual user's username
                style: theme.textTheme.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              PrimaryText(
                user.title ?? '', // Replace with actual user's username
                style: theme.textTheme.bodySmall.copyWith(
                  fontWeight: FontWeight.w500,
                  color: MainColors.grey600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
