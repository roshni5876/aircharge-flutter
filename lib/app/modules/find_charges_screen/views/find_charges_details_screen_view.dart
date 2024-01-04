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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.sp),
      ),
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
            BoxShadow(color: AppColors.iconGreyColor, offset: Offset(0, 0)),
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GetBuilder<FindChargesScreenController>(
                        id: "visiblePage",
                        builder: (cont) => GestureDetector(
                          onTap: () {
                            controller.isVisible = true;
                            controller.isOpened.value = false;
                            controller.animationController.reverse();
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
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CircleAvatar(
                        child: Image.asset(
                          "assets/images/starbuckslogo.png",
                          width: 40.w,
                          height: 40.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Text(
                        "Starbucks",
                      
                        style: Styles.interBold(
                          color: AppColors.blackGrey,
                          size: 16.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GetBuilder<FindChargesScreenController>(
                        id: "reportPage",
                        builder: (cont) => GestureDetector(
                          onTap: () {
                            controller.isVisibleReport = false;
                            controller.isOpenedReport.value = true;
                            controller.reportAnimationController.forward();
                            controller.update(["reportPage"]);
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
                              ),
                            ],
                          ),
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
                          image: AssetImage("assets/images/findcharges.png"),
                          fit: BoxFit.fill)),
                  height: Get.height / 4.2.h,
                  width: Get.width,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Starbucks",
                        style: Styles.interBold(
                          color: AppColors.blackText,
                          size: 15.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Temporarily Closed",
                          style: Styles.interBold(
                            color: AppColors.red,
                            size: 11.sp,
                          ),
                        ),
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
                    Expanded(
                      child: Text(
                        "150 Russell sq,\nSouthamton Row London,\nWC1B 5AL, 2.4 miles",
                        style: Styles.interLight(
                          color: AppColors.offerDetailsAddresTextGrey,
                          size: 13.sp,
                        ),
                        maxLines: 4,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height / 20.h,
                ),
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
                SizedBox(
                  height: Get.height / 20.h,
                ),
                PrimaryButton(
                  onPressed: () {},
                  height: 56.h,
                  width: Get.width,
                  color: AppColors.whiteStarRatingColor,
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.discount,
                              color: AppColors.seeOfferBtnColor,
                              size: 24.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              " See Offers",
                              style: Styles.interRegular(
                                color: AppColors.seeOfferBtnColor,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            EvaIcons.navigation2,
                            color: AppColors.blackText,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            " Navigate",
                            style: Styles.interRegular(
                              color: AppColors.blackText,
                              size: 20.sp,
                            ),
                          ),
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
    );
  }
}
