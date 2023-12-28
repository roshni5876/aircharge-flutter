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

            return ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Card(
                elevation: 10.0,
                color: AppColors.white,
                margin: EdgeInsets.only(
                    bottom: Get.height * 0.108.h,
                    left: 8.w,
                    right: 8.w,
                    top: 2.h),
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
                      height: Get.height * 0.60.h,
                      color: AppColors.white,
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
                                  color: AppColors.icongrey,
                                ),
                              ),
                              SizedBox(
                                width: Get.width / 4.w,
                              ),
                              Text(
                                "Report Issue",
                                style: Styles.metaRegular(
                                    color: AppColors.black, size: 18.sp),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.sp, vertical: 10.sp),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "It is important to us that the information in our app is accurate and up to date. ",
                                    style: Styles.metaMediuam(
                                      color: AppColors.black,
                                      size: 16.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Text(
                                    "We appreciate you reporting locations that may no longer have chargers available, or where they may be damaged.",
                                    style: Styles.metaMediuam(
                                      color: AppColors.black,
                                      size: 16.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Text(
                                    'Please add any relevant detail to the comment box below.',
                                    style: Styles.metaMediuam(
                                      color: AppColors.black,
                                      size: 16.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    'Costa Coffee',
                                    style: Styles.metaBold(
                                      color: AppColors.black,
                                      size: 16.sp,
                                    ),
                                  ),
                                  Text(
                                    "150 Russell sq, Southamton Row London,WC1B 5AL, 2.4 miles",
                                    style: Styles.metaMediuam(
                                      color: AppColors.icongrey,
                                      size: 16.sp,
                                    ),
                                    maxLines: 4,
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Card(
                                      shadowColor: AppColors.icongrey,
                                      elevation: 1,
                                      child: Container(
                                        height: Get.height / 3.64,
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(offset: Offset.zero)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.white,
                                        ),
                                        child: TextField(
                                          controller: controller.textarea,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                          decoration: InputDecoration.collapsed(
                                            hintText: " Comment",
                                            hintStyle: TextStyle(
                                                fontSize: 16,
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
                                    height: 60,
                                    width: Get.width,
                                    color: AppColors.white,
                                    child: const Text(
                                      "Report",
                                      style: TextStyle(
                                          color: AppColors.black, fontSize: 20),
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
              ),
            );
          }),
    );
  }
}
