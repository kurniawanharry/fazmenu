import 'package:fazmenu/core/components/checkbox/custom_checkbox_tile.dart';
import 'package:fazmenu/core/components/header_bottom_sheet.dart';
import 'package:fazmenu/core/components/list_tile/title_list_tile.dart';
import 'package:fazmenu/core/components/no_image_product.dart';
import 'package:fazmenu/core/components/radio/radio_tile_no_border.dart';
import 'package:fazmenu/core/components/text_field/price_text_field.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/product/domain/controllers/product_insert_option_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductInsertOption extends GetView<ProductInsertOptionController> {
  const ProductInsertOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() =>
            Text(controller.isProductOptional.value ? 'Tambah Opsi Produk' : 'Milkshake Option')),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                children: [
                  Obx(() => Visibility(
                        visible: controller.isProductOptional.value,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            children: const [
                              TitleListTile(
                                icon: Icons.book_outlined,
                                title: 'Nama Opsi Produk',
                                isNeeded: true,
                              ),
                              SingleLineField(),
                            ],
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pembeli hanya bisa memilih satu pilihan atau lebih?',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Obx(() => Expanded(
                                    child: RadioTileNoBorder(
                                      isSelected: controller.opsiProduct.value == OpsiProduct.one,
                                      title: 'Hanya satu',
                                      onTap: () {
                                        controller.toggleProduct(OpsiProduct.one);
                                      },
                                    ),
                                  )),
                              Obx(() => Expanded(
                                    child: RadioTileNoBorder(
                                      isSelected: controller.opsiProduct.value == OpsiProduct.more,
                                      title: 'Lebih dari satu',
                                      onTap: () {
                                        controller.toggleProduct(OpsiProduct.more);
                                      },
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Obx(() => Visibility(
                            visible: controller.opsiProduct.value == OpsiProduct.more,
                            child: const SingleLineField()))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pilihan wajib?',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Obx(() => Expanded(
                                    child: RadioTileNoBorder(
                                      isSelected:
                                          controller.opsiRequired.value == OpsiRequired.optional,
                                      title: 'Opsional',
                                      onTap: () {
                                        controller.toggleRequired(OpsiRequired.optional);
                                      },
                                    ),
                                  )),
                              Obx(() => Expanded(
                                    child: RadioTileNoBorder(
                                      isSelected:
                                          controller.opsiRequired.value == OpsiRequired.required,
                                      title: 'Wajib',
                                      onTap: () {
                                        controller.toggleRequired(OpsiRequired.required);
                                      },
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GetX<ProductInsertOptionController>(
                    builder: (_) {
                      return Visibility(
                        visible: controller.isProductOptional.value,
                        replacement: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pilihan',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Column(
                              children: [
                                ListView.separated(
                                  itemCount: 2,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        CustomCheckboxTile(
                                          value: true,
                                          title: 'Vanilla',
                                        ),
                                        SizedBox(width: 100, child: SingleLineField())
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                                )
                              ],
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            children: [
                              TitleListTile(
                                icon: Icons.category_outlined,
                                title: 'Produk',
                                isNeeded: true,
                                trailing: TextButton(
                                  onPressed: controller.goToOption,
                                  child: const Text('Pilih'),
                                ),
                              ),
                              Visibility(
                                child: Column(
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {
                                        _bottomSheetSetPrice(context);
                                      },
                                      child: const Text('Atur harga untuk semua produk'),
                                    ),
                                    ListView.separated(
                                      itemCount: 2,
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const NoImageProduct(size: 70),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: const [
                                                      Text('Brownies'),
                                                      SizedBox(height: 10),
                                                      SizedBox(
                                                          width: 150,
                                                          child: PriceTextField(
                                                            maxHeight: 35,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              iconSize: 25,
                                              icon: Icon(
                                                MdiIcons.trashCanOutline,
                                                color: FazColors.red[600],
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(height: 10),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Simpan'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _bottomSheetSetPrice(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      elevation: 0,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderBottomSheet(
                title: 'Atur harga untuk semua produk',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 15, right: 15),
                child: Column(
                  children: const [
                    TitleListTile(
                      title: 'Produk',
                      isNeeded: true,
                    ),
                    SingleLineField(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Text(
                      'Pengaturan ini akan berlaku untuk semua produk yang bertanda wajib',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Terapkan ke semua'),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
