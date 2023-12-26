import 'package:aircharge/app/core/constants/enums.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: AppColors.white,
            offset: Offset.zero,
            blurRadius: 1.0,
          )
        ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _buildNavItem(0, Icons.discount, 'Offers'),
          _buildNavItem(1, EvaIcons.flash, 'Find Chargers'),
          _buildNavItem(2, Icons.settings, 'Settings'),
        ]),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
                          size: 24.sp,
                          font: FontFamily.meta),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'charge',
                      style: Styles.metaBold(
                          color: AppColors.lightBlack,
                          size: 24.sp,
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
            hasScrollBody: true,
            fillOverscroll: true,
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

  Widget _buildNavItem(int index, IconData icon, String lable) {
    return GetBuilder<DashboradScareenController>(
      id: "screen",
      builder: (cont) => InkWell(
        onTap: () {
          controller.selectedTab = index;
          cont.navigateToScreen(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              width: Get.width / 3,
              height: 78.h,
              decoration: BoxDecoration(
                color: controller.selectedTab == index
                    ? AppColors.bottomBarSelectedColor
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Icon(
                    icon,
                    color: controller.selectedTab == index
                        ? AppColors.black
                        : Colors.grey,
                    size: 30.sp,
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    lable,
                    style: Styles.metaRegular(
                      size: 16.sp,
                      color: controller.selectedTab == index
                          ? AppColors.black
                          : Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
