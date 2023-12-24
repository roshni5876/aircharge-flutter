import 'package:aircharge/app/core/constants/enums.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(
        elevation: 0,
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
          ],
        ),
      ),
      bottomNavigationBar: const DashbordBottomNavigationBar(),
      body: GetBuilder<DashboradScareenController>(
        id: "screen",
        builder: (cont) => Stack(
          children: [
            cont.currentScreen,
          ],
        ),
      ),
    );
  }
}

class DashbordBottomNavigationBar extends StatelessWidget {
  const DashbordBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      color: AppColors.bgGreyColor,
      height: 80,
      child: GetBuilder<DashboradScareenController>(
        id: "screen",
        builder: (cont) => BottomNavigationBar(
          selectedItemColor: AppColors.black,
          onTap: cont.navigateToScreen,
          currentIndex: cont.currentIndex,
          backgroundColor: AppColors.white,
          unselectedItemColor: AppColors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.discount_outlined),
              label: 'Offers',
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.flash),
              label: 'Find Chargers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
