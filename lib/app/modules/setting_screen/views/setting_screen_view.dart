import 'package:aircharge/app/core/constants/enums.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:flutter/material.dart';
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

        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Settings",
                style: Styles.metaBold(
                  color: AppColors.black,
                  size: 18.sp,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Notification Settings",
                style: Styles.metaBold(
                  color: AppColors.black,
                  size: 18.sp,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Low power Notifications",
                style: Styles.metaMediuam(
                  color: AppColors.black,
                  size: 16.sp,
                ),
              ),
              subtitle: Text(
                "Notify me of nearby charging locations",
                style: Styles.metaMediuam(
                  color: AppColors.icongrey,
                  size: 12.sp,
                ),
              ),
              trailing: Obx(
                () => Switch(
                  value: settingScreenController.lowPowerNotification.value ==
                      'Option 2',
                  onChanged: (value) {
                    controller.lowPowerNotification.value =
                        value ? 'Option 2' : 'Option 1';
                  },
                  activeColor: AppColors.white,
                  inactiveThumbColor: AppColors.white,
                  inactiveTrackColor: AppColors.grey.withOpacity(0.2),
                  activeTrackColor: AppColors.green,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Divider(
                color: AppColors.grey.withOpacity(0.1),
              ),
            ),
            ListTile(
              title: Text(
                "Disable notifications on Wifi",
                style: Styles.metaMediuam(
                  color: AppColors.black,
                  size: 16.sp,
                ),
              ),
              subtitle: Text(
                "Nearby chargers will only alert on mobile data",
                style: Styles.metaMediuam(
                  color: AppColors.icongrey,
                  size: 12.sp,
                ),
              ),
              trailing: Obx(
                () => Switch(
                  value: settingScreenController.disableNotification.value ==
                      'Option 2',
                  onChanged: (value) {
                    controller.disableNotification.value =
                        value ? 'Option 2' : 'Option 1';
                  },
                  activeColor: AppColors.white,
                  inactiveThumbColor: AppColors.white,
                  inactiveTrackColor: AppColors.grey.withOpacity(0.2),
                  activeTrackColor: AppColors.green,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Divider(
                color: AppColors.grey.withOpacity(0.1),
              ),
            ),
            ListTile(
              title: Text(
                "Custom Alert Radius",
                style: Styles.metaMediuam(
                  color: AppColors.black,
                  size: 16.sp,
                ),
              ),
              subtitle: Text(
                "Only show me nearby chargers within a specific distance",
                style: Styles.metaMediuam(
                  color: AppColors.icongrey,
                  size: 12.sp,
                ),
              ),
            ),
            Row(
              children: [
                Obx(() => Container(
                      width: Get.width / 1.2,
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
                    )),
                Text(
                  "1km",
                  style: Styles.metaRegular(
                    color: AppColors.icongrey,
                    size: 14.sp,
                  ),
                )
              ],
            ),
            ListTile(
              title: Text(
                "Battery Percentage Alert Threshold",
                style: Styles.metaMediuam(
                  color: AppColors.black,
                  size: 16.sp,
                ),
              ),
              subtitle: Text(
                "The battery percentage at which an alert will trigger",
                style: Styles.metaMediuam(
                  color: AppColors.icongrey,
                  size: 12.sp,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Divider(
                color: AppColors.grey.withOpacity(0.1),
              ),
            ),
            Row(
              children: [
                Obx(() => Container(
                      width: Get.width / 1.2,
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
                    )),
                Text(
                  "20%",
                  style: Styles.metaRegular(
                    color: AppColors.icongrey,
                    size: 14.sp,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Data Tracking",
                style: Styles.metaBold(
                  color: AppColors.black,
                  size: 18.sp,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Allow power monitoring",
                style: Styles.metaMediuam(
                  color: AppColors.black,
                  size: 16.sp,
                ),
              ),
              subtitle: Text(
                "Send battery and charge data to Aircharge",
                style: Styles.metaMediuam(
                  color: AppColors.icongrey,
                  size: 12.sp,
                ),
              ),
              trailing: Obx(
                () => Switch(
                  value: settingScreenController.allowPowerMonitoring.value ==
                      'Option 2',
                  onChanged: (value) {
                    controller.lowPowerNotification.value =
                        value ? 'Option 2' : 'Option 1';
                  },
                  activeColor: AppColors.white,
                  inactiveThumbColor: AppColors.white,
                  inactiveTrackColor: AppColors.grey.withOpacity(0.2),
                  activeTrackColor: AppColors.green,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Divider(
                color: AppColors.grey.withOpacity(0.1),
              ),
            ),
            ListTile(
              title: Text(
                "Allow location tracking",
                style: Styles.metaMediuam(
                  color: AppColors.black,
                  size: 16.sp,
                ),
              ),
              subtitle: Text(
                "Used to show nearby chargers",
                style: Styles.metaMediuam(
                  color: AppColors.icongrey,
                  size: 12.sp,
                ),
              ),
              trailing: Obx(
                () => Switch(
                  value: settingScreenController.alloeloctiontracking.value ==
                      'Option 2',
                  onChanged: (value) {
                    controller.disableNotification.value =
                        value ? 'Option 2' : 'Option 1';
                  },
                  activeColor: AppColors.white,
                  inactiveThumbColor: AppColors.white,
                  inactiveTrackColor: AppColors.grey.withOpacity(0.2),
                  activeTrackColor: AppColors.green,
                ),
              ),
            ),
          ],
        ));
  }
}
