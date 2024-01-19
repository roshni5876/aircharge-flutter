import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/setting_screen_controller.dart';

class SettingScreenView extends GetView<SettingScreenController> {
  const SettingScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SettingScreenController settingScreenController =
        Get.put(SettingScreenController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(bottom: 72.h),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(
                  top: 15.h,
                ),
                children: [
                  Center(
                    child: Text(
                      "Settings",
                      style: Styles.interBold(
                        color: AppColors.blackText,
                        size: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    color: AppColors.grey.withOpacity(0.1),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                    child: Text(
                      "Notification Settings",
                      style: Styles.interBold(
                        color: AppColors.black,
                        size: 15.sp,
                      ),
                    ),
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    contentPadding: EdgeInsets.fromLTRB(12.w, 2, 12.w, 0),
                    title: Text(
                      "Low power Notifications",
                      style: Styles.interRegular(
                        color: AppColors.black,
                        size: 14.sp,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 3.h, bottom: 2.h),
                      child: Text(
                        "Notify me of nearby charging locations",
                        style: Styles.interRegular(
                          color: AppColors.settingScreenSubTitleColor,
                          size: 11.sp,
                        ),
                      ),
                    ),
                    trailing: Obx(
                      () => SizedBox(
                        height: 46.h,
                        width: 46.w,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(
                            value: controller.lowPowerNotifications.value,
                            onChanged: (bool value) {
                              controller.lowPowerNotifications.value = value;
                            },
                            activeColor: AppColors.settingScreenSwitchOnColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                    ),
                    child: Divider(
                      color: AppColors.grey.withOpacity(0.1),
                      height: 1.8,
                    ),
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    contentPadding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
                    title: Text(
                      "Disable notifications on Wifi",
                      style: Styles.interRegular(
                        color: AppColors.black,
                        size: 14.sp,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                      child: Text(
                        "Nearby chargers will only alert on mobile data",
                        style: Styles.interRegular(
                          color: AppColors.settingScreenSubTitleColor,
                          size: 11.sp,
                        ),
                      ),
                    ),
                    trailing: Obx(
                      () => SizedBox(
                        height: 46.h,
                        width: 46.w,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(
                            value: controller.disableNotification.value,
                            onChanged: (bool value) {
                              controller.disableNotification.value = value;
                            },
                            activeColor: AppColors.settingScreenSwitchOnColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Divider(
                      color: AppColors.grey.withOpacity(0.1),
                      height: 0.0,
                    ),
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    contentPadding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
                    title: Text(
                      "Custom Alert Radius",
                      style: Styles.interRegular(
                        color: AppColors.blackText,
                        size: 14.sp,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                        "Only show me nearby chargers within a specific distanc",
                        style: Styles.interRegular(
                          color: AppColors.settingScreenSubTitleColor,
                          size: 11.sp,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => SizedBox(
                            width: Get.width / 1.2.w,
                            child: Slider(
                              value: settingScreenController
                                  .customeAlertRadiusSlider.value,
                              onChanged: (value) {
                                settingScreenController
                                    .customeAlertRadiusSlider.value = value;
                              },
                              min: 0.0,
                              max: 100.0,
                              activeColor: AppColors.blue,
                              inactiveColor: AppColors.grey.withOpacity(0.2),
                            ),
                          ),
                        ),
                        Text(
                          "1km",
                          style: Styles.metaRegular(
                            color: AppColors.blackText,
                            size: 14.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.sp, vertical: 0),
                    child: Divider(
                      color: AppColors.grey.withOpacity(0.1),
                      height: 0.0,
                    ),
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    contentPadding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
                    title: Text(
                      "Battery Percentage Alert Threshold",
                      style: Styles.interRegular(
                        color: AppColors.blackText,
                        size: 14.sp,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Text(
                        "The battery percentage at which an alert will trigger",
                        style: Styles.interRegular(
                          color: AppColors.settingScreenSubTitleColor,
                          size: 11.sp,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => SizedBox(
                            width: Get.width / 1.2.w,
                            child: Slider(
                              value: settingScreenController
                                  .batteryPercentageAlerSlider.value,
                              onChanged: (value) {
                                settingScreenController
                                    .batteryPercentageAlerSlider.value = value;
                              },
                              min: 0.0,
                              max: 100.0,
                              activeColor: AppColors.blue,
                              inactiveColor: AppColors.grey.withOpacity(0.2),
                            ),
                          ),
                        ),
                        Text(
                          "20%",
                          style: Styles.interRegular(
                            color: AppColors.blackText,
                            size: 14.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.sp, vertical: 0),
                    child: Divider(
                      color: AppColors.grey.withOpacity(0.1),
                      height: 0.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: 18.h,
                    ),
                    child: Text(
                      "Data Tracking",
                      style: Styles.interBold(
                        color: AppColors.black,
                        size: 16.sp,
                      ),
                    ),
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    contentPadding: EdgeInsets.fromLTRB(12.w, 2, 12.w, 0),
                    title: Text(
                      "Allow power monitoring",
                      style: Styles.interRegular(
                        color: AppColors.black,
                        size: 14.sp,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 3.h, bottom: 2.h),
                      child: Text(
                        "Send battery and charge data to Aircharge",
                        style: Styles.interRegular(
                          color: AppColors.settingScreenSubTitleColor,
                          size: 11.sp,
                        ),
                      ),
                    ),
                    trailing: Obx(
                      () => SizedBox(
                        height: 46.h,
                        width: 46.w,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(
                            value: controller.allowPowerMonitoring.value,
                            onChanged: (bool value) {
                              controller.allowPowerMonitoring.value = value;
                            },
                            activeColor: AppColors.settingScreenSwitchOnColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                    ),
                    child: Divider(
                      color: AppColors.grey.withOpacity(0.1),
                      height: 1.8,
                    ),
                  ),
                  ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    contentPadding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 0),
                    title: Text(
                      "Allow location tracking",
                      style: Styles.interRegular(
                        color: AppColors.black,
                        size: 14.sp,
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                      child: Text(
                        "Used to show nearby chargers",
                        style: Styles.interRegular(
                          color: AppColors.settingScreenSubTitleColor,
                          size: 11.sp,
                        ),
                      ),
                    ),
                    trailing: Obx(
                      () => SizedBox(
                        height: 46.h,
                        width: 46.w,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(
                            value: controller.allowloctiontracking.value,
                            onChanged: (bool value) {
                              controller.allowloctiontracking.value = value;
                            },
                            activeColor: AppColors.settingScreenSwitchOnColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Divider(
                      color: AppColors.grey.withOpacity(0.1),
                      height: 0.0,
                    ),
                  ),
                  // SizedBox(height: Get.height / 15.h),
                ],
              ),
            ),
            Text(
              'Show Marker Mode',
              style: Styles.interBold(
                size: 14.sp,
                color: AppColors.settingScreenSwitchOffColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}
