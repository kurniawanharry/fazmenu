import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class AdditionChip extends StatelessWidget {
  const AdditionChip({
    super.key,
    this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Chip(
      visualDensity: const VisualDensity(
        vertical: VisualDensity.minimumDensity,
        horizontal: VisualDensity.minimumDensity,
      ),
      side: BorderSide.none,
      backgroundColor: FazColors.blue[100],
      labelPadding: EdgeInsets.zero,
      labelStyle: Theme.of(context).textTheme.bodySmall,
      label: Text(
        text ?? '',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: FazColors.blue[600],
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
