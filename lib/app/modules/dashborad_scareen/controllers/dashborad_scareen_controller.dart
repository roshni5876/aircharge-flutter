import 'package:aircharge/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aircharge/app/modules/find_charges_screen/views/find_charges_screen_view.dart';
import 'package:aircharge/app/modules/home/views/home_view.dart';
import 'package:aircharge/app/modules/setting_screen/views/setting_screen_view.dart';

class DashboradScareenController extends GetxController
    with GetTickerProviderStateMixin {

 @override
  void onInit() {
    selectedTab = 1;
    super.onInit();
  }

  final _selectedTab = 1.obs;
  int get selectedTab => _selectedTab.value;
  set selectedTab(int value) => _selectedTab.value = value;

  int currentIndex = 1;
  
  Widget currentScreen = const FindChargesScreenView();

  navigateToScreen(int index) {
    AnimationController controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.easeOut);
    Tween<Offset> offsetTween =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);
    Animation<Offset> positionAnimation = offsetTween.animate(curve);

    SlideTransition transition = SlideTransition(
      position: positionAnimation,
      child: _buildScreen(index),
    );

    currentIndex = index;
    currentScreen = transition;
    update(["screen"]);
    controller.forward();
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return const HomeView();

      case 1:
        return const FindChargesScreenView();
      case 2:
        return const SettingScreenView();
      default:
        return const HomeView();
    }
  }

  void selectPage(int index) {
    selectedTab = index;
    update(["screen"]);
  }
}
