import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/user_search_with_events.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/discover/view_model/discovery_search_view_model.dart';

class SearchUserForAdminView extends StatefulHookConsumerWidget {
  const SearchUserForAdminView({
    super.key,
    required this.onTap,
  });
  final void Function(Users userId) onTap;

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _SearchUserForAdminViewState();
}

class _SearchUserForAdminViewState
    extends ConsumerState<SearchUserForAdminView> {
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
    final notifier = ref.read(discoverySearchViewModelProvider.notifier);
    final model = ref.watch(discoverySearchViewModelProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Stack(
            children: [
              Center(
                child: TextButton(
                  onPressed: () {
                    widget.onTap(
                      Users.fromJson({
                        'id': '-1',
                        'name': l10n.withNoUser,
                      }),
                    );
                  },
                  child: PrimaryText(
                    l10n.withNoUser,
                    style: theme.textTheme.bodySmall.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextField(
                label: l10n.search,
                controller: _keywordController,
                prefixIcon: Assets.icons.light.search.path,
              ),
              if (model.isShowClearFilter)
                TextButton(
                  onPressed: notifier.removeSearchHistory,
                  child: PrimaryText(
                    l10n.clearAll,
                    style: theme.textTheme.bodySmall.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 17.5),
          if (model.isRefresh)
            const Loading()
          else
            usersContent(router, theme, notifier, l10n),
        ],
      ),
    );
  }

  Widget usersContent(
    StackRouter router,
    AppTheme theme,
    DiscoverySearchViewModel notifier,
    L10n l10n,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        final userSearchFuture =
            ref.watch(discoverySearchProvider(_keywordController.text));

        return userSearchFuture.when(
          data: (users) {
            final user = users?.first.users;
            final events = users?.first.events;

            return user.ext.isNullOrEmpty && events.ext.isNullOrEmpty
                ? const SizedBox.shrink()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (user != null && user.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              l10n.people,
                              style: theme.textTheme.bodyLarge.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 21),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                spacing: 24,
                                runSpacing: 24,
                                children: user
                                    .map(
                                      (element) => GestureDetector(
                                        onTap: () {
                                          widget.onTap(
                                            element,
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomAvatarImage(
                                              imageUrl: element.imageUrl,
                                            ),
                                            const SizedBox(height: 16),
                                            SizedBox(
                                              width: 81,
                                              child: PrimaryText(
                                                element.name ?? '',
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: theme.textTheme.bodyLarge
                                                    .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            const SizedBox(height: 26),
                          ],
                        ),
                    ],
                  );
          },
          loading: SizedBox.fromSize,
          error: (error, stack) => Text('Error: $error'),
        );
      },
    );
  }
}
