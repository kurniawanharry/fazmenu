import 'package:fazmenu/core/components/button/button_delete.dart';
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
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: isStock,
              onChanged: checkButton,
            ),
            Text(
              'Stok',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: SingleLineField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: nameController,
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              textStyle: Theme.of(context).textTheme.bodySmall,
            )),
            const SizedBox(width: 5),
            Expanded(
              child: SingleLineField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: priceController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Rp', style: Theme.of(context).textTheme.bodySmall),
                ),
                textStyle: Theme.of(context).textTheme.bodySmall,
                prefixIconConstraints: const BoxConstraints(minWidth: 30, maxWidth: 50),
                prefixTextStyle: Theme.of(context).textTheme.bodySmall,
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
            ),
            const SizedBox(width: 5),
            ButtonDelete(size: 25, onTap: deleteButton),
          ],
        ),
      ],
    );
  }
}
