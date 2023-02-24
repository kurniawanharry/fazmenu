import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class ButtonEdit extends StatelessWidget {
  const ButtonEdit({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      splashRadius: 16,
      onPressed: onTap,
      icon: const Icon(Icons.edit),
      color: FazColors.slate[400],
      iconSize: 16,
    );
  }
}
