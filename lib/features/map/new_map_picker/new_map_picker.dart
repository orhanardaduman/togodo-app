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
import 'package:togodo/features/map/new_map_picker/new_map_location_picker.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/event/create_event_page.dart';
import 'package:togodo/ui/settings/language_settings.dart';

const currentLocation = lt.LatLng(
  41.0551,
  29.0216,
);

class NewCustomMapPicker extends StatefulHookConsumerWidget {
  const NewCustomMapPicker({
    required this.label,
    required this.locationController,
    this.initLocation,
    this.onChange,
    super.key,
  });
  final String label;
  final dynamic Function(GeocodingResult?)? onChange;
  final TextEditingController locationController;
  final lt.LatLng? initLocation;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewCustomMapPickerState();
}

class _NewCustomMapPickerState extends ConsumerState<NewCustomMapPicker> {
  late lt.LatLng selectedLocation;
  @override
  void initState() {
    show();
    super.initState();
  }

  Future<void> show() async {
    selectedLocation = await getCurrentLocation();
  }

  Future<lt.LatLng> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Konum servislerinin etkin olup olmadığını kontrol edin
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Konum servisleri etkin değilse hata fırlat
      return currentLocation;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // İzinler reddedildiyse hata fırlat
        return const lt.LatLng(
          41.0551,
          29.0216,
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // İzinler kalıcı olarak reddedildiyse hata fırlat
      return const lt.LatLng(
        41.0551,
        29.0216,
      );
    }

    // Mevcut konumu al
    final location = await Geolocator.getCurrentPosition();
    return lt.LatLng(location.latitude, location.longitude);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final language = ref.watch(languageProvider);
    final l10n = useL10n();
    return Column(
      children: [
        CustomTextField(
          isReadOnly: true,
          onTap: () async {
            await showMaterialModalBottomSheet<CreateEventPage>(
              context: context,
              enableDrag: false,
              builder: (BuildContext context) {
                // Burada yeni post ekleme formunuzu oluşturun
                return NewMapLocationPicker(
                  apiKey: getGoogleMapsApiKey(),
                  popOnNextButtonTaped: true,
                  hideMoreOptions: true,
                  hideBottomCard: true,
                  language: language,
                  searchHintText: l10n.search,
                  hideMapTypeButton: true,
                  topCardColor: theme.appColors.background,
                  topCardShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  components: [
                    Component('country', 'tr'),
                  ],
                  currentLatLng: selectedLocation,
                  onDecodeAddress: (GeocodingResult? result) {
                    selectedLocation = lt.LatLng(
                      result!.geometry.location.lat,
                      result.geometry.location.lng,
                    );
                    widget.onChange?.call(
                      result,
                    );
                    setState(() {});
                  },
                  onNext: (GeocodingResult? result) {
                    selectedLocation = lt.LatLng(
                      result!.geometry.location.lat,
                      result.geometry.location.lng,
                    );
                    widget.onChange?.call(
                      result,
                    );
                    setState(() {});
                  },
                  onSuggestionSelected: (PlacesDetailsResponse? result) {
                    selectedLocation = lt.LatLng(
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
