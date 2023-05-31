import 'package:fazmenu/core/values/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryInsertController extends GetxController {
  Rx<CategoryMeta> categoryMeta = CategoryMeta.food.obs;

  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final Rx<TextEditingController> textEditingController = TextEditingController().obs;

  updateCategory(CategoryMeta value) {
    categoryMeta.value = value;
  }

  saveButton() {
    if (formKey.value.currentState!.validate()) {
      Get.back();
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
