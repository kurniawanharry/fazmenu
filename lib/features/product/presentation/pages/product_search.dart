import 'package:fazmenu/core/components/dropdown/custom_dropdown_field.dart';
import 'package:fazmenu/core/components/text_field/search_text_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/features/product/presentation/widgets/product_search_checkbox.dart';
import 'package:flutter/material.dart';

class ProductSearch extends StatelessWidget {
  const ProductSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Produk'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: FazColors.blue[600]!,
              ),
              child: Column(
                children: [
                  const SearchTextField(),
                  const SizedBox(height: 10),
                  CustomDropdownField(
                    items: Constants.orderHistory,
                    valueData: 'Semua pesanan',
                    onChange: (p0) {},
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text('Food'),
                      ),
                      ListView.separated(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const ProductSearchBox();
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 5),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
}
