import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInsertController extends GetxController {
  late BuildContext context;

  final TextEditingController textNameController = TextEditingController();
  final TextEditingController textPosController = TextEditingController();
  final TextEditingController textDescriptionController = TextEditingController();
  final TextEditingController textPriceController = TextEditingController();
  final TextEditingController textStockController = TextEditingController();
  final TextEditingController textStockAlertController = TextEditingController();

  ProductType? productType = ProductType.unit;
  ProductStock? productStock = ProductStock.always;
  bool? stockAlert = false;

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  updateType(ProductType type) {
    if (productType != type) {
      productType = type;
      update();
    }
  }

  updateStock(ProductStock type) {
    if (productStock != type) {
      productStock = type;
      update();
    }
  }

  updateStockAlert(bool? value) {
    stockAlert = value;
    update();
  }
}
