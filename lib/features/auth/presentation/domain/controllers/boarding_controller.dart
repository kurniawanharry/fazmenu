import 'package:carousel_slider/carousel_controller.dart';
import 'package:fazmenu/features/auth/presentation/domain/entities/auth_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardingController extends GetxController {
  late BuildContext context;

  final CarouselController carouselController = CarouselController();

  int activeIndex = 0;

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  changeIndex(int index) {
    activeIndex = index;
    update();
  }

  goToAuth(bool value) {
    Get.toNamed('auth', arguments: AuthArguments(isRegistered: value));
  }
}
