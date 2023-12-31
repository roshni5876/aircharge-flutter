// ignore_for_file: deprecated_member_use

import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/data/models/list_map.dart';
import 'package:aircharge/app/modules/home/views/offer_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        endDrawerEnableOpenDragGesture: false,
        drawerEnableOpenDragGesture: false,
        drawerEdgeDragWidth: 0,
        key: controller.scaffoldKeyDrawerKey,
        backgroundColor: AppColors.white,
        drawerScrimColor: Colors.transparent,
        body: const ContentWidget(),
      ),
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
                    visible: controller.isVisible,
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
                            enlargeCenterPage: true,
                            onPageChanged: controller.onPageChanged,
                            viewportFraction: 1.0,
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
                                      print(controller.isVisible);
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
                                      print(controller.isOpened.value);
                                      // Scaffold.of(context).openEndDrawer();
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
            duration: Duration(milliseconds: 300),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.sp),
              ),
              // shadowColor: AppColors.iconGreyColor,
              borderOnForeground: false,
              elevation: 14.0,
              color: AppColors.white,
              margin: EdgeInsets.only(
                bottom: Get.height * 0.118.h,
                left: 12.w,
                right: 12.w,
                top: 1.h,
              ),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: AppColors.iconGreyColor, offset: Offset(0, 0)),
                  ],
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                // height: Get.height,
                // width: Get.width,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: GetBuilder<HomeController>(
                                  id: "visiblePage",
                                  builder: (cont) => GestureDetector(
                                        onTap: () {
                                          controller.isVisible = true;
                                          controller.isOpened.value = false;
                                          controller.animationController
                                              .reverse();
                                          controller.update(["visiblePage"]);
                                        },
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Icon(
                                            Icons.arrow_back_ios_new,
                                            size: 18.sp,
                                            color: AppColors.iconGreyColor,
                                          ),
                                        ),
                                      )),
                            ),
                            Expanded(
                              flex: 2,
                              child: CircleAvatar(
                                // backgroundImage: const AssetImage(
                                //   "assets/images/starbuckslogo.png",
                                child: Image.asset(
                                  "assets/images/starbuckslogo.png",
                                  width: 40.w,
                                  height: 40.h,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Center(
                                child: Text(
                                  "Starbucks",
                                  style: Styles.interBold(
                                    color: AppColors.blackGrey,
                                    size: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: 6.w,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/particuleroffer.png"),
                                  fit: BoxFit.fill)),
                          height: Get.height / 4.2.h,
                          width: Get.width,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "Earn rewards in the starbucks loyalty app",
                          style: Styles.interBold(
                            color: AppColors.blackText,
                            size: 14.sp,
                          ),
                          maxLines: 2,
                        ),
                        Text(
                          "Expanded offer information",
                          style: Styles.interRegular(
                            color: AppColors.black,
                            size: 12.sp,
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 3.8.h,
                        ),
                        Text(
                          "Offer ends: dd/mm/yyyy",
                          style: Styles.interRegular(
                            color: AppColors.black,
                            size: 12.sp,
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        PrimaryButton(
                          onPressed: () {},
                          height: 56.h,
                          width: Get.width,
                          color: AppColors.darkGreen,
                          child: Text(
                            "Redeem",
                            style: Styles.interRegular(
                              color: AppColors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
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
