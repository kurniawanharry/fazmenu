import 'package:flutter/material.dart';

class CustomSwitchTile extends StatelessWidget {
  const CustomSwitchTile({
    super.key,
    this.title,
    this.subTitle,
    this.value,
    this.onChanged,
    this.icon,
  });

  final Widget? title;
  final Widget? subTitle;
  final bool? value;
  final IconData? icon;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
      contentPadding: const EdgeInsets.only(left: 15, right: 10),
      leading: icon != null
          ? Padding(
              padding: subTitle != null ? const EdgeInsets.only(top: 5) : EdgeInsets.zero,
              child: Icon(icon),
            )
          : null,
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
