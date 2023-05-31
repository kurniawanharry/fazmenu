import 'package:fazmenu/core/components/list_tile/title_list_tile.dart';
import 'package:fazmenu/core/components/radio/radio_tile_bold.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/util/validator.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/category/domain/controllers/category_insert_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryInsert extends GetView<CategoryInsertController> {
  const CategoryInsert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kategori'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        const TitleListTile(
                          icon: Icons.book_outlined,
                          title: 'Departemen',
                          isNeeded: true,
                        ),
                        Obx(() => RadioTileBold(
                              isSelected: controller.categoryMeta == CategoryMeta.food.obs,
                              title: 'Makanan',
                              onTap: () {
                                controller.updateCategory(CategoryMeta.food);
                              },
                            )),
                        Obx(() => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: RadioTileBold(
                                isSelected: controller.categoryMeta == CategoryMeta.drink.obs,
                                title: 'Minuman',
                                onTap: () {
                                  controller.updateCategory(CategoryMeta.drink);
                                },
                              ),
                            )),
                        Obx(() => RadioTileBold(
                              isSelected: controller.categoryMeta == CategoryMeta.other.obs,
                              title: 'Lainnya',
                              onTap: () {
                                controller.updateCategory(CategoryMeta.other);
                              },
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        const TitleListTile(
                          icon: Icons.book_outlined,
                          title: 'Nama Kategori',
                          isNeeded: true,
                        ),
                        Obx(
                          () => Form(
                            key: controller.formKey.value,
                            child: SingleLineField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: controller.textEditingController.value,
                              validator: (value) {
                                return emptyValidator(value: value!, fieldName: 'Nama kategori');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.saveButton();
                    },
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
