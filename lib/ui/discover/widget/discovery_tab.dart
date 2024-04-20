import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_event_card.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/index.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/features/provider/tag_provider.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/discover/view_model/discover_view_model.dart';
import 'package:togodo/ui/discover/view_model/filter_view_model.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';

class DiscoveryTabBar extends StatefulHookConsumerWidget {
  const DiscoveryTabBar({super.key, this.initialIndex});
  final int? initialIndex;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DiscoveryTabBarState();
}

class _DiscoveryTabBarState extends ConsumerState<DiscoveryTabBar>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<TagsModel> hobyData = [];
  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 19,
      vsync: this,
      initialIndex: widget.initialIndex ?? 0,
    );
  }

  void _updateHobyData() {
    final model = ref.watch(filterViewModelProvider);
    final hobyProviderData = ref
        .watch(hobyStateNotifierProvider(context))
        .where((element) => element.id! >= 0 && element.id! < 20)
        .toList();

    if (model.isFilter) {
      hobyData = model.filterTags != null
          ? hobyProviderData
              .where((element) => model.filterTags!.contains(element))
              .toList()
          : hobyProviderData;
    } else {
      hobyData = hobyProviderData;
    }
    // _tabController'ın uzunluğunu hobyData'nın uzunluğuna göre ayarla
    _updateTabController();
  }

  void _updateTabController() {
    final newLength = _calculateTabLength();
    if (_tabController!.length != newLength) {
      _tabController?.dispose();
      _tabController = TabController(length: newLength, vsync: this);
    }
  }

  int _calculateTabLength() {
    return hobyData.length;
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final model = ref.watch(filterViewModelProvider);
    _updateHobyData();
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
        return <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              TabBar(
                controller: _tabController,
                labelColor: MainColors.primary,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicator: TabIndicator(
                  strokeWidth: 4,
                ),
                unselectedLabelColor: MainColors.dark3,
                labelStyle: theme.textTheme.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                tabs: hobyData.map((item) => Tab(text: item.name)).toList(),
              ),
            ]),
          ),
        ];
      },
      body: model.isRefresh
          ? const Loading()
          : TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: hobyData
                  .map(
                    (item) => DiscoverTabView(
                      tagId: item.id!,
                      isFilter: model.isFilter,
                    ),
                  )
                  .toList(),
            ),
    );
  }
}

class DiscoverTabView extends StatefulHookConsumerWidget {
  const DiscoverTabView({
    required this.tagId,
    this.isFilter = false,
    super.key,
  });
  final int tagId;
  final bool isFilter;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DiscoverTabViewState();
}

