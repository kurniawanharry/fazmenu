import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonDelete extends StatelessWidget {
  const ButtonDelete({
    Key? key,
    this.size = 16,
    this.onTap,
  }) : super(key: key);

  final double? size;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: IconButton(
        padding: EdgeInsets.zero,
        splashRadius: 18,
        onPressed: onTap,
        icon: Icon(
          Icons.delete_outline,
          size: size,
          color: FazColors.neutral[400],
        ),
      ),
    );
  }
}
