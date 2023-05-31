import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({
    super.key,
    this.onTap,
    this.size = 20,
  });
  final Function()? onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: IconButton(
        padding: EdgeInsets.zero,
        splashRadius: 20,
        onPressed: onTap,
        icon: const Icon(Icons.arrow_forward_ios_outlined),
        color: FazColors.slate[400],
        iconSize: 10,
      ),
    );
  }
}
