import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/features/category/data/models/category.dart';
import 'package:fazmenu/features/product/domain/controllers/product_controller.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  Constants constants = Constants();

  RxBool changeOrder = false.obs;
  RxBool isLoading = false.obs;

  final RxList<Category> _categoryList = <Category>[].obs;

  RxList<Category> get categoryList => _categoryList;

  final ProductController _productController = Get.find();

  final List<String> _productImage = <String>[].obs;

  List<String> get productImage => _productImage;

  @override
  void onInit() async {
    await getCategory();
    super.onInit();
  }

  Future getCategory() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    _categoryList.addAll(constants.categoryDummy);
    await getProduct();
    isLoading(false);
  }

  Future getProduct() async {
    if (_productController.productList.isNotEmpty) {
      for (var product in _productController.productList) {
        _productImage.add(product.image!);
      }
    }
  }

  toggleOrder() {
    changeOrder.value = !changeOrder.value;
  }
}
