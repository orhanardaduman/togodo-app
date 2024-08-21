import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart' as lt;
import 'package:map_location_picker/map_location_picker.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/features/map/new_map_picker/new_autocomplete_view.dart';
import 'package:togodo/features/map/new_map_picker/new_map_picker.dart';

import '../../data/model/event/map_loaction_model.dart';
import '../../ui/discover/view/discovery_map.dart';

class CustomMapLocationPicker extends StatefulWidget {
  const CustomMapLocationPicker({
    required this.apiKey,
    required this.isDarkTheme,
    super.key,
    this.desiredAccuracy = LocationAccuracy.high,
    this.geoCodingBaseUrl,
    this.geoCodingHttpClient,
    this.markers,
    this.geoCodingApiHeaders,
    this.language,
    this.locationType = const [],
    this.resultType = const [],
    this.minMaxZoomPreference = const MinMaxZoomPreference(0, 16),
    this.padding = EdgeInsets.zero,
    this.compassEnabled = true,
    this.liteModeEnabled = false,
    this.topCardMargin = const EdgeInsets.all(8),
    this.topCardColor,
    this.topCardShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.searchHintText = 'Start typing to search',
    this.bottomCardShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    this.bottomCardMargin = const EdgeInsets.fromLTRB(8, 8, 8, 16),
    this.bottomCardIcon = const Icon(Icons.send),
    this.bottomCardTooltip = 'Continue with this location',
    this.bottomCardColor,
    this.hasLocationPermission = true,
    this.getLocation,
    this.onSuggestionSelected,
    this.onNext,
    this.currentLatLng = const lt.LatLng(28.8993468, 76.6250249),
    this.hideBackButton = false,
    this.popOnNextButtonTaped = false,
    this.backButton,
    this.hideMoreOptions = false,
    this.dialogTitle = 'You can also use the following options',
    this.placesHttpClient,
    this.placesApiHeaders,
    this.placesBaseUrl,
    this.sessionToken,
    this.offset,
    this.origin,
    this.location,
    this.radius,
    this.region,
    this.fields = const [],
    this.types = const [],
    this.components = const [],
    this.strictbounds = false,
    this.hideSuggestionsOnKeyboardHide = false,
    this.mapType = MapType.normal,
    this.searchController,
    this.additionalMarkers,
    this.bottom = true,
    this.left = true,
    this.maintainBottomViewPadding = false,
    this.minimum = EdgeInsets.zero,
    this.right = true,
    this.top = true,
    this.hideLocationButton = false,
    this.hideMapTypeButton = false,
    this.hideBottomCard = false,
    this.onCameraMove,
    this.onDecodeAddress,
  });

  /// Padding around the map
  final EdgeInsets padding;

  /// Compass for the map (default: true)
  final bool compassEnabled;

  /// Lite mode for the map (default: false)
  final bool liteModeEnabled;

  /// API key for the map & places
  final String apiKey;

  /// GPS accuracy for the map
  final LocationAccuracy desiredAccuracy;

  /// GeoCoding base url
  final String? geoCodingBaseUrl;

  /// GeoCoding http client
  final http.Client? geoCodingHttpClient;

  /// GeoCoding api headers
  final Map<String, String>? geoCodingApiHeaders;

  /// GeoCoding location type
  final List<String> locationType;

  /// GeoCoding result type
  final List<String> resultType;

  /// Map minimum zoom level & maximum zoom level
  final MinMaxZoomPreference minMaxZoomPreference;

  /// Top card margin
  final EdgeInsetsGeometry topCardMargin;

  /// Top card color
  final Color? topCardColor;

  /// Top card shape
  final ShapeBorder topCardShape;

  /// Top card text field border radius
  final BorderRadiusGeometry borderRadius;

  /// Top card text field hint text
  final String searchHintText;

  /// Bottom card shape
  final ShapeBorder bottomCardShape;

  /// Bottom card margin
  final EdgeInsetsGeometry bottomCardMargin;

