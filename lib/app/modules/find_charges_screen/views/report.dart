import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/modules/find_charges_screen/controllers/find_charges_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportView extends GetView<FindChargesScreenController> {
  const ReportView({super.key});

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
        left: 12.w,
        right: 12.w,
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
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: GetBuilder<FindChargesScreenController>(
                              id: "reportPage",
                              builder: (cont) => InkWell(
                                onTap: () {
                                  controller.isVisibleReport = true;
                                  controller.isOpenedReport.value = false;
                                  controller.reportAnimationController
                                      .reverse();
                                  controller
                                      .update(["reportPage", "visiblePage"]);
                                },
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 3.h),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: SizedBox(
                                        width: 30.w,
                                        height: 30.h,
                                        child: Icon(
                                          Icons.arrow_back_ios_new,
                                          size: 18.sp,
                                          color: AppColors.iconGreyColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Report Issue",
                                style: Styles.interRegular(
                                    color: AppColors.blackText, size: 15.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
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
                        height: 10.h,
                      ),
                      Text(
                        'Costa Coffee',
                        style: Styles.interBold(
                          color: AppColors.blackText,
                          size: 16.sp,
                        ),
                      ),
                      Text(
                        "150 Russell sq,\nSouthamton Row London,\nWC1B 5AL",
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
                        // borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.all(8.sp),
                          height: Get.height / 3.38.h,
                          // height: 200,
                          decoration: BoxDecoration(
                            border: const Border(
                              top: BorderSide(
                                  width: 3.0,
                                  color: AppColors.settingScreenSwitchOffColor),
                              left: BorderSide(
                                  width: 1.5,
                                  color: AppColors.settingScreenSwitchOffColor),
                              right: BorderSide(
                                  width: 1.5,
                                  color: AppColors.settingScreenSwitchOffColor),
                              bottom: BorderSide.none,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 3),
                                spreadRadius: -5,
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.sp),
                              topRight: Radius.circular(10.sp),
                              bottomLeft: Radius.circular(8.sp),
                              bottomRight: Radius.circular(8.sp),
                            ),
                            color: AppColors.white,
                          ),
                          child: Obx(
                            () => TextField(
                              controller: controller.textarea,
                              keyboardType: TextInputType.multiline,
                              maxLength: controller.maxCharacters,
                              cursorColor: AppColors.iconGreyColor,
                              maxLines: null,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                hintText: "Comment",
                                hintStyle: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.reportCommentColor,
                                ),
                                border: InputBorder.none,
                                counterStyle: TextStyle(
                                  color: controller.textarea.text.length ==
                                          controller.maxCharacters
                                      ? AppColors.red
                                      : AppColors.reportCommentColor,
                                ),
                              ),
                              expands: true,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: PrimaryButton(
                  onPressed: () {},
                  height: 62.h,
                  width: Get.width,
                  color: AppColors.whiteStarRatingColor,
                  child: Text("Report",
                      style: Styles.interRegular(
                          size: 20.sp, color: AppColors.blackText)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
