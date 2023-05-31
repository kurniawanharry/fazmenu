import 'package:fazmenu/core/components/button/button_menu.dart';
import 'package:fazmenu/core/components/button/button_search.dart';
import 'package:fazmenu/core/components/dropdown/custom_dropdown_field.dart';
import 'package:fazmenu/core/components/text_field/search_text_field.dart';
import 'package:fazmenu/core/util/switchs.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/home/presentation/pages/drawer_navigation.dart';
import 'package:fazmenu/features/home/presentation/widgets/split_view.dart';
import 'package:fazmenu/features/product/domain/controllers/product_controller.dart';
import 'package:fazmenu/features/product/presentation/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';

class ProductScreen extends GetView<ProductController> {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > Constants.maxWidth) {
      return SplitViewWidget(
        widget: Scaffold(
          appBar: AppBar(
            title: const Text('Produk'),
          ),
          body: _body(),
        ),
      );
    } else {
      return Scaffold(
        drawer: kIsWeb ? const DrawerNavigation() : null,
        appBar: AppBar(
          title: const Text('Produk'),
          leading: kIsWeb ? null : const ButtonMenu(),
        ),
        body: _body(),
      );
    }
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: FazColors.blue[600]!,
            ),
            child: Row(
              children: [
                Obx(() {
                  if (controller.isLoading.value) {
                    return progressIndicator(ProgressIndicatorType.circle);
                  } else {
                    return Expanded(
                      child: Visibility(
                        visible: !controller.isSearch.value,
                        replacement: const SearchTextField(),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomDropdownField(
                                items: Constants.productCategory,
                                valueData: 'Semua kategori',
                                onChange: (p0) {},
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: CustomDropdownField(
                                items: Constants.orderHistory,
                                valueData: 'Semua pesanan',
                                onChange: (p0) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }),
                Obx(() {
                  if (controller.isLoading.value) {
                    return progressIndicator(ProgressIndicatorType.circle);
                  } else {
                    return ButtonSearch(
                      isClick: controller.isSearch.value,
                      size: 30,
                      onTap: controller.toggleSearch,
                    );
                  }
                })
              ],
            ),
          ),
          Expanded(
            child: GetX<ProductController>(
              builder: (_) {
                if (controller.isLoading.value) {
                  return progressIndicator(ProgressIndicatorType.circle);
                } else {
                  return ListView.builder(
                    itemCount: controller.productList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemBuilder: (context, index) {
                      var product = controller.productList[index];
                      return ProductCardWidget(
                        imageUrl: product.image,
                        productName: product.productName,
                        productDescription: product.description,
                        productPrice: product.price,
                        isStockExist: product.isStock,
                        isProductExist: product.isReady,
                        productFunction: (value) {
                          controller.toggleReady(product.id!, value);
                        },
                        stockFunction: (value) {
                          controller.toggleStock(product.id!, value);
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton.icon(
                        onPressed: controller.goToProductStock,
                        icon: const Icon(Icons.add),
                        label: const Text('Tambah Stok')),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton.icon(
                        onPressed: controller.goToProductInsert,
                        icon: const Icon(Icons.add),
                        label: const Text('Tambah Produk')),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
