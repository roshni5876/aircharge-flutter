import 'package:aircharge/app/data/models/list_map.dart';
import 'package:aircharge/app/modules/find_charges_screen/views/find_charges_details_screen_view.dart';
import 'package:aircharge/app/modules/find_charges_screen/views/report.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindChargesScreenController extends GetxController
    with GetTickerProviderStateMixin {
  @override

  void onInit() {
    super.onInit();
    update(["details"]);
    charges;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    animation = Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0),)
        .animate(controller!);
    
  }

  void toggleDrawer() {
    if (controller!.isDismissed) {
      controller!.forward();
    } else {
      controller!.reverse();
    }
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController textarea = TextEditingController();

  late AnimationController? controller;
  Animation<Offset>? animation;

  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  void dispose() {
    controller!.dispose(); 
    super.dispose();
  }

  final _isMapViewVisible = false.obs;
  bool get isMapViewVisible => _isMapViewVisible.value;
  set isMapViewVisible(bool value) => _isMapViewVisible.value = value;

  final _drowerIndex = 0.obs;
  int get drowerIndex => _drowerIndex.value;
  set drowerIndex(int value) => _drowerIndex.value = value;

  Widget drowerScreen() {
    switch (drowerIndex) {
      case 1:
        return const ReportView();

      default:
        return const FindChargesDetailsScreen();
    }
  }

  void selectPage(int index) {
    drowerIndex = index;
    update(["screen"]);
  }
}
