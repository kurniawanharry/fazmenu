import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    this.size = 18,
    this.onTap,
    this.icon,
    this.color,
  }) : super(key: key);

  final IconData? icon;
  final double? size;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: IconButton(
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
          color: color ?? FazColors.blue[600],
        ),
      ),
    );
  }
}
