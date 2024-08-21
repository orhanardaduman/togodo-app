import 'dart:ui';

import 'package:latlong2/latlong.dart';

class AbilityModel {
  AbilityModel({
    this.id,
    this.location,
    this.isCurrent,
    this.iconPath,
    this.onTap,
  });
  String? id;
  String? iconPath;
  LatLng? location;
  VoidCallback? onTap;
  bool? isCurrent = false;
}
