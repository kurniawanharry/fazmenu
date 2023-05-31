import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class CustomChipNeutral extends StatelessWidget {
  const CustomChipNeutral({
    super.key,
    this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: FazColors.slate[200],
      ),
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: FazColors.slate[600],
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
