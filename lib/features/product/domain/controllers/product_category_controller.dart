import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/features/category/data/models/category.dart';
import 'package:fazmenu/features/product/data/models/category_radio.dart';
import 'package:get/get.dart';

class ProductCategoryController extends GetxController {
  Constants constants = Constants();
  RxBool isLoading = false.obs;
  final RxList<CategoryRadio> _listRadio = <CategoryRadio>[].obs;
  RxList<CategoryRadio> get listRadio => _listRadio;
  RxString categoryChoices = ''.obs;

  final RxList<Category> _categoryList = <Category>[].obs;

  @override
  void onInit() async {
    await getCategory();
    super.onInit();
  }

  Future getCategory() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 0));
    _categoryList.addAll(constants.categoryDummy);
    _categoryList.refresh();
    setRadio();
    isLoading(false);
  }

  setRadio() {
    if (_categoryList.isNotEmpty) {
      for (var cat in _categoryList) {
        _listRadio.add(CategoryRadio(
          categoryName: cat.categoryName,
          id: cat.id,
          isSelected: false,
          type: cat.type,
        ));
      }
      _listRadio.refresh();
    }
  }

  toggleRadio(String? index) {
    categoryChoices.value = index!;
  }
}
