import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/theme/colors.dart';

class OfferDetails extends GetView<HomeController> {
  const OfferDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      borderOnForeground: false,
      color: AppColors.white,
      margin: EdgeInsets.only(
        bottom: Get.height * 0.126.h,
        left: 2.w,
        right: 2.w,
        top: 1.h,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.1),
              spreadRadius: -2.26,
              blurRadius: 1.0,
              offset: const Offset(-4.0, -2.0),
            ),
            BoxShadow(
              color: AppColors.grey.withOpacity(0.1),
              blurRadius: 1.0,
              spreadRadius: -2.26,
              offset: const Offset(5.0, 1.0),
            ),
          ],
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          controller.isVisibleOfferScreen = true;
                          // controller.isOpenedOfferScreen.value = false;
                          // controller.animationController.reverse();
                          // controller.update(["visiblePage"]);
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 30.h,
                            width: 30.w,
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
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      image: const DecorationImage(
                          image:
                              AssetImage("assets/images/particuleroffer.png"),
                          fit: BoxFit.fill)),
                  height: Get.height / 4.2.h,
                  width: Get.width,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Text(
                  "Earn rewards in the starbucks loyalty app",
                  style: Styles.interBold(
                    color: AppColors.blackText,
                    size: 14.sp,
                  ),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Text(
                  "Expanded offer information",
                  style: Styles.interRegular(
                    color: AppColors.black,
                    size: 12.sp,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Text(
                  "Offer ends: dd/mm/yyyy",
                  style: Styles.interRegular(
                    color: AppColors.black,
                    size: 12.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.w,
                ),
                child: PrimaryButton(
                  onPressed: () {},
                  height: 62.h,
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
              ),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// class CommanCardOffers extends StatelessWidget {
//   final String img;
//   final String title;
//   final String subTitle;
//   final String thirdTitle;
//   const CommanCardOffers(
//       {super.key,
//       required this.img,
//       required this.title,
//       required this.subTitle,
//       required this.thirdTitle});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.white,
//       padding: EdgeInsets.only(top: 4.h, left: 10.w, right: 10.w, bottom: 4.h),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Container(
//                 height: 40.h,
//                 width: 40.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.sp),
//                 ),
//                 child: Image.asset(img),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 2.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       title,
//                       style: Styles.interBold(
//                         color: AppColors.blackText,
//                         size: 15.sp,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 1.h,
//                     ),
//                     Text(
//                       subTitle,
//                       style: Styles.interRegular(
//                         color: AppColors.iconGreyColor,
//                         size: 13.sp,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 1.h,
//                     ),
//                     Text(
//                       thirdTitle,
//                       style: Styles.interRegular(
//                         color: AppColors.iconGreyColor,
//                         size: 13.sp,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
