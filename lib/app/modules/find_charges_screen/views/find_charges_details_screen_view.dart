import 'package:aircharge/app/core/theme/buttons.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:aircharge/app/routes/app_pages.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FindChargesDetailsScreen extends StatelessWidget {
  const FindChargesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Card(
        elevation: 12,
        margin: EdgeInsets.only(bottom: Get.height * 0.108, left: 8, right: 8),
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
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 18.sp,
                          color: AppColors.icongrey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 2, left: 10, right: 6),
                        child: CircleAvatar(
                          maxRadius: 24,
                          backgroundImage: AssetImage(
                            "assets/images/starbuckslogo.png",
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Starbucks",
                          style: Styles.metaRegular(
                            color: AppColors.black,
                            size: 18.sp,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.toNamed(Routes.REPORT_ISSUE_SCREEN);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.report_gmailerrorred,
                              size: 20.sp,
                              color: AppColors.red,
                            ),
                            Text(
                              'repot',
                              style: Styles.metaRegular(
                                color: AppColors.red,
                                size: 14.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image:
                                AssetImage("assets/images/starbucksposter.png"),
                            fit: BoxFit.fill)),
                    height: Get.height / 3.6,
                    width: Get.width,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Starbucks",
                        style: Styles.metaBold(
                          color: AppColors.black,
                          size: 18.sp,
                        ),
                      ),
                      Text(
                        "Temporarily Closed",
                        style: Styles.metaBold(
                          color: AppColors.red,
                          size: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "150 Russell sq, Southamton Row London,WC1B 5AL, 2.4 miles",
                    style: Styles.metaRegular(
                      color: AppColors.icongrey,
                      size: 14.sp,
                    ),
                    maxLines: 4,
                  ),
                  const Spacer(),
                  Center(
                    child: Text(
                      "Google Review Score",
                      style: Styles.metaRegular(
                        color: AppColors.icongrey,
                        size: 16.sp,
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
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    onPressed: () {},
                    height: 74,
                    width: Get.width,
                    color: AppColors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.discount,
                          color: AppColors.grey,
                          size: 24.sp,
                        ),
                        Text(
                          " See Offers",
                          style: Styles.metaRegular(
                            color: AppColors.icongrey,
                            size: 24.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  PrimaryButton(
                      onPressed: () {},
                      height: 74,
                      width: Get.width,
                      color: AppColors.green.withOpacity(0.8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            EvaIcons.navigation2,
                            color: AppColors.black.withOpacity(0.7),
                            size: 24.sp,
                          ),
                          Text(
                            " Navigate",
                            style: Styles.metaRegular(
                              color: AppColors.black,
                              size: 24.sp,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
