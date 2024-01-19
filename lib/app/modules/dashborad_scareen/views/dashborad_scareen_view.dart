// ignore_for_file: deprecated_member_use

import 'package:aircharge/app/core/constants/enums.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/dashborad_scareen_controller.dart';

class DashboradScareenView extends GetView<DashboradScareenController> {
  const DashboradScareenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DashboradScareenController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        height: 80.h,
        decoration: const BoxDecoration(
            color: AppColors.bgGreyColor,
            boxShadow: [
              BoxShadow(
                  color: AppColors.iconGreyColor,
                  blurRadius: 2.0,
                  spreadRadius: 0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: AppColors.white,
                )
              ]),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavItem(
                      index: 0,
                      img: "assets/images/bnb_offers_icon.svg",
                      lable: 'Offers',
                    ),
                    _buildNavItem(
                      index: 1,
                      img: "assets/images/bnb_findcharger_icon.svg",
                      lable: 'Find Chargers',
                    ),
                    _buildNavItem(
                      index: 2,
                      img: "assets/images/bnb_settings_icon.svg",
                      lable: 'Settings',
                    ),
                  ]),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'air',
                      style: Styles.metaRegular(
                          color: AppColors.lightBlack,
                          size: 22.sp,
                          font: FontFamily.meta),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'charge',
                      style: Styles.metaBold(
                          color: AppColors.lightBlack,
                          size: 22.sp,
                          font: FontFamily.meta),
                    ),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                ],
              ),
              background: Container(
                color: AppColors.white,
              ),
            ),
          ),
          SliverFillRemaining(
            child: GetBuilder<DashboradScareenController>(
              id: "screen",
              builder: (cont) => Stack(
                children: [
                  cont.currentScreen,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({int? index, String? img, String? lable}) {
    return GetBuilder<DashboradScareenController>(
      id: "screen",
      builder: (cont) => InkWell(
        onTap: () {
          controller.selectedTab = index!;
          cont.navigateToScreen(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(4.sp),
              width: Get.width / 3,
              height: 78.h,
              decoration: BoxDecoration(
                color: controller.selectedTab == index
                    ? AppColors.bottomBarSelectedColor
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  SvgPicture.asset(
                    img!,
                    width: 32.0.w,
                    height: 32.0.h,
                    color: controller.selectedTab == index
                        ? AppColors.bottombarSelectedItemGrey
                        : AppColors.bottombarUnSelectedItemGrey,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    lable!,
                    style: Styles.interRegular(
                      size: 14.sp,
                      color: controller.selectedTab == index
                          ? AppColors.bottombarSelectedItemGrey
                          : AppColors.bottombarUnSelectedItemGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
