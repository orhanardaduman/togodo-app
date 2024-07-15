import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor { development, production }

@immutable
class Constants {
  const Constants._({
    required this.endpoint,
    required this.apiKey,
  });

  factory Constants.of() {
/*     final flavor = EnumToString.fromString(
      Flavor.values,
      const String.fromEnvironment('FLAVOR'),
    ); */
    return Constants._prd();
    /* switch (flavor) {
      case Flavor.development:
        return Constants._prd();
      case Flavor.production:
      // ignore: no_default_cases
      default:
        return Constants._prd();
    } */
  }

/*   factory Constants._dev() {
    return Constants._(
      endpoint: 'https://${dotenv.env['BASE_URL'] ?? ''}/api/',
      apiKey: '98c8df982b8b4da8b86cd70e851fc521',
    );
  } */

  factory Constants._prd() {
    return Constants._(
      endpoint: 'https://${dotenv.env['BASE_URL'] ?? ''}/',
      apiKey: '',
    );
  }

  static final Constants instance = Constants.of();

  final String endpoint;
  final String apiKey;
}
