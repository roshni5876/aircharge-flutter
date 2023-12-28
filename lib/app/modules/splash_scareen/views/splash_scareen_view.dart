// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'dart:async';

import 'package:aircharge/app/core/constants/enums.dart';
import 'package:aircharge/app/core/theme/colors.dart';
import 'package:aircharge/app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/splash_scareen_controller.dart';

class SplashScareenView extends GetView<SplashScareenController> {
  const SplashScareenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScareenController());
    return Scaffold(
      body: FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 750)),
          builder: (context, Snapshot) {
            if (Snapshot.connectionState == ConnectionState.done) {
              return const TextColorChangeDemo();
            }
            return Container();
          }),
    );
  }
}

class TextColorChangeDemo extends StatefulWidget {
  const TextColorChangeDemo({super.key});

  @override
  _TextColorChangeDemoState createState() => _TextColorChangeDemoState();
}

class _TextColorChangeDemoState extends State<TextColorChangeDemo>
    with TickerProviderStateMixin {
  Color textColor = AppColors.white; // Initial color

  @override
  void initState() {
    super.initState();
    _startColorAnimation();
  }

  @override
  dispose() {
    controller!.dispose();
    super.dispose();
  }

  late final AnimationController? controller = AnimationController(
    duration: const Duration(seconds: 30),
    vsync: this,
  )..repeat();

  void _startColorAnimation() {
    const duration = Duration(seconds: 5);
    const updateInterval = Duration(milliseconds: 100);

    int steps = duration.inMilliseconds ~/ updateInterval.inMilliseconds;
    int step = 0;

    Timer.periodic(updateInterval, (timer) {
      double fraction = step / steps;
      textColor = Color.lerp(Colors.white, Colors.black, fraction)!;

      if (step++ >= steps) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/loading.png',
            ),
            AnimatedBuilder(
              animation: controller!,
              builder: (context, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'air',
                        style: Styles.metaRegular(
                            color: textColor,
                            size: 30.sp,
                            font: FontFamily.meta),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'charge',
                        style: Styles.metaBold(
                            color: textColor,
                            size: 30.sp,
                            font: FontFamily.meta),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
