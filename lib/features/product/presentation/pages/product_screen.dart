import 'package:fazmenu/core/components/button/button_search.dart';
import 'package:fazmenu/core/components/dropdown/custom_dropbutton.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/core/values/enums.dart';
import 'package:fazmenu/features/home/presentation/widgets/home_drawer.dart';
import 'package:fazmenu/features/home/presentation/widgets/split_view.dart';
import 'package:fazmenu/features/product/domain/controllers/product_controller.dart';
import 'package:fazmenu/features/product/presentation/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > Constants.maxWidth) {
      return SplitViewWidget(
        navigationPanel: NavigationPanel.product,
        widget: Scaffold(
          appBar: AppBar(
            title: const Text('Produk'),
          ),
          body: _body(),
        ),
      );
    } else {
      return Scaffold(
        drawer: const HomeDrawer(
          navigationPanel: NavigationPanel.product,
        ),
        appBar: AppBar(
          title: const Text('Produk'),
        ),
        body: _body(),
      );
    }
  }

  Widget _body() {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (get) {
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
                    Expanded(
                      child: Visibility(
                        visible: !get.isSearch!,
                        replacement: SingleLineField(),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomDropdown(
                                items: Constants.orderHistory,
                                valueData: 'Semua pesanan',
                                onChange: (p0) {},
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: CustomDropdown(
                                items: Constants.orderHistory,
                                valueData: 'Semua pesanan',
                                onChange: (p0) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ButtonSearch(
                      isClick: get.isSearch,
                      size: 30,
                      onTap: get.toggleSearch,
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemBuilder: (context, index) {
                    return ProductCardWidget();
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
                            onPressed: () {}, icon: Icon(Icons.add), label: Text('Tambah Stok')),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton.icon(
                            onPressed: get.goToProductInsert,
                            icon: Icon(Icons.add),
                            label: Text('Tambah Produk')),
                      ),
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
