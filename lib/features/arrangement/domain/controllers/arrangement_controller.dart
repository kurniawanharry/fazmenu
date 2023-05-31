import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArrangementController extends GetxController {
  late BuildContext context;

  bool? expandBasic = false;
  bool? expandMaterial = false;
  bool? expandPayment = false;
  bool? expandAccount = false;
  bool? expandPos = false;

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  toggleAccount() {
    expandAccount = !expandAccount!;
    update();
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

  togglePos() {
    expandPos = !expandPos!;
    update();
  }

  ///ROUTES
  goToServicesArrangement() {
    Get.toNamed('/service');
  }

  goToPaymentArrangement() {
    Get.toNamed('/payment');
  }
}
