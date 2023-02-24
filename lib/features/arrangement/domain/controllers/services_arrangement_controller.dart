import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesArrangementController extends GetxController {
  late BuildContext context;

  ServiceDate? serviceDate = ServiceDate.fifteen;

  bool? takeIn = false;
  bool? takeOut = false;
  bool? stayIn = false;
  bool? scheduleOrder = false;
  bool? editSchedule = false;

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  toggleServiceDate(ServiceDate? value) {
    serviceDate = value;
    update();
  }

  toggleTakeIn(bool? value) {
    takeIn = value;
    update();
  }

  toggleTakeOut(bool? value) {
    takeOut = value;
    update();
  }

  toggleStayIn(bool? value) {
    stayIn = value;
    update();
  }

  toggleScheduleOrder(bool? value) {
    scheduleOrder = value;
    update();
  }

  toggleSchedule() {
    editSchedule = !editSchedule!;
    update();
  }

  ///ROUTES
  goToAddress() {
    Get.toNamed('/address');
  }
}
