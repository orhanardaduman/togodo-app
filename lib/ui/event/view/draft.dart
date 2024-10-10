import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/custom_event_card.dart';
import 'package:togodo/core/component/custom_refresher.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/component/shimmer/comment_shimmer.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/event/view_model/create_event_view_model.dart';
import 'package:togodo/ui/event/view_model/draft_view_model.dart';

@RoutePage()
class DraftPage extends StatefulHookConsumerWidget {
  const DraftPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DraftPageState();
}

class _DraftPageState extends ConsumerState<DraftPage>
    with SingleTickerProviderStateMixin {
  final RefreshController _refreshController = RefreshController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(draftViewModelProvider.notifier).fetchDraft();
    });
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModelState = ref.watch(draftViewModelProvider);
    final viewModel = ref.read(draftViewModelProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.draftsTab,
      ),
      body: LoadingOverlay(
        isLoading: viewModelState.loading,
        progressIndicator: const Loading(),
        child: body(viewModel, viewModelState, context, theme, l10n),
      ),
    );
  }

  CustomRefresher body(
    DraftViewModel viewModel,
    DraftState viewModelState,
    BuildContext context,
    AppTheme theme,
    L10n l10n,
  ) {
    return CustomRefresher(
      controller: _refreshController,
      enablePullUp: true,
      //enablePullDown: false,
      scrollController: scrollController,
      onRefresh: () async {
        await viewModel.fetchDraft();
      },
      onLoading: () async {
        await viewModel.fetchMoreDraft();
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        slivers: [
          if (viewModelState.dataLoading)
            SliverToBoxAdapter(child: loadingIndicator())
          else if (viewModelState.data.isEmpty && !viewModelState.loading)
            SliverToBoxAdapter(child: emptyContent(context, theme, l10n))
          else
            SliverPadding(
              padding: const EdgeInsets.all(24),
              sliver: SliverToBoxAdapter(
                child: Wrap(
                  runSpacing: 16,
                  spacing: 18,
                  children: List.generate(
                    viewModelState.data.length,
                    (index) => GestureDetector(
                      onTap: () {
                        viewModel.loading();
                        ref
                            .read(createEventModelProvider.notifier)
                            .initDraftData(viewModelState.data[index].id!)
                            .then((value) {
                          viewModel.loading();
                          return Navigator.of(context).pop();
                        });
                      },
                      child: EnventCards(
                        data: viewModelState.data[index],
                        size: EventCardSize.custom,
                        width: context.sized.dynamicWidth(0.423),
                        height: context.sized.dynamicWidth(0.423) * 1.55,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          const SliverToBoxAdapter(child: SizedBox(height: 200)),
        ],
      ),
    );
  }

  Widget loadingIndicator() {
    return Column(
      children: List.generate(4, (index) => const EventCardShimmer()),
    );
  }

  Widget emptyContent(BuildContext context, AppTheme theme, L10n l10n) {
    return SizedBox(
      height: context.sized.height / 1.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PrimaryText(
            l10n.noDraftsYet,
            style: theme.textTheme.h4.copyWith(
              color: theme.appColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: context.sized.width / 1.3,
            child: PrimaryText(
              l10n.emptyDraftsMessage,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge.copyWith(
                color: theme.appColors.secondText,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 49),
          Assets.images.dark.notFounDraft.svg(),
          const SizedBox(height: 43),
          Container(
            decoration: const BoxDecoration().buttonShadow,
            width: 276,
            child: CustomButton(
              text: l10n.createEvent,
              radius: 100,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
