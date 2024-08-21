// ignore_for_file: prefer_null_aware_method_calls

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart' as lt;
import 'package:map_location_picker/map_location_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:togodo/core/component/input/custom_text_field.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/map/custom_map.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/event/create_event_page.dart';
import 'package:togodo/ui/settings/language_settings.dart';

class CustomMapPicker extends StatefulHookConsumerWidget {
  const CustomMapPicker({
    required this.label,
    required this.locationController,
    this.initLocation,
    this.onChange,
    super.key,
  });
  final String label;
  final dynamic Function(GeocodingResult?)? onChange;
  final TextEditingController locationController;
  final LatLng? initLocation;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomMapPickerState();
}

class _CustomMapPickerState extends ConsumerState<CustomMapPicker> {
  bool _isShow = false;
  @override
  void initState() {
    show();
    super.initState();
  }

  void show() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isShow = true;
      });
    });
  }

  @override
  void dispose() {
    _isShow = false;

    super.dispose();
  }

  lt.LatLng currentLang = const LatLng(
    41.0551,
    29.0216,
  );
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final language = ref.watch(languageProvider);
    final l10n = useL10n();
    return Column(
      children: [
        if (_isShow)
          CustomTextField(
            isReadOnly: true,
            onTap: () async {
              await showMaterialModalBottomSheet<CreateEventPage>(
                context: context,
                enableDrag: false,
                builder: (BuildContext context) {
                  final searchController = TextEditingController(
                    text: widget.locationController.text,
                  );
                  // Burada yeni post ekleme formunuzu oluşturun
                  return CustomMapLocationPicker(
                    apiKey: getGoogleMapsApiKey(),
                    searchController: searchController,
                    searchHintText: l10n.searchText,
                    hideBottomCard: true,
                    language: language,
                    isDarkTheme: theme.mode == ThemeMode.dark,
                    components: [
                      Component('country', 'tr'),
                    ],
                    hideMoreOptions: true,
                    currentLatLng: currentLang,
                    topCardColor: theme.appColors.background,
                    onDecodeAddress: (result) async {
                      if (result != null) {
                        setState(() {
                          // Location'ı LatLng'ye dönüştürme
                          currentLang = LatLng(
                            result.geometry.location.lat,
                            result.geometry.location.lng,
                          );
                          if (widget.onChange != null) {
                            widget.onChange!(result);
                          }
                        });
                      }
                    },
                    onSuggestionSelected: (PlacesDetailsResponse? result) {
                      currentLang = LatLng(
                        result!.result.geometry!.location.lat,
                        result.result.geometry!.location.lng,
                      );
                      widget.onChange?.call(
                        GeocodingResult(
                          geometry: result.result.geometry!,
                          placeId: result.result.placeId,
                        ),
                      );
                      setState(() {});
                    },
                    onNext: (GeocodingResult? result) async {
                      if (result != null) {
                        setState(() {
                          // Location'ı LatLng'ye dönüştürme
                          currentLang = LatLng(
                            result.geometry.location.lat,
                            result.geometry.location.lng,
                          );
                          if (widget.onChange != null) {
                            widget.onChange!(result);
                          }
                        });
                      }
                    },
                  );
                },
              );
              return;
            },
            label: widget.label,
            controller: widget.locationController,
            prefixIcon: Assets.icons.bold.location.path,
          ),
      ],
    );
  }
}
