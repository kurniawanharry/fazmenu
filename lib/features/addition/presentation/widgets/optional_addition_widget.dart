import 'package:fazmenu/core/components/button/button_delete.dart';
import 'package:fazmenu/core/components/checkbox/custom_checkbox_tile.dart';
import 'package:fazmenu/core/components/text_field/price_text_field.dart';
import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:flutter/material.dart';

class OptionalAdditionWidget extends StatelessWidget {
  const OptionalAdditionWidget({
    super.key,
    this.nameController,
    this.priceController,
    this.isStock,
    this.deleteButton,
    this.checkButton,
  });

  final TextEditingController? nameController;
  final TextEditingController? priceController;
  final bool? isStock;
  final Function()? deleteButton;
  final Function(bool?)? checkButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: CustomCheckboxTile(
              title: 'Stok',
              value: isStock,
              onChanged: checkButton,
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: SingleLineField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: nameController,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                boxConstraints:
                    const BoxConstraints(minHeight: 35, maxHeight: 40, maxWidth: 40, minWidth: 35),
              )),
              const SizedBox(width: 5),
              const Expanded(child: PriceTextField(vertical: 5, maxHeight: 40)),
              const SizedBox(width: 5),
              ButtonDelete(size: 25, onTap: deleteButton),
            ],
          ),
        ],
      ),
    );
  }
}
