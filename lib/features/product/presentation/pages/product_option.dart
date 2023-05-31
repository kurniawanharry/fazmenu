import 'package:fazmenu/core/components/dropdown/custom_dropdown_field.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:fazmenu/core/values/constants.dart';
import 'package:fazmenu/features/product/presentation/widgets/option_card_widget.dart';
import 'package:flutter/material.dart';

class ProductOption extends StatelessWidget {
  const ProductOption({super.key});

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
                  const SingleLineField(),
                  const SizedBox(height: 10),
                  CustomDropdownField(
                    items: Constants.orderHistory,
                    valueData: 'Semua pesanan',
                    onChange: (p0) {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 5,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const OptionCardWidget();
                },
                separatorBuilder: (context, index) => const SizedBox(height: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Simpan (5)'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
