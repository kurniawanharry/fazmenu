import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class DropdownStandard<T> extends StatelessWidget {
  const DropdownStandard({
    Key? key,
    required this.items,
    required this.valueData,
    required this.onChange,
    this.hint,
  }) : super(key: key);

  final List<T> items;
  final T? valueData;
  final String? hint;
  final void Function(T?)? onChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: FazColors.slate[50],
            borderRadius: BorderRadius.circular(5),
          ),
          height: 40,
          width: double.infinity,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        hint: Text(hint ?? '', style: Theme.of(context).textTheme.bodySmall),
        items: items.map<DropdownMenuItem<T>>(
          (value) {
            return DropdownMenuItem<T>(
              value: value,
              child: Text(
                value.toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          },
        ).toList(),
        value: valueData,
        onChanged: onChange,
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 15,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(height: 35),
      ),
    );
  }
}
