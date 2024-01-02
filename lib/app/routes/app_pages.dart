// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import '../modules/dashborad_scareen/bindings/dashborad_scareen_binding.dart';
import '../modules/dashborad_scareen/views/dashborad_scareen_view.dart';
import '../modules/find_charges_screen/bindings/find_charges_screen_binding.dart';
import '../modules/find_charges_screen/views/find_charges_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/setting_screen/bindings/setting_screen_binding.dart';
import '../modules/setting_screen/views/setting_screen_view.dart';
import '../modules/splash_scareen/bindings/splash_scareen_binding.dart';
import '../modules/splash_scareen/views/splash_scareen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCAREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCAREEN,
      page: () => const SplashScareenView(),
      binding: SplashScareenBinding(),
    ),
    GetPage(
      name: _Paths.DASHBORAD_SCAREEN,
      page: () => const DashboradScareenView(),
      binding: DashboradScareenBinding(),
    ),
    GetPage(
      name: _Paths.FIND_CHARGES_SCREEN,
      page: () => const FindChargesScreenView(),
      binding: FindChargesScreenBinding(),
    ),
    GetPage(
      name: _Paths.SETTING_SCREEN,
      page: () => const SettingScreenView(),
      binding: SettingScreenBinding(),
    ),
  ];
}
