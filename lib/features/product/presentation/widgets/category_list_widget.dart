import 'package:fazmenu/core/components/radio/radio_tile_bold.dart';
import 'package:fazmenu/features/product/data/models/category_radio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
    this.list,
    this.onTap,
    this.selectedId,
  });
  final List<CategoryRadio>? list;
  final Function(String?)? onTap;
  final String? selectedId;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list?.length ?? 0,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var cat = list?[index];
            return RadioTileBold(
              isSelected: cat?.id == selectedId,
              title: cat?.categoryName ?? '',
              onTap: () {
                onTap!(cat?.id);
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 15),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: OutlinedButton.icon(
            onPressed: () {
              Get.toNamed('/categoryInsert');
            },
            icon: const Icon(Icons.add),
            label: const Text('Tambah Kategori Baru'),
          ),
        )
      ],
    );
  }
}
