import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/input/custom_text_field.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/profile/view/friends_search_page.dart';
import 'package:togodo/ui/profile/view_model/user_search_view_model.dart';

@RoutePage()
class SearchScreenPage extends StatefulHookConsumerWidget {
  const SearchScreenPage({super.key, this.isRoute = false});
  final bool isRoute; // false = Chat, true = User Profile
  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _SearchScreenPageState();
}

class _SearchScreenPageState extends ConsumerState<SearchScreenPage> {
  final TextEditingController _keywordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _keywordController.addListener(_onKeywordChanged);
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
    _keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();

    return Scaffold(
      backgroundColor: theme.appColors.background,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.sendMessage,
      ),
      body: ListView(
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
          usersContent(router, theme, l10n),
        ],
      ),
    );
  }

  Widget usersContent(StackRouter router, AppTheme theme, L10n l10n) {
    return Consumer(
      builder: (context, ref, child) {
        final userSearchFuture = ref.watch(
          userSearchProvider(
            UserSearchParam(
              keyword: _keywordController.text,
            ),
          ),
        );

        return userSearchFuture.when(
          data: (users) {
            return users != null && users.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryText(
                        l10n.suggestions,
                        style: theme.textTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ListView.separated(
                        itemCount: users.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return InkWell(
                            onTap: () {
                              if (widget.isRoute) {
                              } else {
                                router.push(
                                  ChatRoute(
                                    userId: user.id!,
                                    name: user.name!,
                                    imageUrl: user.imageUrl!,
                                    isOnline: false,
                                  ),
                                );
                              }
                            },
                            child: UserInfoWidget(user: user, isRoute: false),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 32);
                        },
                      ),
                    ],
                  )
                : const SizedBox.shrink();
          },
          loading: () => const SizedBox.shrink(),
          error: (error, stack) => Text('Error: $error'),
        );
      },
    );
  }
}

class CustomBorderedButton extends StatelessWidget {
  const CustomBorderedButton({
    required this.icon,
    required this.theme,
    super.key,
    this.onPressed,
    this.radius = 22.0,
  });

  final double radius;
  final IconData icon;
  final VoidCallback? onPressed;
  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: theme.appColors.background,
      child: IconButton(
        alignment: Alignment.center,
        splashRadius: radius,
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: theme.appColors.text,
          size: radius + 3,
        ),
      ),
    );
  }
}
