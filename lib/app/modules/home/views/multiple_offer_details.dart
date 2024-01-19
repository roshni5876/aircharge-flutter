import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MultipleOffers extends GetView<HomeController> {
  const MultipleOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      borderOnForeground: false,
      color: AppColors.white,
      margin: EdgeInsets.only(
        bottom: Get.height * 0.126.h,
        left: 12.w,
        right: 12.w,
        top: 1.h,
      ),
      child: GestureDetector(
        onTap: () {
          controller.isVisibleOfferScreen = false;
          controller.isOpenedOfferScreen.value =
              !controller.isOpenedOfferScreen.value;
          if (controller.isOpenedOfferScreen.value) {
            controller.animationController.forward();
          } else {
            controller.animationController.reverse();
          }
          controller.update([
            "visiblePage",
          ]);
        },
        child: Container(
          height: Get.height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.1),
                spreadRadius: -2.26,
                blurRadius: 1.0,
                offset: const Offset(-4.0, -2.0),
              ),
              BoxShadow(
                color: AppColors.grey.withOpacity(0.1),
                blurRadius: 1.0,
                spreadRadius: -2.26,
                offset: const Offset(5.0, 1.0),
              ),
            ],
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            controller.isVisibleMultipleOffers = true;
                            controller.isOpenedMultipleOffers.value =
                                false;
                            controller.animationControllerMultipleOffers
                                .reverse();
                            controller.update(["visiblePage"]);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 18.sp,
                              color: AppColors.iconGreyColor,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 20.sp,
                            child: SvgPicture.asset(
                              'assets/images/od_logo_costa.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Center(
                          child: Text(
                            "Costa Coffee",
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
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        "Offers",
                        style: Styles.interRegular(
                          color: AppColors.black,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2.sp,
                    child: Container(
                      height: 90.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.sp,
                        ),
                        color: AppColors.white,
                      ),
                      padding: EdgeInsets.all(4.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/images/firstoffer.png"),
                                  ),
                                  borderRadius: BorderRadius.circular(8.sp)),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: 4.w, right: 8.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Exclusive Festive Menu in \nCosta Club App",
                                      style: Styles.interBold(
                                        color: AppColors.blackText,
                                        size: 12.sp,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "McDonald's Monopoly is back! \nPeel. Play. Win?",
                                      style: Styles.interRegular(
                                        color: AppColors.black,
                                        size: 11.sp,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "offer ends: dd/mm/yyyy",
                                      style: Styles.interRegular(
                                        color: AppColors.black,
                                        size: 9.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2.sp,
                    child: Container(
                      height: 90.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.sp,
                        ),
                        color: AppColors.white,
                      ),
                      padding: EdgeInsets.all(4.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/images/starbucksposter.png"),
                                  ),
                                  borderRadius: BorderRadius.circular(8.sp)),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: 4.w, right: 8.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Free cake on your birthday",
                                      style: Styles.interBold(
                                        color: AppColors.blackText,
                                        size: 12.sp,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Celebrate your birthday with\n cake for free.",
                                      style: Styles.interRegular(
                                        color: AppColors.black,
                                        size: 11.sp,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Expanded(flex: 1, child: SizedBox()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2.sp,
                    child: Container(
                      height: 90.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.sp,
                        ),
                        color: AppColors.white,
                      ),
                      padding: EdgeInsets.all(4.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/images/firstoffer.png"),
                                  ),
                                  borderRadius: BorderRadius.circular(8.sp)),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: 4.w, right: 8.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Get your free drnk faster",
                                      style: Styles.interBold(
                                        color: AppColors.blackText,
                                        size: 12.sp,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "Buy 5 drinks to get 1 free.",
                                      style: Styles.interRegular(
                                        color: AppColors.black,
                                        size: 11.sp,
                                      ),
                                    ),
                                  ),
                                  const Expanded(flex: 1, child: SizedBox()),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
