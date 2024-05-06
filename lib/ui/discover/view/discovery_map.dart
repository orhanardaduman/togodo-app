// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/button/custom_circle_button.dart';
import 'package:togodo/core/component/custom_event_card.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/discovery_map_model.dart';
import 'package:togodo/features/map/custom_map.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/discover/view_model/discovery_map_view_model.dart';
import 'package:togodo/ui/settings/language_settings.dart';

@RoutePage()
class DiscoveryMapViewPage extends StatefulHookConsumerWidget {
  const DiscoveryMapViewPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DiscoveryMapViewPageState();
}

class _DiscoveryMapViewPageState extends ConsumerState<DiscoveryMapViewPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = ref.read(discoveryMapViewModelProvider.notifier);
      final router = AutoRouter.of(context);
      notifier.determinePosition().then(
        (value) {
          notifier
            ..getPlace(value)
            ..setCurrentLocation(
              MarkerModel(LatLng(value.latitude, value.longitude), '0'),
            )
            ..addAllMarkers(
                value: value,
                isNewMark: false,
                router,
                initCity: 'Türkiye',
                context: context);
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();
    final model = ref.watch(discoveryMapViewModelProvider);
    final notifier = ref.read(discoveryMapViewModelProvider.notifier);

    //final notifier = ref.read(discoveryMapViewModelProvider.notifier);

    /*  _determinePosition().then(
      (value) => setState(() {
        currentLatLng = LatLng(value.latitude, value.longitude);
      }),
    ); */
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (model.loading)
            const SizedBox.shrink()
          else
            CustomMapLocationPicker(
              apiKey: getGoogleMapsApiKey(),
              language: language,
              hideBottomCard: true,
              isDarkTheme: theme.mode == ThemeMode.dark,
              hideMoreOptions: true,
              searchHintText: l10n.search,
              hideMapTypeButton: true,
              hideLocationButton: true,
              /*  onCameraMove: (position) {
                    notifier.updatePosition(position, router);
                  }, */
              currentLatLng: model.currentLatLng,
              components: [
                Component('country', 'tr'),
              ],
              markers: model.markers,
              topCardColor: Colors.transparent,
            ),
          Positioned(
            bottom: context.dyHeight(47),
            child: Column(
              children: [
                Container(
                  width: 146,
                  height: 45,
                  decoration: const BoxDecoration().buttonShadow,
                  child: CustomButton(
                    text: l10n.category,
                    style: theme.textTheme.bodyXLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    leftIcon: Assets.icons.bold.category.path,
                    radius: 100,
                    onPressed: router.pop,
                  ),
                ),
                if (!model.hideCard)
                  const SizedBox(
                    height: 24,
                  ),
                if (!model.hideCard) const DiscoveryMapCard(),
              ],
            ),
          ),
          Positioned(
            bottom: model.hideCard
                ? context.dyHeight(47)
                : context.sized.dynamicHeight(0.35),
            right: 0,
            child: Column(
              children: [
                CustomCircleButton(
                  backgroundColor: theme.appColors.background.withOpacity(0.4),
                  mini: true,
                  iconPath: model.hideCard
                      ? Assets.icons.bold.arrowUp2.path
                      : Assets.icons.bold.arrowDown2.path,
                  onPressed: notifier.setHideCard,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DiscoveryMapCard extends HookConsumerWidget {
  const DiscoveryMapCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(discoveryMapViewModelProvider);
    final router = useRouter();
    return model.data.isEmpty
        ? const SizedBox.shrink()
        : model.selectedMap == null
            ? SizedBox(
                height: 238,
                width: context.sized.width,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 24),
                  itemCount: model.data.length > 3 ? 3 : model.data.length,
                  itemBuilder: (context, index) {
                    return eventCard(router, model.data[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                ),
              )
            : eventCard(
                router,
                model.selectedMap!,
              );
  }

  GestureDetector eventCard(
    StackRouter router,
    DiscoveryMapModel data,
  ) {
    return GestureDetector(
      onTap: () {
        router.push(
          EventDetailsRoute(
            eventId: data.id!,
          ),
        );
      },
      child: EnventCards(
        data: data,
        radius: 24,
        size: EventCardSize.small,
      ),
    );
  }
}

class BubbleWithArrow extends StatelessWidget {
  const BubbleWithArrow({
    required this.name,
    super.key,
  });
  final String name;
  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Assets.icons.social.customMarkes.svg(
                width: 140,
              ),
              Positioned(
                bottom: 50,
                child: SvgPicture.asset(
                  name,
                  color: Colors.white,
                  width: 90,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
