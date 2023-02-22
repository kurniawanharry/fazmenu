import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late BuildContext context;

  TabController? tabController;

  @override
  void onInit() {
    context = Get.context!;
    tabController = TabController(vsync: this, length: 3);
    super.onInit();
  }
}
