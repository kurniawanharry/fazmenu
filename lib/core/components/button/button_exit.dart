import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ButtonExit extends StatelessWidget {
  const ButtonExit({
    Key? key,
    this.color = FazColors.slate,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: IconButton(
        padding: EdgeInsets.zero,
        splashRadius: 10,
        onPressed: () {
          Get.back();
        },
        icon: SvgPicture.asset(
          'assets/icons/svg/close.svg',
          color: color,
          height: 15,
        ),
      ),
    );
  }
}