  /// Bottom card icon
  final Icon bottomCardIcon;

  /// Bottom card tooltip
  final String bottomCardTooltip;

  /// Bottom card color
  final Color? bottomCardColor;

  /// On location permission callback
  final bool hasLocationPermission;

  /// detect location button click callback
  final void Function()? getLocation;

  /// On Suggestion Selected callback
  final void Function(PlacesDetailsResponse?)? onSuggestionSelected;

  /// On Next Page callback
  final void Function(GeocodingResult?)? onNext;

  /// When tap on map decode address callback void function
  final void Function(GeocodingResult?)? onDecodeAddress;

  /// Show back button (default: true)
  final bool hideBackButton;

  /// Popup route on next press (default: false)
  final bool popOnNextButtonTaped;

  /// Back button replacement when [hideBackButton] is false and [backButton] is not null
  final Widget? backButton;

  /// Show more suggestions
  final bool hideMoreOptions;

  /// Dialog title
  final String dialogTitle;

  /// httpClient is used to make network requests.
  final http.Client? placesHttpClient;

  /// apiHeader is used to add headers to the request.
  final Map<String, String>? placesApiHeaders;

  /// baseUrl is used to build the url for the request.
  final String? placesBaseUrl;

  /// Session token for Google Places API
  final String? sessionToken;

  /// Offset for pagination of results
  /// offset: int,
  final num? offset;

  /// Origin location for calculating distance from results
  /// origin: Location(lat: -33.852, lng: 151.211),
  final Location? origin;

  /// currentLatLng init location for camera position
  /// currentLatLng: Location(lat: -33.852, lng: 151.211),
  final lt.LatLng? currentLatLng;

  /// Location bounds for restricting results to a radius around a location
  /// location: Location(lat: -33.867, lng: 151.195)
  final Location? location;

  /// Radius for restricting results to a radius around a location
  /// radius: Radius in meters
  final num? radius;

  /// Language code for Places API results
  /// language: 'en',
  final String? language;

  /// Types for restricting results to a set of place types
  final List<String> types;

  /// Components set results to be restricted to a specific area
  /// components: [Component(Component.country, "us")]
  final List<Component> components;

  /// Bounds for restricting results to a set of bounds
  final bool strictbounds;

  /// Region for restricting results to a set of regions
  /// region: "us"
  final String? region;

  /// List of fields to be returned by the Google Maps Places API.
  /// Refer to the Google Documentation here for a list of valid values: https://developers.google.com/maps/documentation/places/web-service/details
  final List<String> fields;

  /// Hide Suggestions on keyboard hide
  final bool hideSuggestionsOnKeyboardHide;

  /// Map type (default: MapType.normal)
  final MapType mapType;

  /// Search text field controller
  final TextEditingController? searchController;

  /// Add your own custom markers
  final Map<String, LatLng>? additionalMarkers;

  /// Safe area parameters (default: true)
  final bool bottom;
  final bool left;
  final bool maintainBottomViewPadding;
  final EdgeInsets minimum;
  final bool right;
  final bool top;

  /// hide location button and map type button (default: false)
  final bool hideLocationButton;
  final bool hideMapTypeButton;

  /// hide bottom card (default: false)
  final bool hideBottomCard;
  final bool isDarkTheme;
  final Set<AbilityModel>? markers;
  final void Function(CameraPosition)? onCameraMove;
  @override
  State<CustomMapLocationPicker> createState() =>
      _CustomMapLocationPickerState();
}

class _CustomMapLocationPickerState extends State<CustomMapLocationPicker> {
  /// Map controller for movement & zoom
  final Completer<GoogleMapController> _controller = Completer();
  final fm.MapController controllerMap = fm.MapController();

  /// initial latitude & longitude
  late lt.LatLng _initialPosition = currentLocation;

  /// initial address text
  late String _address = 'Tap on map to get address';

  /// Map type (default: MapType.normal)
  late MapType _mapType = MapType.normal;

