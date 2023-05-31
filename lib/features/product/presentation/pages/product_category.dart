import 'package:fazmenu/core/components/tab/category_tab.dart';
import 'package:fazmenu/core/util/switchs.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/product/domain/controllers/product_category_controller.dart';
import 'package:fazmenu/features/product/presentation/widgets/category_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategory extends GetView<ProductCategoryController> {
  const ProductCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Kategori'),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const CategoryTab(),
              GetX<ProductCategoryController>(
                builder: (_) {
                  if (controller.isLoading.value) {
                    return progressIndicator(ProgressIndicatorType.circle);
                  } else {
                    return Expanded(
                      child: TabBarView(
                        children: [
                          CategoryListWidget(
                            list: controller.listRadio.where((p0) => p0.type == 100).toList(),
                            selectedId: controller.categoryChoices.value,
                            onTap: (p0) {
                              controller.toggleRadio(p0);
                            },
                          ),
                          CategoryListWidget(
                            list: controller.listRadio.where((p0) => p0.type == 200).toList(),
                            selectedId: controller.categoryChoices.value,
                            onTap: (p0) {
                              controller.toggleRadio(p0);
                            },
                          ),
                          CategoryListWidget(
                            list: controller.listRadio,
                            selectedId: controller.categoryChoices.value,
                            onTap: (p0) {
                              controller.toggleRadio(p0);
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
