import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {

  @override
  void onInit() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.onInit();
  }

}