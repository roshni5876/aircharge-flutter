import 'package:aircharge/app/data/models/error_model.dart';
import 'package:aircharge/app/data/models/list_map.dart';
import 'package:aircharge/app/data/repostorys/api_repostory.dart';
import 'package:aircharge/app/data/response_dto/find_charges_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class FindChargesScreenController extends GetxController
    with GetTickerProviderStateMixin {
  late ApiRepostory _apiRepostory;

  @override
  void onInit() {
    super.onInit();
    // getFindChargesListLoctionsList();
    update(["details"]);
    charges;

    scrollController.addListener(_scrollListener);

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    update(["visiblePage"]);
    reportAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    update(["reportPage"]);
    update(["reportPageCommentTextArea"]);
    update(["mapViewVisiblePage"]);
  }

  @override
  void dispose() {
    animationController.dispose();
    reportAnimationController.dispose();
    textarea.dispose();
    super.dispose();
  }

  ///Call DashbordScreen
  void findChargesResetState() {
    isVisible = true;
    isOpened.value = false;
    update(["visiblePage"]);
    isVisibleReport = true;
    isOpenedReport.value = false;
    update([
      "reportPage",
    ]);
  }

  TextEditingController textarea = TextEditingController();

  ///For Listviw Items
  final ScrollController scrollController = ScrollController();
  RxInt visibleItemCount = 3.obs;

    void _scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      // User reached the end of the list, load more items
      visibleItemCount += 10; // Adjust the number of items to load as needed
    }
  }

  /// For Details Screens
  RxBool isOpened = false.obs;

  late final AnimationController animationController;

  final _isVisible = true.obs;
  bool get isVisible => _isVisible.value;
  set isVisible(bool value) => _isVisible.value = value;

  ///For Report Screen
  RxBool isOpenedReport = false.obs;

  final _maxCharacters = 500.obs;
  int get maxCharacters => this._maxCharacters.value;
  set maxCharacters(int value) => this._maxCharacters.value = value;

  late final AnimationController reportAnimationController;

  final _isVisibleReport = true.obs;
  bool get isVisibleReport => _isVisibleReport.value;
  set isVisibleReport(bool value) => _isVisibleReport.value = value;

  ///For Map View

  final _isMapViewVisible = true.obs;
  bool get isMapViewVisible => _isMapViewVisible.value;
  set isMapViewVisible(bool value) => _isMapViewVisible.value = value;

  GoogleMapController? googleMapController;

  final _isVisibleMapView = false.obs;
  bool get isVisibleMapView => _isVisibleMapView.value;
  set isVisibleMapView(bool value) => _isVisibleMapView.value = value;

  final _drowerIndex = 0.obs;
  int get drowerIndex => _drowerIndex.value;
  set drowerIndex(int value) => _drowerIndex.value = value;

  ///API
  final _findChargesLoctionsList = FindChargesResponceDto().obs;
  FindChargesResponceDto get findChargesLoctionsList =>
      _findChargesLoctionsList.value;
  set findChargesLoctionsList(FindChargesResponceDto value) =>
      _findChargesLoctionsList.value = value;

  Future<FindChargesResponceDto?> getFindChargesListLoctionsList() async {
    try {
      print('###############################################################3');
      final response = await _apiRepostory.findChargesLoctionsList();

      print(
          "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&77777777777777777");
      findChargesLoctionsList = response;
      print("fghjksdfgbgfds");
      print(response.brandName);
      return response;
    } on ErrorResponse catch (e) {
      Logger().d(e.error?.detail ?? '');
    } catch (e) {
      Logger().d(e);
    }
    return null;
  }
}
