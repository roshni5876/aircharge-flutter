import 'package:aircharge/app/data/models/list_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindChargesScreenController extends GetxController {
  //TODO: Implement FindChargesScreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    charges;
  }

   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }
  final _isMapViewVisible = false.obs;
  bool get isMapViewVisible => _isMapViewVisible.value;
  set isMapViewVisible(bool value) => _isMapViewVisible.value = value;
}
