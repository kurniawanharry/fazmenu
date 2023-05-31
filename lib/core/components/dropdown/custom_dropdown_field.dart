import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class CustomDropdownField<T> extends StatelessWidget {
  const CustomDropdownField({
    Key? key,
    required this.items,
    required this.valueData,
    required this.onChange,
    this.focusNode,
    this.hint,
  }) : super(key: key);

  final List<T>? items;
  final T? valueData;
  final String? hint;
  final void Function(T?)? onChange;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<T>(
        validator: (value) {
          if (valueData == null) {
            return 'Pilih dulu ya';
          }
          return null;
        },
        isExpanded: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: focusNode,
        alignment: Alignment.center,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: FazColors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: FazColors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: FazColors.white,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: FazColors.white,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: FazColors.white,
            ),
          ),
          hintText: 'Pilih',
          hintStyle: TextStyle(
            color: FazColors.slate[400],
          ),
          fillColor: FazColors.white,
          filled: true,
        ),
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: FazColors.slate[50],
            borderRadius: BorderRadius.circular(5),
          ),
          height: 30,
          width: double.infinity,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        hint: Text(
          hint ?? '',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 15,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(height: 35),
        items: items!.map<DropdownMenuItem<T>>(
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
      ),
    );
  }
}
