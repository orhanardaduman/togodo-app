import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/input/custom_text_field.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/provider/tag_provider.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/discover/view/filter_view.dart';
import 'package:togodo/ui/discover/view_model/discover_view_model.dart';
import 'package:togodo/ui/discover/view_model/filter_view_model.dart';
import 'package:togodo/ui/discover/widget/discovery_tab.dart';

@RoutePage()
class DiscoverPage extends HookConsumerWidget {
  const DiscoverPage({super.key, this.initialIndex});
  final int? initialIndex;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final keywordController = useTextEditingController();
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final filterModel = ref.watch(filterViewModelProvider);
    return SafeArea(
      bottom: false,
      child: LoadingOverlay(
        isLoading: ref.watch(discoveryViewModelProvider(0)).pageLoading,
        progressIndicator: const Loading(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 13),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 12,
                    ),
                    child: Column(
                      children: [
                        CustomTextField(
                          label: l10n.search,
                          controller: keywordController,
                          prefixIcon: Assets.icons.light.search.path,
                          suffixIcon: Assets.icons.light.filter.path,
                          isReadOnly: true,
                          onTap: () {
                            router.push(
                              const DiscoverSearchRoute(),
                            );
                          },
                          onSuffixTap: () {
                            showDragCustomSheet(
                              minChildSize: 0.8,
                              maxChildSize: 1,
                              initialChildSize: 0.95,
                              context: context,
                              child: const DiscoverFilterView(),
                              title: l10n.filter,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.sized.dynamicHeight(0.78),
                    child: DiscoveryTabBar(
                      initialIndex: initialIndexs(ref, context),
                    ),
                  ),
                ],
              ),
              if (!filterModel.isNotFoundEvents)
                Positioned(
                  bottom: context.dyHeight(118),
                  child: Container(
                    width: 136,
                    height: 45,
                    decoration: const BoxDecoration().buttonShadow,
                    child: CustomButton(
                      text: l10n.map,
                      leftIcon: Assets.icons.bold.map.path,
                      radius: 100,
                      style: theme.textTheme.bodyXLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      onPressed: () async {
                        await router.push(
                          const DiscoveryMapViewRoute(),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  int initialIndexs(WidgetRef ref, BuildContext context) {
    final index = ref
        .watch(hobyStateNotifierProvider(context))
        .where((element) => element.id! >= 0 && element.id! < 20)
        .toList()
        .indexWhere((element) => element.id == initialIndex);

    // Eğer eşleşme bulunamazsa, -1 döndürür. Bu durumda null döndürmek isteyebilirsiniz.
    return index >= 0 ? index : 0;
  }
}
