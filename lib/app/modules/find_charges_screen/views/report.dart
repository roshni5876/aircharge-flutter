import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/modules/find_charges_screen/controllers/find_charges_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportView extends GetView<FindChargesScreenController> {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AnimatedBuilder(
          animation: controller.animationController,
          builder: (context, child) {
            // double slide =
            //     controller.rightSlide * controller.animationController.value;
            // double scale = 1 - (controller.animationController.value * 3);

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
                    BoxShadow(
                        color: AppColors.iconGreyColor, offset: Offset(0, 0)),
                  ],
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.sp),
                ),
                height: Get.height,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: Get.height * 0.60.h,
                    color: AppColors.white,
                    padding: EdgeInsets.only(top: 8.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.selectPage(0);
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 18.sp,
                                color: AppColors.iconGreyColor,
                              ),
                            ),
                            SizedBox(
                              width: Get.width / 4.w,
                            ),
                            Text(
                              "Report Issue",
                              style: Styles.interRegular(
                                  color: AppColors.blackText, size: 15.sp),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.sp, vertical: 10.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "It is important to us that the information in our app is accurate and up to date. ",
                                style: Styles.interRegular(
                                  color: AppColors.black,
                                  size: 13.sp,
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Text(
                                "We appreciate you reporting locations that may no longer have chargers available, or where they may be damaged.",
                                style: Styles.interRegular(
                                  color: AppColors.black,
                                  size: 13.sp,
                                ),
                              ),
                              SizedBox(
                                height: 13.h,
                              ),
                              Text(
                                'Please add any relevant detail to the comment box below.',
                                style: Styles.interRegular(
                                  color: AppColors.black,
                                  size: 13.sp,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Costa Coffee',
                                style: Styles.interBold(
                                  color: AppColors.blackText,
                                  size: 16.sp,
                                ),
                              ),
                              Text(
                                "150 Russell sq,\nSouthamton Row London,\nWC1B 5AL, 2.4 miles",
                                style: Styles.interRegular(
                                  color: AppColors.offerDetailsAddresTextGrey,
                                  size: 13.sp,
                                ),
                                maxLines: 4,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Card(
                                  shadowColor: AppColors.iconGreyColor,
                                  elevation: 1,
                                  child: Container(
                                    height: Get.height / 3.50.h,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(offset: Offset.zero)
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.white,
                                    ),
                                    child: TextField(
                                      controller: controller.textarea,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      decoration: InputDecoration.collapsed(
                                        hintText: " Comment",
                                        hintStyle: TextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.grey
                                                .withOpacity(0.2)),
                                        border: InputBorder.none,
                                      ),
                                      expands: true,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              PrimaryButton(
                                onPressed: () {},
                                height: 56.h,
                                width: Get.width,
                                color: AppColors.whiteStarRatingColor,
                                child: Text("Report",
                                    style: Styles.interRegular(
                                        size: 20.sp,
                                        color: AppColors.blackText)),
                              ),
                              SizedBox(
                                height: 10.h,
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
          }),
    );
  }
}
