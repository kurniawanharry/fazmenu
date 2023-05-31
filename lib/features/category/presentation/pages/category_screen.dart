import 'package:fazmenu/core/components/button/buttom_buttom.dart';
import 'package:fazmenu/core/components/button/button_menu.dart';
import 'package:fazmenu/core/components/tab/category_tab.dart';
import 'package:fazmenu/core/util/switchs.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/category/data/models/category.dart';
import 'package:fazmenu/features/category/domain/controllers/category_controller.dart';
import 'package:fazmenu/features/category/presentation/widgets/category_card_widget.dart';
import 'package:fazmenu/features/home/presentation/pages/drawer_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori'),
        leading: kIsWeb ? null : const ButtonMenu(),
      ),
      drawer: kIsWeb ? const DrawerNavigation() : null,
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const CategoryTab(),
              Expanded(
                child: TabBarView(
                  children: [
                    Obx(
                      () {
                        if (controller.isLoading.value) {
                          return progressIndicator(ProgressIndicatorType.circle);
                        } else {
                          return _categoryList(
                              controller.categoryList.where((p0) => p0.type == 100).toList());
                        }
                      },
                    ),
                    Obx(
                      () {
                        if (controller.isLoading.value) {
                          return progressIndicator(ProgressIndicatorType.circle);
                        } else {
                          return _categoryList(
                              controller.categoryList.where((p0) => p0.type == 200).toList());
                        }
                      },
                    ),
                    Obx(
                      () {
                        if (controller.isLoading.value) {
                          return progressIndicator(ProgressIndicatorType.circle);
                        } else {
                          return _categoryList(
                              controller.categoryList.where((p0) => p0.type == 300).toList());
                        }
                      },
                    ),
                  ],
                ),
              ),
              Obx(
                () => Visibility(
                  visible: !controller.changeOrder.value,
                  replacement: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtomButton(
                        iconData: Icons.cancel,
                        ontap: () {
                          controller.toggleOrder();
                        },
                        text: 'Batal',
                      ),
                      ButtomButton(
                        iconData: Icons.save,
                        ontap: () {},
                        text: 'Simpan',
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtomButton(
                        iconData: MdiIcons.sort,
                        ontap: () {
                          controller.toggleOrder();
                        },
                        text: 'Ubah Urutan',
                      ),
                      ButtomButton(
                        iconData: Icons.add,
                        ontap: () {
                          Get.toNamed('/categoryInsert');
                        },
                        text: 'Tambah Kategori Baru',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ReorderableListView _categoryList(List<Category> category) {
    return ReorderableListView.builder(
      shrinkWrap: true,
      itemCount: category.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemBuilder: (context, index) {
        var cat = category[index];
        return CategoryCardWidget(
          key: ValueKey(index),
          changeOrder: controller.changeOrder.value,
          categoryName: cat.categoryName,
          productImage: controller.productImage,
        );
      },
      buildDefaultDragHandles: controller.changeOrder.value,
      onReorder: (oldIndex, newIndex) {},
    );
  }
}
