import 'package:get/get.dart';

class SettingScreenController extends GetxController {

   var lowPowerNotifications = true.obs;

  var disableNotification = false.obs;
  var allowPowerMonitoring = true.obs;

  var allowloctiontracking = false.obs;

  var customeAlertRadiusSlider = 0.0.obs;
  var batteryPercentageAlerSlider = 0.0.obs;
}
