import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_event_card.dart';
import 'package:togodo/core/component/custom_refresher.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/likes/likes_view_model.dart';

@RoutePage()
class LikesPage extends StatefulHookConsumerWidget {
  const LikesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LikesPageState();
}

class _LikesPageState extends ConsumerState<LikesPage> {
  final RefreshController _refreshController = RefreshController();
  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(likesViewModelProvider.notifier).fetchEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(likesViewModelProvider);
    final notifier = ref.read(likesViewModelProvider.notifier);
    final router = useRouter();
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    // homeViewModel.data içerisinde verilerinizi bulabilirsiniz.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: PrimaryText(
            l10n.likesEvent,
            style: theme.textTheme.h4.copyWith(
              color: theme.appColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: data!.loading
          ? const Loading()
          : CustomRefresher(
              controller: _refreshController,
              onRefresh: () async => notifier.fetchEvents(),
              child: data.events.ext.isNullOrEmpty
                  ? nullInfo(l10n, theme, context)
                  : GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Yan yana iki öğe olacak
                        crossAxisSpacing: 18, // Yatay aralık
                        mainAxisSpacing: 16, // Dikey aralık
                        childAspectRatio:
                            189 / 302, // Öğelerin genişlik/yükseklik oranı
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 24).copyWith(
                        bottom: context.sized.dynamicHeight(0.13),
                      ), // Alt padding'i ayarlayın

                      itemCount: data.events.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            router.push(
                              EventDetailsRoute(
                                eventId: data.events[index].id!,
                              ),
                            );
                          },
                          child: EnventCards(
                            data: data.events[index],
                            onLikeChanged: ({required bool isLiked}) {
                              notifier.toggleLike(
                                data.events[index].id!,
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
    );
  }

  Column nullInfo(L10n l10n, AppTheme theme, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            children: [
              PrimaryText(
                l10n.eventNotFound,
                style: theme.textTheme.h4.copyWith(
                  color: theme.appColors.text,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              PrimaryText(
                l10n.likesPageInfo,
                style: theme.textTheme.bodyXLarge.copyWith(
                  color: theme.appColors.secondText,
                ),
                textAlign: TextAlign.center,
              ),
              Assets.images.dark.heart.svg(),
              const SizedBox(height: 30),
              Container(
                decoration: const BoxDecoration().buttonShadow,
                width: 276,
                child: CustomButton(
                  radius: 100,
                  text: l10n.exploreEvents,
                  style: theme.textTheme.bodyXLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: MainColors.white,
                  ),
                  onPressed: () {
                    AutoTabsRouter.of(context).setActiveIndex(
                      0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
