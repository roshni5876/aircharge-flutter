import 'package:aircharge/app/data/network/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ScreenUtilInit(
        designSize: const Size(372, 812),
        splitScreenMode: false,
        builder: (BuildContext context, Widget? xyz) {
          return GetMaterialApp(
            // key: Get.key,
            onInit: () {
              Get.put(ApiControllerV1());
            
            },
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: ThemeData(
              fontFamily: "Inter",
            ),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
          );
        }),
  );
}
