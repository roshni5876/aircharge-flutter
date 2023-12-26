import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/data/models/list_map.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {

  @override
  void onInit() {
    super.onInit();
    update(["dot"]);
    update(["page"]);
    offers;
    update(["visiblePage"]);
  }

  /// CarouselSlider
  var currentPage = 0.obs;

  void onPageChanged(int index, CarouselPageChangedReason changeReason) {
    currentPage.value = index;
  }

  final List<String> itemsDemo = [
    "assets/images/cofee.png",
    "assets/images/jam.png",
    "assets/images/starbucksposter.png",
    "assets/images/pizzaposter.png"
  ];
  RxBool isOpen = false.obs;
  Widget buildDotIndicator(int currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemsDemo.length, (index) {
        return Container(
          width: 12.0,
          height: 12.0,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? AppColors.black : AppColors.grey,
          ),
        );
      }),
    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }


   var isVisible = true.obs;

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }
}
