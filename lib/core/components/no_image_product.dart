import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoImageProduct extends StatelessWidget {
  const NoImageProduct({
    super.key,
    this.size = 80,
  });

  final double? size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: size,
        width: size,
        padding: const EdgeInsets.all(10),
        color: FazColors.slate[200],
        child: SvgPicture.asset(
          'assets/icons/svg/food.svg',
          alignment: Alignment.center,
          color: FazColors.slate[600],
        ),
      ),
    );
  }
}
