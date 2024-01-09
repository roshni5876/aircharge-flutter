import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/data/models/list_map.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  @override
  void onInit() {
    super.onInit();
    update(["dot"]);
    offers;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animationControllerMultipleOffers = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    update(["visiblePage"]);
  }

  @override
  void dispose() {
    animationController.dispose();
    animationControllerMultipleOffers.dispose();
    super.dispose();
  }

  ///Call DashbordScreen
  void homeResetState() {
    isVisibleOfferScreen = true;
    isOpenedOfferScreen.value = false;
    isVisibleMultipleOffers = true;
    isOpenedMultipleOffers.value = false;
    update(["visiblePage"]);
  }

  /// CarouselSlider
  var currentPage = 0.obs;

  void onPageChanged(int index, CarouselPageChangedReason changeReason) {
    currentPage.value = index;
  }

  final List<String> itemsDemo = [
    "assets/images/offer-ceresole.png",
    "assets/images/offer-ceresole.png",
    "assets/images/offer-ceresole.png"
  ];
  RxBool isOpen = false.obs;
  Widget buildDotIndicator(int currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemsDemo.length, (index) {
        return Container(
          width: 10.0.w,
          height: 10.0.h,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? AppColors.black : AppColors.grey,
          ),
        );
      }),
    );
  }

  ///Offers
  final _isVisibleOfferScreen = true.obs;
  bool get isVisibleOfferScreen => _isVisibleOfferScreen.value;
  set isVisibleOfferScreen(bool value) => _isVisibleOfferScreen.value = value;

  RxBool isOpenedOfferScreen = false.obs;

  late final AnimationController animationController;

  ///Multiple Offers
  final _isVisibleMultipleOffers = true.obs;
  bool get isVisibleMultipleOffers => _isVisibleMultipleOffers.value;
  set isVisibleMultipleOffers(bool value) =>
      _isVisibleMultipleOffers.value = value;

  late final AnimationController animationControllerMultipleOffers;

  RxBool isOpenedMultipleOffers = false.obs;
}
