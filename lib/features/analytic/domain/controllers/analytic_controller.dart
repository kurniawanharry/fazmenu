import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyticController extends GetxController {
  late BuildContext context;

  int? tabIndex = 0;

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  updateTab(int? value) {
    tabIndex = value;
    update();
  }

  List<Map<String, Object>> customTab() => [
        {
          'id': 0,
          'title': 'Hari ini',
          'callBack': () {},
        },
        {
          'id': 1,
          'title': '7 Hari terakhir',
          'callBack': () {},
        },
        {
          'id': 2,
          'title': 'Bulan ini',
          'callBack': () {},
        },
        {
          'id': 3,
          'title': '30 Hari Terakhir',
          'callBack': () {},
        },
      ];
}
