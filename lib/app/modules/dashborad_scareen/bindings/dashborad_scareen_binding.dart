import 'package:aircharge/app/modules/find_charges_screen/controllers/find_charges_screen_controller.dart';
import 'package:aircharge/app/modules/home/controllers/home_controller.dart';
import 'package:aircharge/app/modules/splash_scareen/controllers/splash_scareen_controller.dart';
import 'package:get/get.dart';

import '../controllers/dashborad_scareen_controller.dart';

class DashboradScareenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboradScareenController>(
      () => DashboradScareenController(),
    );
    Get.put(
      HomeController(),
    );
    Get.put(SplashScareenController());
    Get.put(FindChargesScreenController());
  }
}
