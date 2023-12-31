// ignore_for_file: must_be_immutable

import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/modules/find_charges_screen/controllers/find_charges_screen_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FindChargesDetailsScreen extends GetView<FindChargesScreenController> {
  const FindChargesDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return
     GetBuilder<FindChargesScreenController>(
      id: "visiblePage",
      builder: (cont) => AnimatedPositioned(
        curve: Curves.easeInOut,
        top: 0,
        bottom: 0,
        right: 2,
        left: controller.isOpened.value ? 2 : Get.width,
        duration: Duration(milliseconds: 300),
   child:   Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.sp),
      ),
      shadowColor: AppColors.iconGreyColor,
      borderOnForeground: false,
      elevation: 14.0,
      color: AppColors.white,
      margin: EdgeInsets.only(
        bottom: Get.height * 0.112.h,
        left: 12.w,
        right: 12.w,
        top: 1.h,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: AppColors.iconGreyColor, offset: Offset(0, 0)),
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.sp),
        ),
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Container(
            height: Get.height * 0.60.h,
            color: AppColors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).closeEndDrawer();
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.sp,
                        color: AppColors.iconGreyColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 10),
                      child: CircleAvatar(
                        maxRadius: 18.sp,
                        backgroundImage: const AssetImage(
                          "assets/images/starbuckslogo.png",
                        ),
                      ),
                    ),
                    Text(
                      "Starbucks",
                      style: Styles.interRegular(
                        color: AppColors.blackGrey,
                        size: 16.sp,
                      ),
                    ),
                    SizedBox(width: Get.width / 3.w),
                    GetBuilder<FindChargesScreenController>(
                      id: "screen",
                      builder: (cont) => InkWell(
                        onTap: () {
                          // controller.toggleAnimation();
                          // controller.selectPage(1);
                          // Scaffold.of(context).openEndDrawer();
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.report_gmailerrorred,
                              size: 20.sp,
                              color: AppColors.red,
                            ),
                            Text(
                              'report',
                              style: Styles.interRegular(
                                color: AppColors.red,
                                size: 12.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0.sp),
                      image: const DecorationImage(
                          image:
                              AssetImage("assets/images/starbucksposter.png"),
                          fit: BoxFit.fill)),
                  height: Get.height / 4.2.h,
                  width: Get.width,
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Starbucks",
                      style: Styles.interBold(
                        color: AppColors.blackText,
                        size: 15.sp,
                      ),
                    ),
                    Text(
                      "Temporarily Closed",
                      style: Styles.interBold(
                        color: AppColors.red,
                        size: 11.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "150 Russell sq,\nSouthamton Row London,\nWC1B 5AL, 2.4 miles",
                      style: Styles.interLight(
                        color: AppColors.offerDetailsAddresTextGrey,
                        size: 13.sp,
                      ),
                      maxLines: 4,
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Text(
                    "Google Review Score",
                    style: Styles.interRegular(
                      color: AppColors.blackText,
                      size: 14.sp,
                    ),
                    maxLines: 4,
                  ),
                ),
                Center(
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      size: 18.sp,
                      color: AppColors.yellowStarRatingColor,
                    ),
                    onRatingUpdate: (rating) {},
                    unratedColor: AppColors.whiteStarRatingColor,
                  ),
                ),
                const Spacer(),
                PrimaryButton(
                  onPressed: () {},
                  height: 56.h,
                  width: Get.width,
                  color: AppColors.whiteStarRatingColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.discount,
                        color: AppColors.seeOfferBtnColor,
                        size: 24.sp,
                      ),
                      Text(
                        " See Offers",
                        style: Styles.interRegular(
                          color: AppColors.seeOfferBtnColor,
                          size: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                PrimaryButton(
                  onPressed: () {},
                  height: 56.h,
                  width: Get.width,
                  color: AppColors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        EvaIcons.navigation2,
                        color: AppColors.blackText,
                        size: 20.sp,
                      ),
                      Text(
                        " Navigate",
                        style: Styles.interRegular(
                          color: AppColors.blackText,
                          size: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
 
 
 )); }

}
