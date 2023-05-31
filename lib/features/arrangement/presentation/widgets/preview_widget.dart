import 'package:fazmenu/core/values/colors.dart';
import 'package:flutter/material.dart';

class PreviewWidget extends StatelessWidget {
  const PreviewWidget({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.info,
        color: FazColors.yellow[400],
      ),
      minLeadingWidth: 0,
      tileColor: FazColors.yellow[50],
      visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      title: Text(
        title ?? '',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: FazColors.yellow[400]),
      ),
    );
  }
}