  /// initial zoom level
  late double _zoom = 16;

  /// GeoCoding result for further use
  GeocodingResult? _geocodingResult;

  /// GeoCoding results list for further use
  late List<GeocodingResult> _geocodingResultList = [];

  /// Search text field controller
  late TextEditingController _searchController = TextEditingController();

  /*  Future<void> _setMapStyle(GoogleMapController controller) async {
    final style = await DefaultAssetBundle.of(context)
        .loadString('assets/json/map_style.json');
    await controller.setMapStyle(style);
  } */

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    return PopScope(
      // ignore: avoid_bool_literals_in_conditional_expressions
      canPop: Navigator.of(context).userGestureInProgress ? false : true,
      child: Scaffold(
        body: Stack(
          children: [
            //https://mt0.google.com/vt/lyrs=m@221097413,traffic,transit,bike&x={x}&y={y}&z={z}

            fm.FlutterMap(
              mapController: controllerMap,
              options: fm.MapOptions(
                minZoom: 5,
                maxZoom: 18,
                initialZoom: 16,
                initialCenter: _initialPosition,
              ),
              children: [
                fm.TileLayer(
                  urlTemplate:
                      'https://mt0.google.com/vt/lyrs=m@221097413&x={x}&y={y}&z={z}',
                ),
                if (widget.markers != null)
                  fm.MarkerLayer(
                    markers: [
                      for (var i in widget.markers!)
                        fm.Marker(
                          key: Key(i.id ?? '0'),
                          point: i.location ?? const lt.LatLng(0, 0),
                          width: 100,
                          height: 100,
                          alignment: Alignment.topCenter,
                          child: i.isCurrent == true
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: RippleAnimation(
                                    color: MainColors.primary,
                                    delay: const Duration(milliseconds: 300),
                                    repeat: true,
                                    minRadius: 32,
                                    ripplesCount: 6,
                                    duration:
                                        const Duration(milliseconds: 6 * 300),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            color: MainColors.primary,
                                            shape: BoxShape.circle,
                                            border: Border.fromBorderSide(
                                              BorderSide(
                                                color: MainColors.primary,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: Image.network(
                                              i.iconPath ?? '',
                                              errorBuilder: (c, s, a) {
                                                return Container(
                                                  color: Colors.black,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    i.onTap?.call();
                                  },
                                  child: BubbleWithArrow(
                                    name: i.iconPath ?? '',
                                  ),
                                ),
                        ),
                    ],
                  )
              ],
            ),
            /* Animarker(
              rippleRadius: 0.2,
              curve: Curves.bounceOut,
              rippleColor: MainColors.primary,
              rippleDuration:
                  const Duration(milliseconds: 2500), //Pulse ripple duration
              mapId: _controller.future.then<int>((value) => value.mapId),
              markers: widget.markers ?? {},


              child: GoogleMap(
                minMaxZoomPreference: widget.minMaxZoomPreference,
                onCameraMove: (CameraPosition position) {
                  /// set zoom level
                  _zoom = position.zoom;
                  widget.onCameraMove?.call(position);
                },
                initialCameraPosition: CameraPosition(
                  target: _initialPosition,
                  zoom: _zoom,
                ),
                onTap: (LatLng position) async {
                  _initialPosition = position;
                  final controller = await _controller.future;
                  await controller.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition()),
                  );
                  await _decodeAddress(
                    Location(
                      lat: position.latitude,
                      lng: position.longitude,
                    ),
                  );
                  setState(() {});
                },
                onMapCreated: _controller.complete,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                padding: widget.padding,
                compassEnabled: widget.compassEnabled,
                liteModeEnabled: widget.liteModeEnabled,
              ),
            ),*/
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(21),
                  child: NewPlacesAutocomplete(
                    bottom: widget.bottom,
                    left: widget.left,
                    maintainBottomViewPadding: widget.maintainBottomViewPadding,
                    minimum: widget.minimum,
                    right: widget.right,
                    top: widget.top,
                    apiKey: widget.apiKey,
                    mounted: mounted,
                    searchController: _searchController,
                    borderRadius: widget.borderRadius,
                    offset: widget.offset,
                    radius: widget.radius,
                    backButton: widget.backButton,
                    components: widget.components,
                    fields: widget.fields,
                    hideSuggestionsOnKeyboardHide:
                        widget.hideSuggestionsOnKeyboardHide,
                    language: widget.language,
                    location: widget.location,
                    origin: widget.origin,
                    placesApiHeaders: widget.placesApiHeaders,
                    placesBaseUrl: widget.placesBaseUrl,
                    placesHttpClient: widget.placesHttpClient,
                    region: widget.region,
                    searchHintText: widget.searchHintText,
                    sessionToken: widget.sessionToken,
                    hideBackButton: widget.hideBackButton,
                    strictbounds: widget.strictbounds,
                    topCardColor: widget.topCardColor,
                    topCardMargin: widget.topCardMargin,
                    topCardShape: widget.topCardShape,
                    types: widget.types,
                    onGetDetailsByPlaceId: (placesDetails) async {
                      if (placesDetails == null) {
                        log('placesDetails is null');
                        return;
                      }
                      _initialPosition = lt.LatLng(
                        placesDetails.result.geometry?.location.lat ?? 0,
                        placesDetails.result.geometry?.location.lng ?? 0,
                      );
                      final controller = await _controller.future;
                      await controller.animateCamera(
                        CameraUpdate.newCameraPosition(cameraPosition()),
                      );
                      _address = placesDetails.result.formattedAddress ?? '';
                      widget.onSuggestionSelected?.call(placesDetails);
                      _geocodingResult = GeocodingResult(
                        geometry: placesDetails.result.geometry!,
                        placeId: placesDetails.result.placeId,
                        addressComponents:
                            placesDetails.result.addressComponents,
                        formattedAddress: placesDetails.result.formattedAddress,
                        types: placesDetails.result.types,
                      );

                      // updating the suggestion box modal data
                      await _decodeAddress(
                        Location(
                          lat: _initialPosition.latitude,
                          lng: _initialPosition.longitude,
                        ),
                      );

                      setState(() {});
                    },
                  ),
                ),
                const Spacer(),
                if (!widget.hideLocationButton)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 21,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: const BoxDecoration().buttonShadow,
                          width: 235,
                          child: CustomButton(
                            text: l10n!.go,
                            radius: 100,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 21,
                        ),
                        Column(
                          children: <Widget>[
                            if (!widget.hideMapTypeButton)
                              Card(
                                color: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(360),
                                ),
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.5),
                                  child: PopupMenuButton(
                                    tooltip: 'Map Type',
                                    initialValue: _mapType,
                                    icon: Icon(
                                      Icons.layers,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                    onSelected: (MapType mapType) {
                                      setState(() {
                                        _mapType = mapType;
                                      });
                                    },
                                    itemBuilder: (context) => const [
                                      PopupMenuItem(
                                        value: MapType.normal,
                                        child: Text('Normal'),
                                      ),
                                      PopupMenuItem(
                                        value: MapType.hybrid,
                                        child: Text('Hybrid'),
                                      ),
                                      PopupMenuItem(
                                        value: MapType.satellite,
                                        child: Text('Satellite'),
                                      ),
                                      PopupMenuItem(
                                        value: MapType.terrain,
                                        child: Text('Terrain'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            const SizedBox(
                              height: 21,
                            ),
                            if (!widget.hideLocationButton)
                              FloatingActionButton(
                                tooltip: 'My Location',
                                backgroundColor: MainColors.dark3,
                                foregroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                onPressed: () async {
                                  // call parent method
                                  if (widget.getLocation != null) {
                                    widget.getLocation!.call();
                                  }

                                  if (widget.hasLocationPermission) {
                                    await Geolocator.requestPermission();
                                    final position =
                                        await Geolocator.getCurrentPosition(
                                      desiredAccuracy: widget.desiredAccuracy,
                                    );
                                    final latLng = lt.LatLng(
                                      position.latitude,
                                      position.longitude,
                                    );
                                    _initialPosition = latLng;
                                    final controller = await _controller.future;
                                    await controller.animateCamera(
                                      CameraUpdate.newCameraPosition(
                                        cameraPosition(),
                                      ),
                                    );
                                    await _decodeAddress(
                                      Location(
                                        lat: position.latitude,
                                        lng: position.longitude,
                                      ),
                                    );
                                    setState(() {});
                                  }
                                },
                                child: Icon(
                                  Icons.my_location,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (!widget.hideBottomCard)
                  Card(
                    margin: widget.bottomCardMargin,
                    shape: widget.bottomCardShape,
                    color: widget.bottomCardColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(_address),
                          trailing: IconButton(
                            tooltip: widget.bottomCardTooltip,
                            icon: widget.bottomCardIcon,
                            onPressed: () async {
                              widget.onNext?.call(_geocodingResult);
                              if (widget.popOnNextButtonTaped) {
                                Navigator.pop(context, _geocodingResult);
                              }
                            },
                          ),
                        ),
                        if (!widget.hideMoreOptions &&
                            _geocodingResultList.isNotEmpty)
                          GestureDetector(
                            onTap: () {
                              showDialog<AlertDialog>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(widget.dialogTitle),
                                  scrollable: true,
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children:
                                        _geocodingResultList.map((element) {
                                      return ListTile(
                                        title: Text(
                                          element.formattedAddress ?? '',
                                        ),
                                        onTap: () {
                                          _address =
                                              element.formattedAddress ?? '';
                                          _geocodingResult = element;
                                          setState(() {});
                                          Navigator.pop(context, element);
                                        },
                                      );
                                    }).toList(),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Chip(
                              label: Text(
                                'Tap to show ${_geocodingResultList.length - 1} more result options',
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Camera position moved to location
  CameraPosition cameraPosition() {
    /*
    return CameraPosition(
      target: _initialPosition,
      zoom: _zoom,
    );*/
    return CameraPosition(
      target: LatLng(
        _initialPosition.latitude,
        _initialPosition.longitude,
      ),
      zoom: _zoom,
    );
  }

  @override
  void initState() {
    _initialPosition = widget.currentLatLng ?? _initialPosition;
    _mapType = widget.mapType;
    _searchController = widget.searchController ?? _searchController;
    if (widget.currentLatLng != null) {
      _decodeAddress(
        Location(
          lat: _initialPosition.latitude,
          lng: _initialPosition.longitude,
        ),
      );
    }
    super.initState();
  }

  /// Decode address from latitude & longitude
  Future<void> _decodeAddress(Location location) async {
    try {
      final geocoding = GoogleMapsGeocoding(
        apiKey: widget.apiKey,
        baseUrl: widget.geoCodingBaseUrl,
        apiHeaders: widget.geoCodingApiHeaders,
        httpClient: widget.geoCodingHttpClient,
      );
      final response = await geocoding.searchByLocation(
        location,
        language: widget.language,
        locationType: widget.locationType,
        resultType: widget.resultType,
      );

      /// When get any error from the API, show the error in the console.
      if (response.hasNoResults ||
          response.isDenied ||
          response.isInvalid ||
          response.isNotFound ||
          response.unknownError ||
          response.isOverQueryLimit) {
        log('${response.errorMessage}');
        _address = response.status;
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                response.errorMessage ??
                    'Address not found, something went wrong!',
              ),
            ),
          );
        }
        return;
      }
      _address = response.results.first.formattedAddress ?? '';
      _geocodingResult = response.results.first;
      widget.onDecodeAddress?.call(_geocodingResult);
      if (response.results.length > 1) {
        _geocodingResultList = response.results;
      }
      setState(() {});
    } catch (e) {
      log('$e');
    }
  }
}