class _DiscoverTabViewState extends ConsumerState<DiscoverTabView> {
  @override
  void initState() {
    final model = ref.read(discoveryViewModelProvider(widget.tagId).notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.isFilter ? model.filterDiscovery() : model.fetchDiscovery();
    });
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final model = ref.watch(discoveryViewModelProvider(widget.tagId));
    final notifier =
        ref.read(discoveryViewModelProvider(widget.tagId).notifier);
    final theme = ref.watch(appThemeProvider);
    final filterModel = ref.watch(filterViewModelProvider);
    final notHome = ref.read(homeViewModelProvider.notifier);
    final router = useRouter();
    final l10n = useL10n();
    return model.loading || model.data.isEmpty
        ? const Loading()
        : MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: filterModel.isNotFoundEvents ||
                    (model.data.first.popular!.ext.isNullOrEmpty &&
                        model.data.first.near!.ext.isNullOrEmpty &&
                        model.data.first.soon!.ext.isNullOrEmpty)
                ? nullContent(context, l10n, theme)
                : ListView(
                    children: [
                      if (model.data.first.popular!.ext.isNotNullOrEmpty)
                        DiscoveryTabViewItem(
                          theme: theme,
                          onLikeIncrement: notifier.incrementLikePopular,
                          data: model.data.first.popular!,
                          title: l10n.populer,
                          router: router,
                          onLikeChanged: (eventId) {
                            notHome
                                .toggleLike(
                                  eventId,
                                )
                                .then(
                                  (value) =>
                                      notifier.incrementLikePopular(eventId),
                                );
                          },
                        ),
                      if (widget.isFilter
                          ? model.data.first.near!.ext.isNotNullOrEmpty
                          : (model.data.first.near!
                              .where(
                                (element) => element.location!
                                    .contains(model.location ?? ''),
                              )
                              .toList()
                              .ext
                              .isNotNullOrEmpty))
                        DiscoveryTabViewItem(
                          theme: theme,
                          onLikeIncrement: notifier.incrementLikeNear,
                          data: widget.isFilter
                              ? model.data.first.near!
                              : model.data.first.near!
                                  .where(
                                    (element) => element.location!
                                        .contains(model.location ?? ''),
                                  )
                                  .toList(),
                          router: router,
                          title: l10n.nearby,
                          onLikeChanged: (eventId) {
                            notHome
                                .toggleLike(
                                  eventId,
                                )
                                .then(
                                  (value) =>
                                      notifier.incrementLikeNear(eventId),
                                );
                          },
                        ),
                      if (model.data.first.soon!.ext.isNotNullOrEmpty)
                        DiscoveryTabViewItem(
                          theme: theme,
                          data: model.data.first.soon!,
                          router: router,
                          title: l10n.approaching,
                          onLikeIncrement: notifier.incrementLikeSoon,
                          onLikeChanged: (eventId) {
                            notHome
                                .toggleLike(
                                  eventId,
                                )
                                .then(
                                  (value) =>
                                      notifier.incrementLikeSoon(eventId),
                                );
                          },
                        ),
                    ],
                  ),
          );
  }

  Column nullContent(BuildContext context, L10n l10n, AppTheme theme) {
    return Column(
      children: <Widget>[
        if (!context.isSmallScrn)
          const SizedBox(height: 37)
        else
          const SizedBox(height: 16),
        PrimaryText(
          l10n.eventNotFound,
          style: theme.textTheme.h4.copyWith(
            color: theme.appColors.text,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        PrimaryText(
          l10n.seeOtherUsers,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge.copyWith(
            color: theme.appColors.secondText,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 49),
        Assets.images.dark.notFoundEvents.svg(),
        const SizedBox(height: 43),
        Container(
          decoration: const BoxDecoration().buttonShadow,
          width: 276,
          child: CustomButton(
            text: l10n.exploreEvents,
            radius: 100,
            onPressed: () {
              ref.read(filterViewModelProvider.notifier).clearFilterLoading();
              AutoTabsRouter.of(context).setActiveIndex(
                0,
              );
            },
          ),
        ),
      ],
    );
  }
}

class DiscoveryTabViewItem extends HookConsumerWidget {
  const DiscoveryTabViewItem({
    required this.theme,
    required this.data,
    required this.title,
    required this.router,
    required this.onLikeChanged,
    required this.onLikeIncrement,
    super.key,
  });
  final AppTheme theme;
  final List<EventModel> data;
  final String title;
  final StackRouter router;
  final void Function(String id)? onLikeChanged;
  final void Function(String id) onLikeIncrement;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: context.dyHeight(12),
        ),
        PrimaryText(
          title,
          style: theme.textTheme.h4
            ..copyWith(
              color: theme.appColors.text,
              fontWeight: FontWeight.w700,
            ),
        ),
        SizedBox(
          height: context.dyHeight(16),
        ),
        SizedBox(
          height: context.dyHeight(238),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  router.push(
                    EventDetailsRoute(
                      eventId: data[index].id!,
                      onLikeIncrement: () {
                        onLikeIncrement(data[index].id!);
                      },
                    ),
                  );
                },
                child: EnventCards(
                  data: data[index],
                  radius: 24,
                  size: EventCardSize.small,
                  onLikeChanged: ({required bool isLiked}) {
                    onLikeChanged!(data[index].id!);
                  },
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 16);
            },
          ),
        ),
      ],
    );
  }
}
