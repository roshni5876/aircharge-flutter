import 'dart:async';

import 'package:aircharge/app/modules/dashborad_scareen/views/dashborad_scareen_view.dart';
import 'package:get/get.dart';

class SplashScareenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 5), () {
      Get.offAll(
        // HomeView(),
        const DashboradScareenView(),
      );
    });
  }
}
