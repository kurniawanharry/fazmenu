import 'package:fazmenu/features/addition/presentation/widgets/optional_addition_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdditionInsertController extends GetxController {
  late BuildContext context;

  final TextEditingController modNameController = TextEditingController();
  List<TextEditingController> optionNameController = [];
  List<TextEditingController> optionPriceController = [];
  List<bool> optionStokController = [];

  List<Widget> optionWidget = [];

  @override
  void onInit() {
    context = Get.context!;
    super.onInit();
  }

  addOptionalAddition() {
    optionWidget.add(optionalAddition());
    update();
  }

  deleteOptionalAddition(Key key) {
    var index = optionWidget.indexWhere((element) => element.key == key);
    optionWidget.removeAt(index);
    optionNameController.removeAt(index);
    optionPriceController.removeAt(index);
    optionStokController.removeAt(index);
    update();
  }

  changeStockValue(Key key, bool value) {
    var index = optionWidget.indexWhere((element) => element.key == key);
    optionStokController[index] = value;
    update();
  }

  Widget optionalAddition() {
    TextEditingController? nameController = TextEditingController();
    TextEditingController? priceController = TextEditingController();
    bool? isStock = false;

    optionNameController.add(nameController);
    optionPriceController.add(priceController);
    optionStokController.add(isStock);

    var key = ValueKey('key_${optionWidget.length}');

    return GetBuilder<AdditionInsertController>(
      key: key,
      builder: (get) {
        return OptionalAdditionWidget(
          nameController: nameController,
          priceController: priceController,
          isStock: optionStokController[optionWidget.isNotEmpty
              ? optionWidget.indexWhere((element) => element.key == key)
              : 0],
          checkButton: (value) {
            get.changeStockValue(key, value!);
          },
          deleteButton: () {
            get.deleteOptionalAddition(key);
          },
        );
      },
    );
  }
}
