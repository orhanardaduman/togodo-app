import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/features/provider/tag_provider.dart';
import 'package:togodo/ui/event/view_model/create_event_view_model.dart';

class ConceptImageTab extends StatefulHookConsumerWidget {
  const ConceptImageTab({super.key, this.initialIndex});
  final int? initialIndex;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConceptImageTabState();
}

class _ConceptImageTabState extends ConsumerState<ConceptImageTab>
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
    final hobyProviderData = ref
        .watch(hobyStateNotifierProvider(context))
        .where((element) => element.id! > 0 && element.id! < 20)
        .toList();

    hobyData = hobyProviderData;
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
    _updateHobyData();
    return SizedBox(
      height: 240,
      child: NestedScrollView(
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
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: hobyData
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: ConceptImage(
                    tagId: item.id!,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class ConceptImage extends StatefulHookConsumerWidget {
  const ConceptImage({
    required this.tagId,
    super.key,
  });
  final int tagId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConceptImageState();
}

class _ConceptImageState extends ConsumerState<ConceptImage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .watch(createEventModelProvider.notifier)
          .setConceptImage(widget.tagId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(createEventModelProvider);
    final model = ref.watch(createEventModelProvider.notifier);
    return state.networkImg == null
        ? const SizedBox.shrink()
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(
                state.networkImg!.length,
                (index) => GestureDetector(
                  onTap: () {
                    model.setNetworkImageIsClick(
                      state.networkImg![index].downloadUrl!,
                    );
                  },
                  child: _ImageContainer(
                    theme: theme,
                    imgUrl: state.networkImg![index].downloadUrl!,
                    isSelected: state.networkImg![index].isSelected ?? false,
                    isClick: state.networkImg![index].isClick ?? false,
                    onChanged: (val) {
                      if (state.selectedAssetsAll != null &&
                          state.selectedAssetsAll!.length == 5) {
                        if (val == false) {
                          model.removeAssetsModel(
                            state.networkImg![index].downloadUrl!,
                          );
                        }
                      } else {
                        if (val == false) {
                          model.removeAssetsModel(
                            state.networkImg![index].downloadUrl!,
                          );
                        } else {
                          model.selectAllAssets(
                            url: state.networkImg![index].downloadUrl,
                            isNetwork: val!,
                          );
                        }
                      }
                      model.setNetworkImage(
                        state.networkImg![index].downloadUrl!,
                      );
                    },
                  ),
                ),
              ),
            ),
          );
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({
    required this.theme,
    required this.imgUrl,
    required this.isSelected,
    required this.isClick,
    this.onChanged,
  });

  final AppTheme theme;
  final String imgUrl;
  final bool isSelected;
  final bool isClick;
  // ignore: avoid_positional_boolean_parameters
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165.3,
      width: 107.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.6),
        border: Border.all(
          color: isClick ? MainColors.primary : Colors.transparent,
          width: 2,
        ),
        image: DecorationImage(
          image: NetworkImage(
            imgUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PrimaryText(
                  '12 Haz',
                  style: theme.textTheme.bodyXLarge.copyWith(
                    color: MainColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                PrimaryText(
                  'Pazartesi',
                  style: theme.textTheme.bodyMedium.copyWith(
                    color: MainColors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          if (isClick || isSelected)
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                value: isSelected,
                checkColor: MainColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                activeColor: MainColors.primary,
                side: const BorderSide(
                  color: MainColors.primary,
                ),
                onChanged: onChanged,
              ),
            ),
        ],
      ),
    );
  }
}
