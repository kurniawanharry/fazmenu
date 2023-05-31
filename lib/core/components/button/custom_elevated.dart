import 'package:flutter/material.dart';

class CustomElevated extends StatelessWidget {
  const CustomElevated({
    super.key,
    this.width = double.infinity,
    this.height = 30,
    this.text,
    this.onTap,
  });

  final String? text;
  final double? width;
  final double? height;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(fixedSize: Size(width!, height!)),
      child: Text(text ?? ''),
    );
  }
}
