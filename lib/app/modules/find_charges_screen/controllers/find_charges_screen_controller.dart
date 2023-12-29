import 'package:aircharge/app/data/models/list_map.dart';
import 'package:aircharge/app/modules/find_charges_screen/views/find_charges_details_screen_view.dart';
import 'package:aircharge/app/modules/find_charges_screen/views/report.dart';
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
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  toggleAnimation() {
    animationController.isDismissed
        ? animationController.forward()
        : animationController.reverse();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController textarea = TextEditingController();

  double rightValue = 0;

  late AnimationController animationController;

  final rightSlide = Get.width * 0.6;
 
  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
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



  ///Google Map

 RxSet<Marker> markers = <Marker>{}.obs;

  void addMarker(double lat, double lng, String markerId) {
    markers.add(
      Marker(
        markerId: MarkerId(markerId),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: 'Marker $markerId'),
      ),
    );
  }
}
