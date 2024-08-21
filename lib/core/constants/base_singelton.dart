import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

abstract mixin class BaseSingleton {
  AppConstants get constants => AppConstants.instance;
  WidgetsBinding get widgetsBinding => WidgetsBinding.instance;
}
