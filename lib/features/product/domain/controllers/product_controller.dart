import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/features/product/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  late BuildContext context;
  Constants constants = Constants();

  RxBool isSearch = false.obs;
  RxBool isLoading = false.obs;

  final RxList<Product> _productList = <Product>[].obs;

  RxList<Product> get productList => _productList;

  @override
  void onInit() async {
    context = Get.context!;
    getProduct();
    super.onInit();
  }

  Future getProduct() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    _productList.addAll(constants.productDummy);
    isLoading(false);
  }

  ///FUNCTION
  toggleStock(String id, bool? value) {
    var index = _productList.indexWhere((element) => element.id == id);
    _productList[index].isStock = value;
    _productList.refresh();
  }

  toggleReady(String id, bool? value) {
    var index = _productList.indexWhere((element) => element.id == id);
    _productList[index].isReady = value;
    _productList.refresh();
  }

  ///ROUTES
  goToProductInsert() {
    Get.toNamed('/productInsert');
  }

  goToProductStock() {
    Get.toNamed('/productStock');
  }

  toggleSearch() {
    isSearch.value = !isSearch.value;
  }
}
