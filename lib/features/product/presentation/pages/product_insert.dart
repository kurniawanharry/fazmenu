import 'package:dotted_border/dotted_border.dart';
import 'package:fazmenu/core/components/list_tile/radio_tile.dart';
import 'package:fazmenu/core/components/list_tile/title_list_tile.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/product/domain/controllers/product_insert_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductInsert extends StatelessWidget {
  const ProductInsert({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductInsertController>(
      init: ProductInsertController(),
      builder: (get) {
        return Scaffold(
          appBar: AppBar(title: Text('Tambah Produk')),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
                const TitleListTile(
                  icon: Icons.image_outlined,
                  title: 'Gambar Produk',
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 20),
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: DottedBorder(
                          dashPattern: const [8, 4],
                          strokeWidth: 2,
                          radius: const Radius.circular(10),
                          color: FazColors.blue[300]!,
                          borderType: BorderType.RRect,
                          child: InkWell(
                            onTap: () {},
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Icon(
                                      Icons.image_outlined,
                                      color: FazColors.blue[300],
                                    ),
                                  ),
                                  Text(
                                    'Tambah Produk',
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontSize: 10,
                                          color: FazColors.blue[300],
                                        ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // ReorderableGridView.count(
                      //   shrinkWrap: true,
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   onReorder: (oldIndex, newIndex) {},
                      //   crossAxisCount: 4,
                      //   childAspectRatio: 1,
                      //   crossAxisSpacing: 10,
                      //   mainAxisSpacing: 10,
                      //   footer: [
                      //     DottedBorder(
                      //       dashPattern: const [8, 4],
                      //       strokeWidth: 2,
                      //       radius: const Radius.circular(10),
                      //       color: FazColors.blue[300]!,
                      //       borderType: BorderType.RRect,
                      //       child: InkWell(
                      //         onTap: () {},
                      //         child: Center(
                      //           child: Column(
                      //             mainAxisSize: MainAxisSize.min,
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Padding(
                      //                 padding: const EdgeInsets.only(bottom: 10),
                      //                 child: Icon(
                      //                   Icons.image_outlined,
                      //                   color: FazColors.blue[300],
                      //                 ),
                      //               ),
                      //               Text(
                      //                 'Tambah Produk',
                      //                 style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      //                       fontSize: 10,
                      //                       color: FazColors.blue[300],
                      //                     ),
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    children: [
                      const TitleListTile(
                        icon: Icons.book_outlined,
                        title: 'Nama',
                        isNeeded: true,
                      ),
                      SingleLineField(
                        controller: get.textNameController,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    children: [
                      const TitleListTile(
                        icon: Icons.type_specimen_outlined,
                        title: 'Tipe Produk',
                        isNeeded: true,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: RadioTile(
                                isSelected: get.productType == ProductType.unit,
                                title: 'Produk Satuan',
                                onTap: () {
                                  get.updateType(ProductType.unit);
                                }),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: RadioTile(
                              isSelected: get.productType == ProductType.package,
                              title: 'Produk Paket',
                              onTap: () {
                                get.updateType(ProductType.package);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    children: [
                      const TitleListTile(
                        icon: Icons.code,
                        title: 'Kode SKU',
                        isNeeded: false,
                        iconTitle: Icons.info_outline,
                      ),
                      SingleLineField(
                        controller: get.textPosController,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    children: [
                      const TitleListTile(
                        icon: Icons.description_outlined,
                        title: 'Deskripsi',
                      ),
                      SingleLineField(
                        controller: get.textDescriptionController,
                        inputType: TextInputType.multiline,
                        inputAction: TextInputAction.newline,
                        hint: '',
                        minLine: 5,
                        maxLine: 7,
                        maxLength: 1000,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    children: [
                      const TitleListTile(
                        icon: Icons.discount_outlined,
                        title: 'Harga',
                        isNeeded: true,
                      ),
                      SingleLineField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text('Rp', style: Theme.of(context).textTheme.bodyMedium),
                        ),
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        prefixIconConstraints: const BoxConstraints(minWidth: 35, maxWidth: 40),
                        prefixTextStyle: Theme.of(context).textTheme.bodyMedium,
                        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TitleListTile(
                      icon: Icons.category_outlined,
                      title: 'Kategori',
                      isNeeded: true,
                      trailing: TextButton(onPressed: () {}, child: Text('Pilih'))),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TitleListTile(
                      icon: Icons.change_circle_outlined,
                      title: 'Ubahan',
                      trailing: TextButton(onPressed: () {}, child: Text('Tambah'))),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      const TitleListTile(
                        icon: Icons.stacked_bar_chart,
                        title: 'Stok',
                        isNeeded: true,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: RadioTile(
                              isSelected: get.productStock == ProductStock.always,
                              title: 'Selalu Tersedia',
                              onTap: () {
                                get.updateStock(ProductStock.always);
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: RadioTile(
                              isSelected: get.productStock == ProductStock.setting,
                              title: 'Atur Stok',
                              onTap: () {
                                get.updateStock(ProductStock.setting);
                              },
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: get.productStock == ProductStock.setting,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text('Stok'),
                                  ),
                                  Expanded(
                                    child: SingleLineField(
                                      controller: get.textStockController,
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      contentPadding:
                                          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                      textStyle: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          value: get.stockAlert,
                                          onChanged: get.updateStockAlert,
                                        ),
                                        Text(
                                          'Stok Alert',
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleLineField(
                                      controller: get.textStockAlertController,
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      contentPadding:
                                          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                      textStyle: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.image),
                    label: const Text('Pratinjau Produk'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
