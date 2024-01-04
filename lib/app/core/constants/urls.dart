import 'package:aircharge/app/core/constants/enums.dart';
import 'package:aircharge/app/core/service/env_service.dart';

class URLs {
  static String get base {
    final environment = EnvServices.environment;
    switch (environment) {
      case Environment.dev:
        return 'https://webpristine.com/Aircharge/api/';
      case Environment.stage:
        return 'https://webpristine.com/Aircharge/api/';
      case Environment.production:
        return 'https://webpristine.com/Aircharge/api/';
    }
  }

  // static String initateURL = "https://webpristine.com/Aircharge/api/";
}

abstract class ApiEndPoints {
  static const String findChargesLoctionsList = "locations/30.710489/76.852386/0/2/";
}
