import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArrangementController extends GetxController {
  late BuildContext context;

  bool? expandBasic = false;
  bool? expandMaterial = false;
  bool? expandPayment = false;

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  toggleBasic() {
    expandBasic = !expandBasic!;
    update();
  }

  toggleMaterial() {
    expandMaterial = !expandMaterial!;
    update();
  }

  togglePayment() {
    expandPayment = !expandPayment!;
    update();
  }

  ///ROUTES
  goToServicesArrangement() {
    Get.toNamed('/service');
  }
}
