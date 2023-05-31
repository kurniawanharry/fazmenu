import 'package:fazmenu/core/components/button/button_search.dart';
import 'package:fazmenu/core/components/dropdown/custom_dropdown_field.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:flutter/material.dart';

class ProductStock extends StatelessWidget {
  const ProductStock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Stock'),
      ),
      body: SafeArea(
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
                      visible: true,
                      replacement: const SingleLineField(),
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
                  ),
                  ButtonSearch(
                    isClick: false,
                    size: 30,
                    onTap: () {},
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemBuilder: (context, index) {
                  return const Center(child: Text('Produk Kosong'));
                },
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Text('Batch Edit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
