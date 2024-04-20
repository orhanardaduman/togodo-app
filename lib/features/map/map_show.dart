// ignore_for_file: only_throw_errors

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomMapShow extends StatefulHookConsumerWidget {
  const CustomMapShow({
    required this.selectedLocation,
    required this.isDarkTheme,
    super.key,
  });
  final LatLng selectedLocation;
  final bool isDarkTheme;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomMapShowState();
}

class _CustomMapShowState extends ConsumerState<CustomMapShow> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  BitmapDescriptor? customIcon;

  Future<void> _createMarkerImageFromAsset(L10n l10n) async {
    final imageConfiguration = createLocalImageConfiguration(context);
    final icon = await BitmapDescriptor.fromAssetImage(
      imageConfiguration,
      Assets.icons.social.pin.path,
    );
    setState(() {
      customIcon = icon;
      _markers.add(
        Marker(
          markerId: const MarkerId('selectedLocation'),
          position: widget.selectedLocation, // İşaretçinin konumu
          icon: customIcon ?? BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: 'Seçilen Konum',
            onTap: () => mapShow(l10n),
          ),
        ),
      );
    });
  }

  void mapShow(L10n l10n) {
    showModalBottomSheet<DraggableScrollableSheet>(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        // Burada yeni post ekleme formunuzu oluşturun
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.45, // Başlangıç boyutu
          maxChildSize: 0.6,
          minChildSize: 0.45, // Minimum kaplayacağı boyut
          builder: (_, controller) {
            return SingleChildScrollView(
              controller: controller,
              child: CustomModal(
                title: l10n.mapOpen,
                maxHeight: context.sized.dynamicHeight(0.9),
                isCloseDivider: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 23,
                ),
                child: Wrap(
                  runSpacing: 24,
                  children: [
                    const Divider(),
                    CustomButton(
                      text: l10n.googleMapOpen,
                      mode: ButtonMode.dark,
                      mainAxisAlignment: MainAxisAlignment.start,
                      leftIcon: Assets.icons.social.googleMapsSvg.path,
                      iconSize: 24,
                      isLeftIconColor: false,
                      onPressed: () {
                        openGoogleMaps(
                          widget.selectedLocation.latitude,
                          widget.selectedLocation.longitude,
                        );
                      },
                      side: const BorderSide(
                        color: MainColors.dark3,
                      ),
                    ),
                    CustomButton(
                      text: l10n.yandexMapOpen,
                      mode: ButtonMode.dark,
                      mainAxisAlignment: MainAxisAlignment.start,
                      leftIcon: Assets.icons.social.navi.path,
                      iconSize: 24,
                      isLeftIconColor: false,
                      onPressed: () {
                        openYandexMaps(
                          widget.selectedLocation.latitude,
                          widget.selectedLocation.longitude,
                        );
                      },
                      side: const BorderSide(
                        color: MainColors.dark3,
                      ),
                    ),
                    CustomButton(
                      text: l10n.mapWithOpen,
                      mode: ButtonMode.dark,
                      mainAxisAlignment: MainAxisAlignment.start,
                      leftIcon: Assets.icons.social.appleMapsLogo1.path,
                      iconSize: 24,
                      isLeftIconColor: false,
                      onPressed: () {
                        openAppleMaps(
                          widget.selectedLocation.latitude,
                          widget.selectedLocation.longitude,
                        );
                      },
                      side: const BorderSide(
                        color: MainColors.dark3,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    _createMarkerImageFromAsset(l10n);
    return Container(
      width: 380,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GoogleMap(
          onTap: (argument) {
            mapShow(l10n);
          },
          myLocationButtonEnabled: false,
          initialCameraPosition: CameraPosition(
            target: widget.selectedLocation,
            zoom: 14.4746,
          ),
          markers: _markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            if (widget.isDarkTheme) _setMapStyle(controller);
          },
        ),
      ),
    );
  }

  Future<void> _setMapStyle(GoogleMapController controller) async {
    final style = await DefaultAssetBundle.of(context)
        .loadString('assets/json/map_style.json');
    await controller.setMapStyle(style);
  }

  Future<void> openGoogleMaps(double latitude, double longitude) async {
    final googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }

  Future<void> openYandexMaps(double latitude, double longitude) async {
    final yandexUrl =
        'yandexmaps://maps.yandex.ru/?ll=$longitude,$latitude&z=12';
    final webUrl = 'https://yandex.ru/maps/?ll=$longitude,$latitude&z=12';

    try {
      // Yandex Haritalar uygulamasını başlatmayı dene
      if (await canLaunchUrl(Uri.parse(yandexUrl))) {
        await launchUrl(Uri.parse(yandexUrl));
      } else {
        // Yandex Haritalar uygulaması yüklü değilse, web haritasını aç
        await launchUrl(Uri.parse(webUrl));
      }
    } catch (e) {
      // Hata durumunda işlemleri burada yönetin
      if (kDebugMode) {
        print('Error opening Yandex Maps: $e');
      }
      // Hata durumunda uygun bir şekilde kullanıcıya geri bildirim sağlayabilirsiniz
      throw 'Could not open Yandex Maps.';
    }
  }

  Future<void> openAppleMaps(double latitude, double longitude) async {
    final appleUrl = 'https://maps.apple.com/?q=$latitude,$longitude';
    if (await canLaunchUrl(Uri.parse(appleUrl))) {
      await launchUrl(Uri.parse(appleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }
}
