import 'package:flutter/material.dart';

import 'single_line_field.dart';

class PriceTextField extends StatelessWidget {
  const PriceTextField({
    super.key,
    this.controller,
    this.maxHeight = 40,
    this.vertical = 10,
  });

  final TextEditingController? controller;
  final double? maxHeight;
  final double? vertical;

  @override
  Widget build(BuildContext context) {
    return SingleLineField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      prefixIcon: Center(
        child: Text(
          'Rp',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      textStyle: Theme.of(context).textTheme.bodyMedium,
      prefixIconConstraints:
          BoxConstraints(minHeight: 35, maxHeight: maxHeight!, maxWidth: 40, minWidth: 35),
      prefixTextStyle: Theme.of(context).textTheme.bodyMedium,
      contentPadding: EdgeInsets.symmetric(vertical: vertical!),
    );
  }
}
