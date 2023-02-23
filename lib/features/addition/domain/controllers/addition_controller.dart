import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdditionController extends GetxController {
  late BuildContext context;

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  ///ROUTES
  goToInsertAddition() {
    Get.toNamed('/insertAddition');
  }
}
