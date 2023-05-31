import 'package:fazmenu/core/components/button/button_exit.dart';
import 'package:flutter/material.dart';

class HeaderBottomSheet extends StatelessWidget {
  const HeaderBottomSheet({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        visualDensity: const VisualDensity(
          vertical: VisualDensity.minimumDensity,
          horizontal: VisualDensity.minimumDensity,
        ),
        leading: const ButtonExit(),
        title: Text(title ?? '', style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
