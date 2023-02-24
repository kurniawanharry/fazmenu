import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class CustomCheckboxTile extends StatelessWidget {
  const CustomCheckboxTile({
    super.key,
    this.title,
    this.value,
    this.onChanged,
  });

  final String? title;
  final bool? value;
  final Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        const SizedBox(width: 5),
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: FazColors.slate[600],
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
