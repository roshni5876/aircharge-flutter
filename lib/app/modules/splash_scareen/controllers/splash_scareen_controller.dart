import 'dart:async';

import 'package:aircharge/app/modules/dashborad_scareen/views/dashborad_scareen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScareenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Text offset animation controller
  late final AnimationController textController;

  // Reactive variable for text offset
  var textOffset = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    textController = AnimationController(
      duration: const Duration(milliseconds: 470),
      vsync: this,
    );

    _startTextAnimation();
    Timer(const Duration(seconds: 2), () {
      Get.offAll(
        const DashboradScareenView(),
      );
    });
  }

  void _startTextAnimation() {
    textController.forward();

    textController.addListener(() {
      textOffset.value = Tween<double>(
        begin: 300.0,
        end: 10.0,
      ).animate(textController).value;
    });
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
