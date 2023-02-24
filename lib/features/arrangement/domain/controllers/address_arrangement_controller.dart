import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressArrangementController extends GetxController {
  late BuildContext context;

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  // void onChanged(String value) {
  //   msisdnController.text = useAblePhoneNumberUser(value, complete: false);
  //   msisdnController.selection =
  //       TextSelection.fromPosition(TextPosition(offset: msisdnController.text.length));
  //   update();
  // }
}
