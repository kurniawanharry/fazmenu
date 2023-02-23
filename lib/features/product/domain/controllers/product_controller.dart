import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  late BuildContext context;

  bool? isSearch = false;

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  ///ROUTES
  goToProductInsert() {
    Get.toNamed('/productInsert');
  }

  toggleSearch() {
    isSearch = !isSearch!;
    update();
  }
}
