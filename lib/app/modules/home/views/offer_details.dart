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
                      child: GetBuilder<HomeController>(
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
                              )),
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
                          image:
                              AssetImage("assets/images/particuleroffer.png"),
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
    );
  }
}

class MultipleOffers extends GetView<HomeController> {
  const MultipleOffers({super.key});

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
                      child: GetBuilder<HomeController>(
                          id: "visiblePage",
                          builder: (cont) => GestureDetector(
                                onTap: () {
                                  controller.isVisibleMultipleOffers = true;
                                  controller.isOpenedMultipleOffers.value =
                                      false;
                                  controller.animationControllerMultipleOffers
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
                        child: Image.asset(
                          "assets/images/coffelogo.png",
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
                                    "Exclusive Festive Menu in Costa Club App ",
                                    style: Styles.interBold(
                                      color: AppColors.blackText,
                                      size: 13.sp,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "McDonald's Monopoly is back! Peel. Play. Win?",
                                    style: Styles.interRegular(
                                      color: AppColors.black,
                                      size: 12.sp,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "offer ends: dd/mm/yyyy",
                                    style: Styles.interRegular(
                                      color: AppColors.black,
                                      size: 10.sp,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Free cake on your birthday",
                                    style: Styles.interBold(
                                      color: AppColors.blackText,
                                      size: 13.sp,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Celebrate your birthday with cake for free.",
                                    style: Styles.interRegular(
                                      color: AppColors.black,
                                      size: 12.sp,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Get your free drnk faster",
                                    style: Styles.interBold(
                                      color: AppColors.blackText,
                                      size: 13.sp,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Buy 5 drinks to get 1 free.",
                                    style: Styles.interRegular(
                                      color: AppColors.black,
                                      size: 12.sp,
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
    );
  }
}

class CommanCardOffers extends StatelessWidget {
  final String img;
  final String title;
  final String subTitle;
  final String thirdTitle;
  const CommanCardOffers(
      {super.key,
      required this.img,
      required this.title,
      required this.subTitle,
      required this.thirdTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(top: 4.h, left: 10.w, right: 10.w, bottom: 4.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                child: Image.asset(img),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: Styles.interBold(
                        color: AppColors.blackText,
                        size: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      subTitle,
                      style: Styles.interRegular(
                        color: AppColors.iconGreyColor,
                        size: 13.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      thirdTitle,
                      style: Styles.interRegular(
                        color: AppColors.iconGreyColor,
                        size: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
