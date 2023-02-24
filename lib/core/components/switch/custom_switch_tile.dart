import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class CustomSwitchTile extends StatelessWidget {
  const CustomSwitchTile({
    super.key,
    this.title,
    this.subTitle,
    this.value,
    this.onChanged,
  });

  final Widget? title;
  final Widget? subTitle;
  final bool? value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subTitle,
      trailing: Transform.scale(
        // alignment: Alignment.centerLeft,
        scale: 0.9,
        child: Switch(value: value!, onChanged: onChanged),
      ),
    );
  }
}
