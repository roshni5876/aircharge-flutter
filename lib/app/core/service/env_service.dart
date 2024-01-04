
import 'package:aircharge/app/core/constants/enums.dart';

class EnvServices {
  static bool isProduction = false;
  static Environment environment =
      isProduction ? Environment.production : Environment.stage;

  static Environment getEnvironmentFromString(String env) {
    if (env == 'dev') {
      return Environment.dev;
    } else if (env == 'stage') {
      return Environment.stage;
    } else if (env == 'production') {
      return Environment.production;
    } else {
      // Default
      return Environment.dev;
    }
  }
}
