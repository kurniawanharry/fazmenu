import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.size = 16,
    this.onTap,
    this.icon,
  }) : super(key: key);

  final IconData? icon;
  final double? size;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 40, maxWidth: 50),
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      splashRadius: 20,
      onPressed: onTap,
      icon: Icon(
        icon,
        size: size,
        color: FazColors.neutral[400],
      ),
    );
  }
}
