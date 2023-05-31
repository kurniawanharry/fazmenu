import 'package:dotted_border/dotted_border.dart';
import 'package:fazmenu/core/components/button/button_edit.dart';
import 'package:fazmenu/core/components/chip/custom_chip.dart';
import 'package:fazmenu/core/components/list_tile/title_list_tile.dart';
import 'package:fazmenu/core/components/no_image_product.dart';
import 'package:fazmenu/core/components/radio/radio_tile.dart';
import 'package:fazmenu/core/components/text_field/price_text_field.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/util/function.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/product/domain/controllers/product_insert_controller.dart';
import 'package:fazmenu/features/product/presentation/widgets/bottom_sheet_addition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInsert extends GetView<ProductInsertController> {
  const ProductInsert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Produk')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            _image(context),
            _name(),
            _productType(),
            _sku(),
            _description(),
            _price(context),
            _product(),
            _category(context),
            _productOptional(context),
            _stock(context),
            _button(),
          ],
        ),
      ),
    );
  }

  Column _image(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleListTile(
          icon: Icons.image_outlined,
          title: 'Gambar Produk',
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: DottedBorder(
                    dashPattern: const [8, 4],
                    strokeWidth: 2,
                    radius: const Radius.circular(10),
                    color: FazColors.blue[300]!,
                    borderType: BorderType.RRect,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Icon(
                                Icons.image_outlined,
                                color: FazColors.blue[300],
                              ),
                            ),
                            Text(
                              'Tambah Gambar',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 10,
                                    color: FazColors.blue[300],
                                  ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding _name() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          const TitleListTile(
            icon: Icons.book_outlined,
            title: 'Nama',
            isNeeded: true,
          ),
          SingleLineField(
            controller: controller.textNameController.value,
          ),
        ],
      ),
    );
  }

  Padding _productType() {
    return Padding(
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
                child: Obx(() => RadioTile(
                    isSelected: controller.productType.value == ProductType.unit,
                    title: 'Produk Satuan',
                    onTap: () {
                      controller.updateType(ProductType.unit);
                    })),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Obx(() => RadioTile(
                      isSelected: controller.productType.value == ProductType.package,
                      title: 'Produk Paket',
                      onTap: () {
                        controller.updateType(ProductType.package);
                      },
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding _sku() {
    return Padding(
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
            controller: controller.textPosController.value,
          ),
        ],
      ),
    );
  }

  Padding _description() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          const TitleListTile(
            icon: Icons.description_outlined,
            title: 'Deskripsi',
          ),
          SingleLineField(
            controller: controller.textDescriptionController.value,
            inputType: TextInputType.multiline,
            inputAction: TextInputAction.newline,
            hint: '',
            minLine: 5,
            maxLine: 7,
            maxLength: 1000,
          ),
        ],
      ),
    );
  }

  Padding _price(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: const [
          TitleListTile(
            icon: Icons.discount_outlined,
            title: 'Harga',
            isNeeded: true,
          ),
          PriceTextField()
        ],
      ),
    );
  }

  Widget _product() {
    return GetX<ProductInsertController>(
      builder: (_) {
        return Visibility(
          visible: controller.productType.value == ProductType.package,
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
                  visible: controller.productList?.isNotEmpty ?? false,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const NoImageProduct(
                          size: 50,
                        ),
                        title: const Text('Banana Cake'),
                        subtitle: Text(formatCurrency(1000)),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: const [
                              Icon(Icons.remove),
                              SizedBox(width: 50, child: SingleLineField()),
                              Icon(Icons.add)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _category(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleListTile(
            icon: Icons.category_outlined,
            title: 'Kategori',
            isNeeded: true,
            trailing: TextButton(
              onPressed: controller.goToCategory,
              child: const Text('Pilih'),
            ),
          ),
          Visibility(
            visible: controller.productCategory?.value.isNotEmpty ?? false,
            child: Text('Food', style: Theme.of(context).textTheme.bodySmall),
          )
        ],
      ),
    );
  }

  Widget _productOptional(BuildContext context) {
    return GetX<ProductInsertController>(
      builder: (_) {
        return Visibility(
          visible: controller.productType.value == ProductType.unit,
          replacement: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                TitleListTile(
                  icon: Icons.change_circle_outlined,
                  title: 'Produk Optional',
                  trailing: TextButton(
                    onPressed: controller.goToInsertOption,
                    child: const Text('Tambah'),
                  ),
                ),
                const Visibility(visible: false, child: ProductOptionalWidget()),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                TitleListTile(
                  icon: Icons.change_circle_outlined,
                  title: 'Ubahan',
                  trailing: TextButton(
                    onPressed: () {
                      _showAddition(context);
                    },
                    child: const Text('Tambah'),
                  ),
                ),
                const Visibility(
                  visible: true,
                  child: ChangesWidget(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _stock(BuildContext context) {
    return GetX<ProductInsertController>(
      builder: (_) {
        return Visibility(
          visible: controller.productType.value == ProductType.unit,
          child: Padding(
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
                        isSelected: controller.productStock.value == ProductStock.always,
                        title: 'Selalu Tersedia',
                        onTap: () {
                          controller.updateStock(ProductStock.always);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RadioTile(
                        isSelected: controller.productStock.value == ProductStock.setting,
                        title: 'Atur Stok',
                        onTap: () {
                          controller.updateStock(ProductStock.setting);
                        },
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: controller.productStock.value == ProductStock.setting,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              flex: 2,
                              child: Text('Stok'),
                            ),
                            Expanded(
                              child: SingleLineField(
                                controller: controller.textStockController.value,
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
                                    value: controller.stockAlert.value,
                                    onChanged: controller.updateStockAlert,
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
                                controller: controller.textStockAlertController.value,
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
        );
      },
    );
  }

  Padding _button() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          Get.toNamed('/productPreview');
        },
        icon: const Icon(Icons.image),
        label: const Text('Pratinjau Produk'),
      ),
    );
  }

  Future<dynamic> _showAddition(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return const BottomSheetAddition();
      },
    );
  }
}

class ChangesWidget extends StatelessWidget {
  const ChangesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: const Text('Milkshake Option'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              CustomChip(text: 'Lebih dari satu'),
              CustomChip(text: 'Wajib'),
            ],
          ),
          const Text('Vanilla/Chocolate/Strawberry')
        ],
      ),
      trailing: const ButtonEdit(),
      onTap: () {
        Get.toNamed('/productInsertOption', arguments: false);
      },
    );
  }
}

class ProductOptionalWidget extends StatelessWidget {
  const ProductOptionalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Test'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text('Pilih sampai dengan 1'),
              ),
              Row(
                children: const [
                  CustomChip(text: 'Opsional'),
                ],
              ),
            ],
          ),
          trailing: const ButtonEdit(),
          onTap: () {
            Get.toNamed('/productInsertOption', arguments: false);
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Wrap(
                spacing: 10,
                children: [
                  ...List.generate(
                    5,
                    (index) => const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: NoImageProduct(
                        size: 50,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: FazColors.slate[900]?.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.more_horiz_outlined,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.titleSmall,
                        children: [
                          const TextSpan(
                            text: 'Lihat',
                          ),
                          TextSpan(
                            text: ' 10 ',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: FazColors.amber[400],
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          const TextSpan(
                            text: 'produk',
                          ),
                          const WidgetSpan(child: Icon(Icons.arrow_forward_ios, size: 14))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
