// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/custom_event_card.dart';
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
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/discover/view_model/discovery_search_view_model.dart';

@RoutePage()
class DiscoverSearchPage extends StatefulHookConsumerWidget {
  const DiscoverSearchPage({
    super.key,
  });
  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _DiscoverSearchPageState();
}

class _DiscoverSearchPageState extends ConsumerState<DiscoverSearchPage> {
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
    return Scaffold(
      backgroundColor: theme.appColors.background,
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
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
                ? Column(
                    children: [
                      if (_keywordController.text.isEmpty)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: context.dyHeight(90),
                            ),
                            SizedBox(
                              width: context.sized.dynamicWidth(0.6),
                              child: PrimaryText(
                                l10n.findPeopleAndEvents,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: MainColors.primary,
                                ),
                              ),
                            ),
                            LottieBuilder.asset(
                              Assets.lottie.searchTogodo,
                            ),
                          ],
                        )
                      else
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: context.dyHeight(80),
                            ),
                            SizedBox(
                              width: context.sized.dynamicWidth(0.6),
                              child: PrimaryText(
                                l10n.couldntFind,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.h4.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: MainColors.primary,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.sized.dynamicWidth(0.6),
                              child: PrimaryText(
                                l10n.continueSearching,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: MainColors.primary,
                                ),
                              ),
                            ),
                            Assets.images.dark.notFountEvents.svg(),
                          ],
                        ),
                    ],
                  )
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
                                          notifier.saveSearch(
                                            userId: element.id,
                                            keyword: _keywordController.text,
                                          );
                                          router.push(
                                            UserProfileRoute(
                                              userId: element.id!,
                                            ),
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
                      if (events != null && events.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              l10n.eventsTab,
                              style: theme.textTheme.bodyLarge.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 21),
                            GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Yan yana iki öğe olacak
                                crossAxisSpacing: 18, // Yatay aralık
                                mainAxisSpacing: 16, // Dikey aralık
                                childAspectRatio: 189 /
                                    302, // Öğelerin genişlik/yükseklik oranı
                              ),
                              itemCount: events.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    notifier.saveSearch(
                                      eventId: events[index].id,
                                      keyword: _keywordController.text,
                                    );
                                    router.push(
                                      EventDetailsRoute(
                                        eventId: events[index].id!,
                                      ),
                                    );
                                  },
                                  child: EnventCards(
                                    data: events[index],
                                  ),
                                );
                              },
                            ),
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
