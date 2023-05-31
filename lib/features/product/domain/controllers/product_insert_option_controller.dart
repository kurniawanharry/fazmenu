import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInsertOptionController extends GetxController {
  late BuildContext context;
  Rx<OpsiRequired> opsiRequired = OpsiRequired.optional.obs;
  Rx<OpsiProduct> opsiProduct = OpsiProduct.one.obs;

  RxBool isProductOptional = false.obs;

  @override
  void onInit() {
    context = Get.context!;
    if (Get.arguments != null) {
      isProductOptional.value = Get.arguments!;
    }
    super.onInit();
  }

  goToOption() {
    Get.toNamed('/productOption');
  }

  toggleProduct(OpsiProduct value) {
    if (value != opsiProduct.value) {
      opsiProduct.value = value;
    }
  }

  toggleRequired(OpsiRequired value) {
    if (value != opsiRequired.value) {
      opsiRequired.value = value;
    }
  }
}
