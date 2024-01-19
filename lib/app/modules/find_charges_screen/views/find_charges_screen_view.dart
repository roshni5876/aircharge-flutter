// ignore_for_file: deprecated_member_use

import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/data/models/list_map.dart';
import 'package:aircharge/app/modules/find_charges_screen/views/comman_listtile.dart';
import 'package:aircharge/app/modules/find_charges_screen/views/find_charges_details_screen_view.dart';
import 'package:aircharge/app/modules/find_charges_screen/views/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      backgroundColor: AppColors.white,
      drawerScrimColor: Colors.transparent,
      // body: WillPopScope(
      //   onWillPop: () async {
      //     if (controller.isVisible || controller.isVisibleReport) {
      //       controller.isVisible = false;
      //       controller.isVisibleReport = false;
      //       controller.isOpened.value = false;
      //       controller.update(["visiblePage"]);
      //       return false;
      //     } else {
      //       return true;
      //     }
      //   },
      //   child:

      // body: Stack(
      //   children: [
      //     Positioned(
      //       top: 84.h,
      //       child: Obx(
      //         () => Visibility(
      //           visible: controller.isMapViewVisible,
      //           replacement: SizedBox(
      //             height: Get.height,
      //             width: Get.width,
      //             child: Obx(
      //               () => Visibility(
      //                 visible: controller.isVisible,
      //                 child: Stack(
      //                   children: [
      //                     GoogleMap(
      //                       onMapCreated: (mapController) {
      //                         controller.googleMapController = mapController;
      //                       },
      //                       initialCameraPosition: const CameraPosition(
      //                         target: LatLng(37.7749, -122.4194),
      //                       ),
      //                     ),
      //                     Column(
      //                       children: [
      //                         Expanded(
      //                           flex: 3,
      //                           child: Container(),
      //                         ),
      //                         Expanded(
      //                           flex: 5,
      //                           child: Column(
      //                             children: [
      //                               Expanded(
      //                                 child: listViewWidget(false),
      //                               ),
      //                               const Expanded(
      //                                 flex: 1,
      //                                 child: SizedBox(),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //           child: Container(
      //             height: Get.height,
      //             width: Get.width,
      //             color: AppColors.bgGreyColor,
      //           ),
      //         ),
      //       ),
      //     ),
      //     Obx(() => Visibility(
      //           visible: controller.isVisible,
      //           replacement: SizedBox(
      //             height: Get.height,
      //             width: Get.width,
      //           ),
      //           child: Container(
      //             width: Get.width,
      //             margin: EdgeInsets.only(
      //               top: 82.h,
      //             ),
      //             child: controller.isMapViewVisible
      //                 ? listViewWidget(true)
      //                 : Container(),
      //           ),
      //         )),
      //     Positioned.fill(
      //       top: 0.h,
      //       child: Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
      //         child: Column(
      //           children: [
      //             Card(
      //               color: AppColors.white,
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(8.sp),
      //               ),
      //               borderOnForeground: false,
      //               elevation: 1.sp,
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   color: AppColors.white,
      //                   borderRadius: BorderRadius.circular(8.sp),
      //                 ),
      //                 padding: EdgeInsets.only(left: 14.w),
      //                 child: Column(
      //                   children: [
      //                     TextFormField(
      //                       expands: false,
      //                       autofocus: false,
      //                       cursorColor: AppColors.iconGreyColor,
      //                       decoration: InputDecoration(
      //                         prefixIcon: const ImageIcon(
      //                           AssetImage(
      //                             "assets/images/search.png",
      //                           ),
      //                         ),
      //                         prefixIconConstraints:
      //                             BoxConstraints(maxWidth: 30.sp),
      //                         prefixIconColor: AppColors.iconGreyColor,
      //                         hintText: 'Search Public Charging Locations',
      //                         hintStyle: Styles.interRegular(
      //                             size: 14.sp, color: AppColors.iconGreyColor),
      //                         helperStyle:
      //                             const TextStyle(color: AppColors.grey),
      //                         fillColor: AppColors.white,
      //                         filled: true,
      //                         border: InputBorder.none,
      //                         contentPadding: EdgeInsets.fromLTRB(
      //                             20.0.w, 10.0..h, 20.0.w, 10.0.h),
      //                         enabledBorder: OutlineInputBorder(
      //                           borderRadius: BorderRadius.circular(10.0.sp),
      //                           borderSide: const BorderSide(
      //                               color: Colors.white, width: 3.0),
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             Row(
      //               children: [
      //                 Expanded(
      //                   child: Card(
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(6.sp),
      //                     ),
      //                     color: AppColors.white,
      //                     child: Container(
      //                       height: 46.h,
      //                       decoration: BoxDecoration(
      //                         color: AppColors.white,
      //                         borderRadius: BorderRadius.circular(6.0.sp),
      //                       ),
      //                       child: Row(children: [
      //                         Padding(
      //                           padding: EdgeInsets.only(left: 6.w),
      //                           child: Icon(
      //                             EvaIcons.navigation2,
      //                             color: AppColors.green,
      //                             size: 24.sp,
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           width: Get.width / 2 - 60,
      //                           child: FittedBox(
      //                             fit: BoxFit.scaleDown,
      //                             child: Text(
      //                               'Current Location',
      //                               style: Styles.interRegular(
      //                                 color: AppColors.iconGreyColor,
      //                                 size: 15.sp,
      //                               ),
      //                               maxLines: 1,
      //                               softWrap: true,
      //                               overflow: TextOverflow.clip,
      //                             ),
      //                           ),
      //                         )
      //                       ]),
      //                     ),
      //                   ),
      //                 ),
      //                 Expanded(
      //                   child: GestureDetector(
      //                     onTap: () {
      //                       controller.isMapViewVisible =
      //                           !controller.isMapViewVisible;
      //                     },
      //                     child: Card(
      //                       shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(6.sp),
      //                       ),
      //                       color: AppColors.white,
      //                       child: Container(
      //                         padding: const EdgeInsets.all(8),
      //                         height: 46.h,
      //                         decoration: BoxDecoration(
      //                           color: AppColors.white,
      //                           borderRadius: BorderRadius.circular(6.0.sp),
      //                         ),
      //                         child: Obx(
      //                           () => Row(
      //                             children: [
      //                               Image.asset(
      //                                 !controller.isMapViewVisible
      //                                     ? "assets/images/listview.png"
      //                                     : "assets/images/mapview.png",
      //                                 width: 22.w,
      //                                 height: 22.h,
      //                               ),
      //                               SizedBox(
      //                                 width: 6.w,
      //                               ),
      //                               FittedBox(
      //                                 child: Text(
      //                                   !controller.isMapViewVisible
      //                                       ? " List View"
      //                                       : ' Map View',
      //                                   style: Styles.interRegular(
      //                                     color: AppColors.iconGreyColor,
      //                                     size: 15.sp,
      //                                   ),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Obx(
      //       () => Visibility(
      //         visible: controller.isVisibleReport,
      //         replacement: SizedBox(
      //           height: Get.height,
      //           width: Get.width,
      //         ),
      //         child: GetBuilder<FindChargesScreenController>(
      //           id: "visiblePage",
      //           builder: (cont) => AnimatedPositioned(
      //             curve: Curves.easeInOut,
      //             top: 0,
      //             bottom: 0,
      //             right: 2,
      //             left: controller.isOpened.value ? 2 : Get.width,
      //             duration: const Duration(milliseconds: 300),
      //             child: const FindChargesDetailsScreen(),
      //           ),
      //         ),
      //       ),
      //     ),
      //     GetBuilder<FindChargesScreenController>(
      //       id: "reportPage",
      //       builder: (cont) {
      //         return AnimatedPositioned(
      //           curve: Curves.easeInOut,
      //           top: 0,
      //           bottom: 0,
      //           right: 2,
      //           left: controller.isOpenedReport.value ? 2 : Get.width,
      //           duration: const Duration(milliseconds: 300),
      //           child: const ReportView(),
      //         );
      //       },
      //     ),
      //
      //  ],
      // ),

      body: Stack(
        children: [
          Positioned(
            top: 84.h,
            child: Obx(
              () => Visibility(
                visible: controller.isMapViewVisible,
                replacement: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Obx(
                    () => Visibility(
                      visible: controller.isVisible,
                      child: GoogleMap(
                        onMapCreated: (mapController) {
                          controller.googleMapController = mapController;
                        },
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(37.7749, -122.4194),
                        ),
                      ),
                    ),
                  ),
                ),
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  color: AppColors.bgGreyColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child:
                // Obx(
                //   () => Visibility(
                //     visible: controller.isVisibleReport,
                //     replacement: const ReportView(),
                //     child: Obx(
                //       () => Visibility(
                //         visible: controller.isVisible,
                //         replacement: FindChargesDetailsScreen(),
                //         child:

                Column(
              children: [
                Card(
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  borderOnForeground: false,
                  elevation: 1.sp,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    padding: EdgeInsets.only(left: 14.w),
                    child: TextFormField(
                      expands: false,
                      autofocus: false,
                      cursorColor: AppColors.iconGreyColor,
                      decoration: InputDecoration(
                        prefixIcon: const ImageIcon(
                          AssetImage(
                            "assets/images/search.png",
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(maxWidth: 30.sp),
                        prefixIconColor: AppColors.iconGreyColor,
                        hintText: 'Search Public Charging Locations',
                        hintStyle: Styles.interRegular(
                            size: 14.sp, color: AppColors.iconGreyColor),
                        helperStyle: const TextStyle(color: AppColors.grey),
                        fillColor: AppColors.white,
                        filled: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(
                            20.0.w, 10.0..h, 20.0.w, 10.0.h),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0.sp),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 3.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.sp),
                        ),
                        color: AppColors.white,
                        child: Container(
                          height: 46.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(6.0.sp),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.w, right: 4.w),
                                child: SvgPicture.asset(
                                  'assets/images/fc_locations_toggle.svg',
                                  width: 24.0.w,
                                  height: 24.0.h,
                                  color: AppColors.green,
                                ),
                              ),
                              SizedBox(
                                width: Get.width / 2 - 60,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    'Current Location',
                                    style: Styles.interRegular(
                                      color: AppColors.iconGreyColor,
                                      size: 15.sp,
                                    ),
                                    maxLines: 1,
                                    softWrap: true,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.isMapViewVisible =
                              !controller.isMapViewVisible;
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.sp),
                          ),
                          color: AppColors.white,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: 46.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(6.0.sp),
                            ),
                            child: Obx(
                              () => Row(
                                children: [
                                  SvgPicture.asset(
                                    !controller.isMapViewVisible
                                        ? "assets/images/fc_list_icon.svg"
                                        : "assets/images/fc_map_icon.svg",
                                    width: 22.w,
                                    height: 22.h,
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      !controller.isMapViewVisible
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
                    ),
                  ],
                ),
                Expanded(
                  child: Obx(
                    () => Visibility(
                      visible: controller.isMapViewVisible,
                      replacement: SizedBox(
                        height: Get.height,
                        width: Get.width,
                        child: Obx(
                          () => Visibility(
                            visible: controller.isVisible,
                            child: Column(
                              children: [
                                Spacer(),
                                SizedBox(
                                  height: (Get.height * 0.08.h * 3) + 20.h,
                                  child: listViewWidget(),
                                ),
                                SizedBox(height: 76.h + 10)
                              ],
                            ),
                          ),
                        ),
                      ),
                      child: Obx(
                        () => Visibility(
                          visible: controller.isVisible,
                          child: listViewWidget(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //       ),
            //     ),
            //   ),
            // ),
          ),
          Obx(
            () => Visibility(
              visible: controller.isVisibleReport,
              replacement: SizedBox(
                height: Get.height,
                width: Get.width,
              ),
              child: GetBuilder<FindChargesScreenController>(
                id: "visiblePage",
                builder: (cont) => AnimatedPositioned(
                  curve: Curves.easeInOut,
                  top: 0,
                  bottom: 0,
                  right: 2,
                  left: controller.isOpened.value ? 2 : Get.width,
                  duration: const Duration(milliseconds: 300),
                  child: const FindChargesDetailsScreen(),
                ),
              ),
            ),
          ),
          GetBuilder<FindChargesScreenController>(
            id: "reportPage",
            builder: (cont) {
              return AnimatedPositioned(
                curve: Curves.easeInOut,
                top: 0,
                bottom: 0,
                right: 2,
                left: controller.isOpenedReport.value ? 2 : Get.width,
                duration: const Duration(milliseconds: 300),
                child: const ReportView(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget listViewWidget(//   bool displayAllItems,
      ) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: ListView.builder(
        controller: controller.scrollController,
        padding: EdgeInsets.only(
          // top: 30.h,
          // left: 10.w,
          // right: 10.w,
          bottom: 84.h,
        ),

        // itemCount: displayAllItems
        //     ? charges.length
        //     : min(charges.length, controller.visibleItemCount.value),
        itemCount: charges.length,
        // itemCount: controller.findChargesLoctionsList.brandName?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.sp),
            ),
            child: GetBuilder<FindChargesScreenController>(
              id: "visiblePage",
              builder: (cont) => GestureDetector(
                onTap: () {
                  controller.isVisible = false;
                  controller.isOpened.value = !controller.isOpened.value;
                  if (controller.isOpened.value) {
                    controller.animationController.forward();
                  } else {
                    controller.animationController.reverse();
                  }
                  controller.update(["visiblePage", "reportPage"]);
                },
                child: CommanListTile(
                  // img: "",
                  // thirdTitle: "",
                  // subTitle: "",
                  img: "${charges[index]['image']}",
                  title: charges[index]['title'] ?? "",
                  // title: controller.findChargesLoctionsList.brandName.toString(),
                  subTitle: charges[index]['subtitle'] ?? "",
                  thirdTitle: charges[index]['thirdtitle'] ?? "",
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
//   Widget listViewWidgetInMap(
//       //   bool displayAllItems,
//       ) {
//     return ListView.builder(
//       controller: controller.mapScrollController,
//       padding: EdgeInsets.only(
//         // top: 30.h,
//         // left: 10.w,
//         // right: 10.w,
//         bottom: 84.h,
//       ),
//       // itemCount: controller.visibleItemCount.value,
//       // itemCount: min(charges.length, controller.visibleItemCount.value),
//       itemCount: chargesData.length,
//       // itemCount: controller.findChargesLoctionsList.brandName?.length ?? 0,
//       itemBuilder: (BuildContext context, int index) {
//         if (index == chargesData.length - 1) {
//           // If the last item is reached, fetch more data
//           controller.fetchMoreData();
//         }
//         return Card(
//           clipBehavior: Clip.antiAlias,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.sp),
//           ),
//           child: GetBuilder<FindChargesScreenController>(
//             id: "visiblePage",
//             builder: (cont) => GestureDetector(
//               onTap: () {
//                 controller.isVisible = false;
//                 controller.isOpened.value = !controller.isOpened.value;
//                 // if (controller.isOpened.value) {
//                 //   controller.animationController.forward();
//                 // } else {
//                 //   controller.animationController.reverse();
//                 // }
//                 // controller.update(["visiblePage", "reportPage"]);
//               },
//               child: CommanListTile(
//                 // img: "",
//                 // thirdTitle: "",
//                 // subTitle: "",
//                 img: "${charges[index]['image']}",
//                 title: charges[index]['title'] ?? "",
//                 // title: controller.findChargesLoctionsList.brandName.toString(),
//                 subTitle: charges[index]['subtitle'] ?? "",
//                 thirdTitle: charges[index]['thirdtitle'] ?? "",
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
