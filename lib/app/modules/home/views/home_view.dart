// ignore_for_file: deprecated_member_use

import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/data/models/list_map.dart';
import 'package:aircharge/app/modules/home/views/offer_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      HomeController(),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      body: WillPopScope(
          onWillPop: () async {
            if (controller.isVisible || controller.isVisibleMultipleOffers) {
              controller.isVisible = false;
              controller.isVisibleMultipleOffers = false;
              controller.isOpened.value = false;
              controller.isOpenedMultipleOffers.value = false;

              controller.update(["visiblePage"]);

              return false;
            } else {
              return true;
            }
          },
          child: const ContentWidget()),
    );
  }
}

class ContentWidget extends GetView<HomeController> {
  const ContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 6.sp,
            ),
            Text(
              'Browse Nearby Offers',
              style: Styles.interBold(
                color: AppColors.blackText,
                size: 14.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 2.sp),
              child: Text(
                "All locations shown in the list below, have wireless chargers installed on the premises.",
                textAlign: TextAlign.center,
                style: Styles.interRegular(
                  color: AppColors.grey,
                  size: 10.sp,
                ),
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Container(
                color: AppColors.bgGreyColor,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0.sp,
                ),
                child: Obx(
                  () => Visibility(
                    visible: controller.isVisible &&
                        controller.isVisibleMultipleOffers,
                    replacement: SizedBox(
                      height: Get.height,
                      width: Get.width,
                    ),
                    child: ListView(
                      physics: const SlowScrollPhysics(),
                      padding: EdgeInsets.only(top: 0, bottom: 72.sp),
                      children: [
                        CarouselSlider.builder(
                          itemCount: controller.itemsDemo.length,
                          options: CarouselOptions(
                            aspectRatio: 2.3,
                            onPageChanged: controller.onPageChanged,
                            viewportFraction: 1.0,
                            autoPlay: true,
                          ),
                          itemBuilder: (context, index, realIdx) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0.sp, vertical: 6.0.sp),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.sp),
                                child: Image.asset(
                                  controller.itemsDemo[index],
                                  fit: BoxFit.cover,
                                  width: Get.width,
                                ),
                              ),
                            );
                          },
                        ),
                        Obx(() => controller
                            .buildDotIndicator(controller.currentPage.value)),
                        ListView.builder(
                            padding: EdgeInsets.only(
                                top: 3.sp, left: 4.w, right: 4.w),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: offers.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: GetBuilder<HomeController>(
                                  id: "visiblePage",
                                  builder: (cont) => InkWell(
                                    onTap: () {
                                      if (index.isEven) {
                                        controller.isVisible = false;

                                        controller.isOpened.value =
                                            !controller.isOpened.value;
                                        if (controller.isOpened.value) {
                                          controller.animationController
                                              .forward();
                                        } else {
                                          controller.animationController
                                              .reverse();
                                        }
                                        controller.update(["visiblePage"]);
                                      } else {
                                        controller.isVisibleMultipleOffers =
                                            false;

                                        controller
                                                .isOpenedMultipleOffers.value =
                                            !controller
                                                .isOpenedMultipleOffers.value;
                                        if (controller
                                            .isOpenedMultipleOffers.value) {
                                          controller
                                              .animationControllerMultipleOffers
                                              .forward();
                                        } else {
                                          controller
                                              .animationControllerMultipleOffers
                                              .reverse();
                                        }
                                        controller.update(["visiblePage"]);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8.0.sp,
                                          ),
                                          color: AppColors.white),
                                      width: Get.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(8.0.sp),
                                                    topRight: Radius.circular(
                                                        8.0.sp)),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "${offers[index]['image']}"),
                                                    fit: BoxFit.fill)),
                                            height: 160.h,
                                            width: Get.width,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w,
                                                bottom: 14.h,
                                                top: 2.h),
                                            child: Text(
                                              "${offers[index]['title']}",
                                              style: Styles.interBold(
                                                color: AppColors.black,
                                                size: 12.sp,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w, bottom: 14.h),
                                            child: Text(
                                              "${offers[index]['subtitle']}",
                                              style: Styles.interRegular(
                                                color: AppColors.black,
                                                size: 12.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        GetBuilder<HomeController>(
          id: "visiblePage",
          builder: (cont) => AnimatedPositioned(
              curve: Curves.easeInOut,
              top: 0,
              bottom: 0,
              right: 2,
              left: controller.isOpened.value ? 2 : Get.width,
              duration: const Duration(milliseconds: 300),
              child: const OfferDetails()),
        ),
        GetBuilder<HomeController>(
          id: "visiblePage",
          builder: (cont) => AnimatedPositioned(
              curve: Curves.easeInOut,
              top: 0,
              bottom: 0,
              right: 2,
              left: controller.isOpenedMultipleOffers.value ? 2 : Get.width,
              duration: const Duration(milliseconds: 300),
              child: const MultipleOffers()),
        ),
      ],
    );
  }
}

class SlowScrollPhysics extends ScrollPhysics {
  const SlowScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SlowScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // Adjust the scroll offset to slow down the scrolling
    return super.applyPhysicsToUserOffset(position, offset * 0.9);
  }
}
