import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController with GetSingleTickerProviderStateMixin {
  late BuildContext context;

  bool isSearching = false;

  TabController? tabController;

  @override
  void onInit() {
    context = Get.context!;
    tabController = TabController(vsync: this, length: 3);
    super.onInit();
  }

  toggleSearching() {
    isSearching = !isSearching;
    update();
  }
}
