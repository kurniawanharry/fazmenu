import 'package:flutter/material.dart';

class LabelColor extends StatelessWidget {
  final String text;
  final double height;
  final double radius;
  final double fontSize;
  final Color color;
  final Color? fontColor;
  final bool strongColor;
  final Widget? child;
  final bool? withBorder;
  const LabelColor({
    Key? key,
    this.text = '',
    this.height = 25,
    this.radius = 4,
    this.color = const Color(0xffA7A7A7),
    this.fontSize = 12,
    this.strongColor = false,
    this.fontColor,
    this.child,
    this.withBorder = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: withBorder!
              ? BoxDecoration(
                  color: strongColor ? color : color.withAlpha(40),
                  borderRadius: BorderRadius.circular(radius),
                )
              : null,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: fontColor ?? color, fontSize: fontSize),
              ),
              child ?? const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
