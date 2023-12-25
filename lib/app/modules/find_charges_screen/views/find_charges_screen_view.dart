import 'package:aircharge/app/core/constants/enums.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/data/models/list_map.dart';
import 'package:aircharge/app/modules/find_charges_screen/views/comman_listtile.dart';
import 'package:aircharge/app/modules/find_charges_screen/views/find_charges_details_screen_view.dart';
import 'package:aircharge/app/routes/app_pages.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/find_charges_screen_controller.dart';

class FindChargesScreenView extends GetView<FindChargesScreenController> {
  const FindChargesScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FindChargesScreenController());

    return Scaffold(
      drawerEdgeDragWidth: 0,
      key: controller.scaffoldKey,
      backgroundColor: AppColors.white,
      drawerScrimColor: Colors.transparent,
      endDrawer: FindChargesDetailsScreen(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: TextFormField(
                obscureText: true,
                autofocus: false,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.darkGrey,
                    ),
                    hintText: 'Search Public Charging Locations',
                    helperStyle: const TextStyle(color: AppColors.grey),
                    fillColor: AppColors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 3.0))),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Card(
                  elevation: 2,
                  color: AppColors.white,
                  child: Container(
                    height: 50.h,
                    width: Get.width / 2.24,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(children: [
                      const Icon(
                        EvaIcons.navigation2,
                        color: AppColors.green,
                      ),
                      Flexible(
                        child: Text(
                          'Current Location',
                          style: Styles.metaRegular(
                            color: AppColors.icongrey,
                            size: 18.sp,
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Card(
                  elevation: 2,
                  color: AppColors.white,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 50.h,
                    width: Get.width / 2.24,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.white.withOpacity(0.2),
                      //     offset: const Offset(0, 3),
                      //   ),
                      // ],
                    ),
                    child: Obx(() => InkWell(
                          onTap: () {
                            controller.isMapViewVisible =
                                !controller.isMapViewVisible;
                          },
                          child: Row(children: [
                            Image.asset(
                              controller.isMapViewVisible
                                  ? "assets/images/listview.png"
                                  : "assets/images/mapview.png",
                            ),
                            FittedBox(
                              child: Text(
                                controller.isMapViewVisible
                                    ? " List View"
                                    : ' Map View',
                                style: Styles.metaRegular(
                                  color: AppColors.icongrey,
                                  size: 18.sp,
                                ),
                              ),
                            )
                          ]),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.bgGreyColor,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  itemCount: charges.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: CommanListTile(
                          img: "${charges[index]['image']}",
                          title: charges[index]['title'] ?? "",
                          subTitle: "Southampton row\n2.5 miles",
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
