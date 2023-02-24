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
    return SizedBox(
      height: 30,
      width: 30,
      child: IconButton(
        padding: EdgeInsets.zero,
        splashRadius: 16,
        onPressed: onTap,
        icon: const Icon(Icons.edit),
        color: FazColors.slate[400],
        iconSize: 16,
      ),
    );
  }
}
