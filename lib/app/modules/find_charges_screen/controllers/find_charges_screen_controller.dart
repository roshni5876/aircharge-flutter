import 'package:aircharge/app/data/models/list_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindChargesScreenController extends GetxController
    with GetTickerProviderStateMixin {
  @override
  void onInit() {
    super.onInit();
    update(["details"]);
    charges;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    update(["visiblePage"]);
    reportAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    update(["reportPage"]);
    update(["mapViewVisiblePage"]);
  }

  @override
  void dispose() {
    animationController.dispose();
    reportAnimationController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController textarea = TextEditingController();

  /// For Details Screens
  RxBool isOpened = false.obs;

  late final AnimationController animationController;

  final _isVisible = true.obs;
  bool get isVisible => _isVisible.value;
  set isVisible(bool value) => _isVisible.value = value;

  ///For Report Screen
  RxBool isOpenedReport = false.obs;

  late final AnimationController reportAnimationController;

  final _isVisibleReport = true.obs;
  bool get isVisibleReport => _isVisibleReport.value;
  set isVisibleReport(bool value) => _isVisibleReport.value = value;

  ///For Map View

  final _isMapViewVisible = true.obs;
  bool get isMapViewVisible => _isMapViewVisible.value;
  set isMapViewVisible(bool value) => _isMapViewVisible.value = value;

  GoogleMapController? googleMapController;

  final _isVisibleMapView = false.obs;
  bool get isVisibleMapView => _isVisibleMapView.value;
  set isVisibleMapView(bool value) => _isVisibleMapView.value = value;

  final _drowerIndex = 0.obs;
  int get drowerIndex => _drowerIndex.value;
  set drowerIndex(int value) => _drowerIndex.value = value;
}
