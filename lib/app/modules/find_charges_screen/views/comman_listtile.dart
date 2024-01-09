import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/modules/find_charges_screen/controllers/find_charges_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommanListTile extends GetView<FindChargesScreenController> {
  final String? img;
  final String? title;
  final String? subTitle;
  final String? thirdTitle;
  const CommanListTile(
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
              CircleAvatar(
                maxRadius: 25.sp,
                backgroundColor: Colors.transparent,                  
                backgroundImage: AssetImage(
                  img!,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title!,
                      style: Styles.interBold(
                        color: AppColors.blackText,
                        size: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      subTitle!,
                      style: Styles.interRegular(
                        color: AppColors.iconGreyColor,
                        size: 13.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      thirdTitle!,
                      style: Styles.interRegular(
                        color: AppColors.iconGreyColor,
                        size: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20.sp,
                color: AppColors.iconGreyColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
