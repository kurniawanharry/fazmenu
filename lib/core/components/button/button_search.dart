import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonSearch extends StatelessWidget {
  const ButtonSearch({
    Key? key,
    this.size = 16,
    this.onTap,
    this.isClick = false,
  }) : super(key: key);

  final double? size;
  final bool? isClick;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      splashRadius: 20,
      onPressed: onTap,
      icon: Icon(
        isClick! ? Icons.clear : Icons.search,
        size: size,
        color: FazColors.white,
      ),
    );
  }
}
