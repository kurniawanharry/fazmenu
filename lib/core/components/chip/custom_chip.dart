import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    this.text,
    this.color,
  });

  final String? text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color ?? FazColors.amber[400],
      ),
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: FazColors.white,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
