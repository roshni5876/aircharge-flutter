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
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Card(
        elevation: 10.0,
        color: AppColors.white,
        margin: EdgeInsets.only(
            bottom: Get.height * 0.108.h, left: 8.w, right: 8.w, top: 2.h),
        child: Container(
          decoration: BoxDecoration(
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
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Scaffold.of(context).closeEndDrawer();
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 18.sp,
                          color: AppColors.icongrey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.w, right: 10),
                        child: CircleAvatar(
                          maxRadius: 20.h,
                          // ignore: prefer_const_constructors
                          backgroundImage: AssetImage(
                            "assets/images/starbuckslogo.png",
                          ),
                        ),
                      ),
                      Text(
                        "Starbucks",
                        style: Styles.metaRegular(
                          color: AppColors.black,
                          size: 18.sp,
                        ),
                      ),
                      SizedBox(width: Get.width / 4.w),
                      GetBuilder<FindChargesScreenController>(
                        id: "screen",
                        builder: (cont) => InkWell(
                          onTap: () {
                            controller.toggleAnimation();
                            controller.selectPage(1);
                            Scaffold.of(context).openEndDrawer();
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
                                style: Styles.metaRegular(
                                  color: AppColors.red,
                                  size: 14.sp,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image:
                                AssetImage("assets/images/starbucksposter.png"),
                            fit: BoxFit.fill)),
                    height: Get.height / 3.6,
                    width: Get.width,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Starbucks",
                        style: Styles.metaBold(
                          color: AppColors.black,
                          size: 18.sp,
                        ),
                      ),
                      Text(
                        "Temporarily Closed",
                        style: Styles.metaBold(
                          color: AppColors.red,
                          size: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "150 Russell sq, Southamton Row London,WC1B 5AL, 2.4 miles",
                    style: Styles.metaRegular(
                      color: AppColors.icongrey,
                      size: 16.sp,
                    ),
                    maxLines: 4,
                  ),
                  const Spacer(),
                  Center(
                    child: Text(
                      "Google Review Score",
                      style: Styles.metaRegular(
                        color: AppColors.icongrey,
                        size: 16.sp,
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
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    onPressed: () {},
                    height: 74.h,
                    width: Get.width,
                    color: AppColors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.discount,
                          color: AppColors.grey,
                          size: 24.sp,
                        ),
                        Text(
                          " See Offers",
                          style: Styles.metaRegular(
                            color: AppColors.icongrey,
                            size: 24.sp,
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
                    height: 74.h,
                    width: Get.width,
                    color: AppColors.green.withOpacity(0.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          EvaIcons.navigation2,
                          color: AppColors.black.withOpacity(0.7),
                          size: 24.sp,
                        ),
                        Text(
                          " Navigate",
                          style: Styles.metaRegular(
                            color: AppColors.black,
                            size: 24.sp,
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
      ),
    );
  }
}
