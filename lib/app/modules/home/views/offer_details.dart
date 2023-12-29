// ignore_for_file: deprecated_member_use

import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/colors.dart';

class OfferDetails extends GetView<HomeController> {
  const OfferDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          child: Container(
            height: Get.height * 0.60.h,
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18.sp,
                        color: AppColors.iconGreyColor,
                      ),
                    ),
                    SizedBox(
                      width: 16.sp,
                    ),
                    CircleAvatar(
                      maxRadius: 20.sp,
                      backgroundImage: const AssetImage(
                        "assets/images/starbuckslogo.png",
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    Text(
                      "Starbucks",
                      style: Styles.interBold(
                        color: AppColors.blackGrey,
                        size: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      image: const DecorationImage(
                          image:
                              AssetImage("assets/images/starbucksposter.png"),
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
                const Spacer(),
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
                  height: 56.sp,
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
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
