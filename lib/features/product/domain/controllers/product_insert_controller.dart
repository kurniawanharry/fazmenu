import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInsertController extends GetxController {
  late BuildContext context;

  final Rx<TextEditingController> textNameController = TextEditingController().obs;
  final Rx<TextEditingController> textPosController = TextEditingController().obs;
  final Rx<TextEditingController> textDescriptionController = TextEditingController().obs;
  final Rx<TextEditingController> textPriceController = TextEditingController().obs;
  final Rx<TextEditingController> textStockController = TextEditingController().obs;
  final Rx<TextEditingController> textStockAlertController = TextEditingController().obs;

  Rx<ProductType> productType = ProductType.unit.obs;
  Rx<ProductStock> productStock = ProductStock.always.obs;
  RxBool stockAlert = false.obs;
  final RxString? productCategory = ''.obs;
  final RxList<String>? productList = <String>[].obs;

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  ///ROUTER
  goToCategory() {
    Get.toNamed('/productCategory');
  }

  goToOption() {
    Get.toNamed('/productOption');
  }

  goToInsertOption() {
    Get.toNamed('/productInsertOption', arguments: true);
  }

  updateType(ProductType type) {
    if (productType.value != type) {
      productType.value = type;
    }
  }

  updateStock(ProductStock type) {
    if (productStock.value != type) {
      productStock.value = type;
    }
  }

  updateStockAlert(bool? value) {
    stockAlert.value = value!;
  }
}
