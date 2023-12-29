import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/data/models/list_map.dart';
import 'package:aircharge/app/modules/find_charges_screen/views/comman_listtile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/find_charges_screen_controller.dart';

class FindChargesScreenView extends GetView<FindChargesScreenController> {
  const FindChargesScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FindChargesScreenController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      key: controller.scaffoldKey,
      backgroundColor: AppColors.white,
      drawerScrimColor: Colors.transparent,
      endDrawer: GetBuilder<FindChargesScreenController>(
          id: "screen", builder: (context) => controller.drowerScreen()),
      body: GestureDetector(
        onTap: () {
          if (controller.scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
            Get.back();
          }
        },
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
              child: Column(
                children: [
                  Card(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    borderOnForeground: false,
                    elevation: 1.sp,
                    child: Container(
                      height: 50.14.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                      padding: EdgeInsets.only(left: 14.w),
                      child: TextFormField(
                        expands: false,
                        autofocus: false,
                        decoration: InputDecoration(
                          prefixIcon: const ImageIcon(
                            AssetImage(
                              "assets/images/search.png",
                            ),
                          ),
                          prefixIconConstraints:
                              BoxConstraints(maxWidth: 30.sp),
                          prefixIconColor: AppColors.iconGreyColor,
                          hintText: 'Search Public Charging Locations',
                          hintStyle: Styles.interRegular(
                              size: 14.sp, color: AppColors.iconGreyColor),
                          helperStyle: const TextStyle(color: AppColors.grey),
                          fillColor: AppColors.white,
                          filled: true,
                          contentPadding: EdgeInsets.fromLTRB(
                              20.0.w, 10.0..h, 20.0.w, 10.0.h),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0.sp),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 3.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 84.h,
              child: Container(
                height: Get.height,
                width: Get.width,
                color: AppColors.bgGreyColor,
              ),
            ),
            Positioned(
              top: 54.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.sp),
                          ),
                          color: AppColors.white,
                          child: Container(
                            height: 46.h,
                            width: Get.width / 2.24,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(6.0.sp),
                            ),
                            child: Row(children: [
                              Padding(
                                padding: EdgeInsets.only(left: 6.w),
                                child: Icon(
                                  EvaIcons.navigation2,
                                  color: AppColors.green,
                                  size: 24.sp,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  'Current Location',
                                  style: Styles.interRegular(
                                    color: AppColors.iconGreyColor,
                                    size: 15.sp,
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.sp),
                          ),
                          color: AppColors.white,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: 46.h,
                            width: Get.width / 2.24.w,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(6.0.sp),
                            ),
                            child: Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.isMapViewVisible =
                                      !controller.isMapViewVisible;
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      controller.isMapViewVisible
                                          ? "assets/images/listview.png"
                                          : "assets/images/mapview.png",
                                      width: 22.w,
                                      height: 22.h,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        controller.isMapViewVisible
                                            ? " List View"
                                            : ' Map View',
                                        style: Styles.interRegular(
                                          color: AppColors.iconGreyColor,
                                          size: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.only(top: 100),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                itemCount: charges.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: GetBuilder<FindChargesScreenController>(
                      id: "screen",
                      builder: (cont) => InkWell(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: CommanListTile(
                          img: "${charges[index]['image']}",
                          title: charges[index]['title'] ?? "",
                          subTitle: charges[index]['subtitle'] ?? "",
                          thirdTitle: charges[index]['thirdtitle'] ?? "",
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    //        Obx(
    //     () => GoogleMap(
    //       initialCameraPosition: const CameraPosition(
    //         target: LatLng(37.7749, -122.4194), // Initial map location
    //         zoom: 12.0,
    //       ),
    //       markers: Set<Marker>.from(controller.markers),
    //       onMapCreated: (GoogleMapController googleMapController) {
    //         // You can perform additional operations when the map is created
    //       },
    //     ),
    //   ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
