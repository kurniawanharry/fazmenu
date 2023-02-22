import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  late BuildContext context;
  bool onBackPress = false;
  final GetStorage _storage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    context = Get.context!;
    await doBoarding();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  void onClose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.onClose();
  }

  doBoarding() async {
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      timer.cancel();
      if (false) {
        Get.offAllNamed('/boarding');
      } else {
        Get.offAllNamed('/home');
      }
    });
  }
}

// bool accessTokenStatus() {
//   // _storage.remove();
//   AccessToken? access = accessToken();

//   if (access == null) {
//     return false;
//   } else {
//     return true;
//   }
// }
