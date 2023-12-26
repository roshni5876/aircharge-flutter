// ignore_for_file: deprecated_member_use

import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/modules/home/controllers/home_controller.dart';
import 'package:aircharge/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/colors.dart';

class OfferDetails extends GetView<HomeController> {
  const OfferDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Card(
        elevation: 10.0,
        color: AppColors.white,
        margin: EdgeInsets.only(
          bottom: Get.height * 0.108,
          left: 8,
          right: 8,
          top: 2,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: Get.height * 0.60,
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          // controller.toggleVisibility();
                          Get.back();
                          // Get.toNamed(Routes.HOME);
                        },
                        child: Container(
                          color: Colors.transparent,
                          width: 20.w,
                          height: 24.h,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 18.sp,
                            color: AppColors.icongrey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16.sp,
                      ),
                      const CircleAvatar(
                        maxRadius: 20,
                        backgroundImage: AssetImage(
                          "assets/images/starbuckslogo.png",
                        ),
                      ),
                      SizedBox(
                        width: 60.w,
                      ),
                      Text(
                        "Starbucks",
                        style: Styles.metaBold(
                          color: AppColors.black,
                          size: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image:
                                AssetImage("assets/images/starbucksposter.png"),
                            fit: BoxFit.fill)),
                    height: Get.height / 3.2,
                    width: Get.width,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "Earn rewards in the starbucks loyalty app",
                    style: Styles.metaBold(
                      color: AppColors.black,
                      size: 18.sp,
                    ),
                    maxLines: 2,
                  ),
                  Text(
                    "Expanded offer information",
                    style: Styles.metaRegular(
                      color: AppColors.black,
                      size: 16.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Offer ends: dd/mm/yyyy",
                    style: Styles.metaRegular(
                      color: AppColors.black,
                      size: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  PrimaryButton(
                    onPressed: () {},
                    height: 60.sp,
                    width: Get.width,
                    color: AppColors.darkGreen,
                    child: Text(
                      "Redeem",
                      style: Styles.metaRegular(
                        color: AppColors.white,
                        size: 24.sp,
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
