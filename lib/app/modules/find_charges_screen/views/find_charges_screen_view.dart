import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/data/models/list_map.dart';
import 'package:aircharge/app/modules/find_charges_screen/views/comman_listtile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
      // endDrawer: GetBuilder<FindChargesScreenController>(
      //     id: "screen", builder: (context) => controller.drowerScreen()),
      body:
          // GestureDetector(
          //   onTap: () {
          //     if (controller.scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
          //       Get.back();
          //     }
          //   },
          Stack(
        children: [
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
          //   child: Column(
          //     children: [
          //       Card(
          //         color: AppColors.white,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(8.sp),
          //         ),
          //         borderOnForeground: false,
          //         elevation: 1.sp,
          //         child: Container(
          //           height: 50.14.h,
          //           decoration: BoxDecoration(
          //             color: AppColors.white,
          //             borderRadius: BorderRadius.circular(8.sp),
          //           ),
          //           padding: EdgeInsets.only(left: 14.w),
          //           child: Column(
          //             children: [
          //               TextFormField(
          //                 expands: false,
          //                 autofocus: false,
          //                 decoration: InputDecoration(
          //                   prefixIcon: const ImageIcon(
          //                     AssetImage(
          //                       "assets/images/search.png",
          //                     ),
          //                   ),
          //                   prefixIconConstraints: BoxConstraints(maxWidth: 30.sp),
          //                   prefixIconColor: AppColors.iconGreyColor,
          //                   hintText: 'Search Public Charging Locations',
          //                   hintStyle: Styles.interRegular(
          //                       size: 14.sp, color: AppColors.iconGreyColor),
          //                   helperStyle: const TextStyle(color: AppColors.grey),
          //                   fillColor: AppColors.white,
          //                   filled: true,
          //                   contentPadding: EdgeInsets.fromLTRB(
          //                       20.0.w, 10.0..h, 20.0.w, 10.0.h),
          //                   enabledBorder: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(10.0.sp),
          //                     borderSide:
          //                         const BorderSide(color: Colors.white, width: 3.0),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Positioned(
            top: 84.h,
            child: Container(
              height: Get.height,
              width: Get.width,
              color: AppColors.bgGreyColor,
            ),
          ),
          Obx(() => Visibility(
                visible: controller.isVisible,
                replacement: SizedBox(
                  height: Get.height,
                  width: Get.width,
                ),
                child: Container(
                  width: Get.width,
                  margin: EdgeInsets.only(
                    top: 82.h,
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      top: 30.w,
                      left: 10.w,
                      right: 10.w,
                      bottom: 14.h,
                    ),
                    itemCount: charges.length,
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
                              controller.isOpened.value =
                                  !controller.isOpened.value;
                              if (controller.isOpened.value) {
                                controller.animationController.forward();
                              } else {
                                controller.animationController.reverse();
                              }
                              controller.update(["visiblePage"]);
                              // Scaffold.of(context).openEndDrawer();
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
              )),
          Positioned.fill(
            top: 0.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                      child: Column(
                        children: [
                          TextFormField(
                            expands: false,
                            autofocus: false,
                            cursorColor: AppColors.iconGreyColor,
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
                              helperStyle:
                                  const TextStyle(color: AppColors.grey),
                              fillColor: AppColors.white,
                              filled: true,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(
                                  20.0.w, 10.0..h, 20.0.w, 10.0.h),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0.sp),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 3.0),
                              ),
                            ),
                          ),
                        ],
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
                            // width: Get.width / 2.24,
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
                              SizedBox(
                                width: Get.width / 2 - 50,
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
                              )
                            ]),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.sp),
                          ),
                          color: AppColors.white,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: 46.h,
                            // width: Get.width / 2.24.w,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(6.0.sp),
                            ),
                            child: Obx(
                              () => GestureDetector(
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
                      duration: Duration(milliseconds: 300),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        // shadowColor: AppColors.iconGreyColor,
                        borderOnForeground: false,
                        elevation: 14.0,
                        color: AppColors.white,
                        margin: EdgeInsets.only(
                          bottom: Get.height * 0.118.h,
                          left: 12.w,
                          right: 12.w,
                          top: 1.h,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.iconGreyColor,
                                  offset: Offset(0, 0)),
                            ],
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.sp),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: GetBuilder<
                                                FindChargesScreenController>(
                                            id: "visiblePage",
                                            builder: (cont) => GestureDetector(
                                                  onTap: () {
                                                    controller.isVisible = true;
                                                    controller.isOpened.value =
                                                        false;
                                                    controller
                                                        .animationController
                                                        .reverse();
                                                    controller.update(
                                                        ["visiblePage"]);
                                                  },
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Icon(
                                                      Icons.arrow_back_ios_new,
                                                      size: 18.sp,
                                                      color: AppColors
                                                          .iconGreyColor,
                                                    ),
                                                  ),
                                                )),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: CircleAvatar(
                                          // backgroundImage: const AssetImage(
                                          //   "assets/images/starbuckslogo.png",
                                          child: Image.asset(
                                            "assets/images/starbuckslogo.png",
                                            width: 40.w,
                                            height: 40.h,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
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
                                        flex: 6,
                                        child: SizedBox(
                                          width: 2.w,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: GetBuilder<
                                            FindChargesScreenController>(
                                          id: "reportPage",
                                          builder: (cont) => GestureDetector(
                                            onTap: () {
                                              controller.isVisibleReport =
                                                  false;

                                              controller.isOpenedReport.value =
                                                  !controller
                                                      .isOpenedReport.value;
                                              if (controller
                                                  .isOpenedReport.value) {
                                                controller
                                                    .reportAnimationController
                                                    .forward();
                                              } else {
                                                controller
                                                    .reportAnimationController
                                                    .reverse();
                                              }
                                              controller.update(["reportPage"]);
                                            },
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.report_gmailerrorred,
                                                  size: 20.sp,
                                                  color: AppColors.red,
                                                ),
                                                Text(
                                                  'report',
                                                  style: Styles.interRegular(
                                                    color: AppColors.red,
                                                    size: 12.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0.sp),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/findcharges.png"),
                                            fit: BoxFit.fill)),
                                    height: Get.height / 4.2.h,
                                    width: Get.width,
                                  ),
                                  SizedBox(height: 8.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Starbucks",
                                          style: Styles.interBold(
                                            color: AppColors.blackText,
                                            size: 15.sp,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            "Temporarily Closed",
                                            style: Styles.interBold(
                                              color: AppColors.red,
                                              size: 11.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "150 Russell sq,\nSouthamton Row London,\nWC1B 5AL, 2.4 miles",
                                          style: Styles.interLight(
                                            color: AppColors
                                                .offerDetailsAddresTextGrey,
                                            size: 13.sp,
                                          ),
                                          maxLines: 4,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height / 20.h,
                                  ),
                                  Center(
                                    child: Text(
                                      "Google Review Score",
                                      style: Styles.interRegular(
                                        color: AppColors.blackText,
                                        size: 14.sp,
                                      ),
                                      maxLines: 4,
                                    ),
                                  ),
                                  Center(
                                    child: RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        size: 18.sp,
                                        color: AppColors.yellowStarRatingColor,
                                      ),
                                      onRatingUpdate: (rating) {},
                                      unratedColor:
                                          AppColors.whiteStarRatingColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height / 20.h,
                                  ),
                                  PrimaryButton(
                                    onPressed: () {},
                                    height: 56.h,
                                    width: Get.width,
                                    color: AppColors.whiteStarRatingColor,
                                    child: Center(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.discount,
                                                color:
                                                    AppColors.seeOfferBtnColor,
                                                size: 24.sp,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                " See Offers",
                                                style: Styles.interRegular(
                                                  color: AppColors
                                                      .seeOfferBtnColor,
                                                  size: 20.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  PrimaryButton(
                                    onPressed: () {},
                                    height: 56.h,
                                    width: Get.width,
                                    color: AppColors.green,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              EvaIcons.navigation2,
                                              color: AppColors.blackText,
                                              size: 20.sp,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              " Navigate",
                                              style: Styles.interRegular(
                                                color: AppColors.blackText,
                                                size: 20.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))),
            ),
          ),
          GetBuilder<FindChargesScreenController>(
            id: "reportPage",
            builder: (cont) => AnimatedPositioned(
              curve: Curves.easeInOut,
              top: 0,
              bottom: 0,
              right: 2,
              left: controller.isOpened.value ? 2 : Get.width,
              duration: Duration(milliseconds: 300),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.sp),
                ),
                borderOnForeground: false,
                elevation: 14.0,
                color: AppColors.white,
                margin: EdgeInsets.only(
                  bottom: Get.height * 0.118.h,
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
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.sp, vertical: 10.sp),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child:
                                      GetBuilder<FindChargesScreenController>(
                                    id: "reportPage",
                                    builder: (cont) => GestureDetector(
                                      onTap: () {
                                        controller.isVisibleReport = true;
                                        controller.isOpenedReport.value = false;
                                        controller.reportAnimationController
                                            .reverse();
                                        controller.update(["reportPage"]);
                                      },
                                      child: Align(
                                        alignment: Alignment.topLeft,
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
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Report Issue",
                                      style: Styles.interRegular(
                                          color: AppColors.blackText,
                                          size: 15.sp),
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
                                          color:
                                              AppColors.grey.withOpacity(0.2)),
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
                                      size: 20.sp, color: AppColors.blackText)),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
