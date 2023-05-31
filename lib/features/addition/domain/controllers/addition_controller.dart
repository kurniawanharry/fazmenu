import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/features/addition/data/models/addition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdditionController extends GetxController {
  late BuildContext context;
  Constants constants = Constants();
  RxBool isLoading = false.obs;
  final RxList<Addition> _additionList = <Addition>[].obs;
  RxList<Addition> get additionList => _additionList;

  @override
  void onInit() async {
    context = Get.context!;
    await getAddition();
    super.onInit();
  }

  Future getAddition() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    _additionList.addAll(constants.additionListDummy);
    isLoading(false);
  }

  ///ROUTES
  goToInsertAddition() {
    Get.toNamed('/insertAddition');
  }
}
