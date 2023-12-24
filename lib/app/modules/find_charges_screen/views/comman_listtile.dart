import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/data/models/list_map.dart';
import 'package:aircharge/app/modules/find_charges_screen/controllers/find_charges_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommanListTile extends GetView<FindChargesScreenController> {
  final String img;
  final String title;
  final String subTitle;
  const CommanListTile(
      {super.key,
      required this.img,
      required this.title,
      required this.subTitle});

  // get img => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: 26,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    img,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Styles.metaBold(
                          color: AppColors.black,
                          size: 18.sp,
                        ),
                      ),
                      Text(
                        subTitle,
                        style: Styles.metaRegular(
                          color: AppColors.icongrey,
                          size: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 22,
                  color: AppColors.darkGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
