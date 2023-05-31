import 'package:fazmenu/core/components/text_field/single_line_field.dart';
import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.focusNode,
  });

  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return SingleLineField(
      controller: controller,
      smartDashesType: SmartDashesType.enabled,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      prefixIcon: Center(
        child: Icon(
          Icons.search,
          size: 20,
          color: FazColors.slate[400],
        ),
      ),
      prefixIconConstraints:
          const BoxConstraints(minHeight: 35, maxHeight: 40, maxWidth: 40, minWidth: 35),
      hint: 'Cari',
      focusNode: focusNode,
      onChanged: onChanged,
    );
  }
}
