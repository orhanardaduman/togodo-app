import 'dart:ui';

import 'package:latlong2/latlong.dart';

class AbilityModel {
  AbilityModel({
    this.id,
    this.location,
    this.isCurrent,
    this.iconPath,
    this.onTap,
    this.tag,
  });
  String? id;
  String? iconPath;
  LatLng? location;
  String? tag;
  VoidCallback? onTap;
  bool? isCurrent = false;
}
